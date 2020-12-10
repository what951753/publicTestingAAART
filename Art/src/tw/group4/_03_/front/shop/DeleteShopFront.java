package tw.group4._03_.front.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group4._03_.cms.shop.model.CreativeShopService;
import tw.group4.util.Hibernate;

@Controller
public class DeleteShopFront {

	@Autowired
	private CreativeShopService css;

	@Hibernate
	@RequestMapping(path = "/03/front/shop/deleteShop.ctrl", method = RequestMethod.POST)
	public String deleteShop(@RequestParam(name = "shopId") String shopId, Model m) {

		try {
			int id = Integer.parseInt(shopId);
			css.delete(id);

			String acShopsDeleteMsg = "商店資料刪除成功";
			m.addAttribute("acShopsDeleteMsg", acShopsDeleteMsg);

		} catch (Exception e) {
			e.printStackTrace();
			String acShopsDeleteMsg = "商店資料刪除失敗";
			m.addAttribute("acShopsDeleteMsg", acShopsDeleteMsg); // 回傳錯誤訊息
		}
		return "03/front_shop/delete_return";
	}

}
