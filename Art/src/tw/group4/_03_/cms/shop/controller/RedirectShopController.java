package tw.group4._03_.cms.shop.controller;

import java.util.List;

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
public class RedirectShopController {

	@Autowired
	private CreativeShopService css;
	
	@Hibernate
	@RequestMapping(path = "/03/cms/shop/index.ctrl", method = RequestMethod.GET)
	public String redirectToIndex(Model m) {
		try {
			List<CreativeShopBean> shopsList = css.selectAll();
			m.addAttribute("acShopsList", shopsList);

		} catch (Exception e) {
			e.printStackTrace();

			String acShopsSerachMsg = "搜尋出錯，請嘗試重新載入";
			m.addAttribute("acShopsSerachMsg", acShopsSerachMsg); // 回傳錯誤訊息
		}
		return "03/cms_shop/index";
	}
	
	@Hibernate
	@RequestMapping(path = "/03/cms/shop/shopDetails.ctrl", method = RequestMethod.POST)
	public String shopDetails(@RequestParam(name = "shopId") String shopId, Model m) {

		try {
			int id = Integer.parseInt(shopId);
			List<CreativeShopBean> shopsList = css.selectByShopId(id);
			/*
			 * 不可使用(shopsList != null) shopsList 會含一個空字串
			 */
			if (shopsList.size() != 0) {
				m.addAttribute("acShopsList", shopsList);

			} else {
				String acShopsSerachMsg = "搜尋出錯，請重新查詢";
				System.out.println(acShopsSerachMsg);
				m.addAttribute("acShopsSerachMsg", acShopsSerachMsg);
			}
		} catch (Exception e) {
			e.printStackTrace();

			String acShopsSerachMsg = "搜尋出錯，請重新查詢";
			m.addAttribute("acShopsSerachMsg", acShopsSerachMsg); // 回傳錯誤訊息
		}
		return "03/cms_shop/shop_details";
	}
	
}
