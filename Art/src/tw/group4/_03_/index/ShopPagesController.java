package tw.group4._03_.index;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group4._03_.cms.shop.model.CreativeShopBean;
import tw.group4._03_.cms.shop.model.CreativeShopService;
import tw.group4.util.Hibernate;

@Controller
public class ShopPagesController {

	@Autowired
	private CreativeShopService css;

	@RequestMapping(path = "/03/index/shop/template", method = RequestMethod.GET)
	public String redirectToShopTemplate(HttpSession session) {
		return "03/index_shop/template";
	}
	
	@Hibernate
	@RequestMapping(path = "/03/index/shop/index.ctrl", method = RequestMethod.GET)
	public String redirectToShopIndex(HttpSession session, Model m) {

		try {
			List<CreativeShopBean> shopListbyId = css.select16OrderByShopId();
			m.addAttribute("shopListbyId",  shopListbyId);
			
			List<CreativeShopBean> shopListbyPopularity = css.select16OrderByPopularity();
			m.addAttribute("shopListbyPopularity", shopListbyPopularity);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "03/index_shop/index";
	}
	
	@Hibernate
	@RequestMapping(path = "/03/index/shop/shopDetails.ctrl", method = RequestMethod.GET)
	public String redirectToShopDetails(@RequestParam(name = "shopId") String shopId, Model m) {

		try {
			int id = Integer.parseInt(shopId);
			CreativeShopBean shop = css.select(id);
			m.addAttribute("shop", shop);

		} catch (Exception e) {
			e.printStackTrace();

			String acShopsSerachMsg = "搜尋出錯，請嘗試重新載入";
			m.addAttribute("acShopsSerachMsg", acShopsSerachMsg); // 回傳錯誤訊息
		}
		return "03/index_shop/shop_details";
	}
	
}
