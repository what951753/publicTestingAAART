package tw.group4._03_.front.shop;

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
import tw.group4._35_.login.model.WebsiteMember;
import tw.group4.util.Hibernate;

@Controller
public class RedirectShopControllerFront {

	@Autowired
	private CreativeShopService css;

	@Hibernate
	@RequestMapping(path = "/03/front/shop/myShop.ctrl", method = RequestMethod.GET)
	public String redirectToMyShop(HttpSession session, Model m) {

		try {
			// 從HttpSession中，獲得memberId
			WebsiteMember member = (WebsiteMember) session.getAttribute("member");
			int memberId = member.getId();

			// 取得該用戶擁有的藝文商店
			List<CreativeShopBean> shopsList = css.selectByMemberId(memberId);
			m.addAttribute("acShopsList", shopsList);

			if (shopsList.size() != 0) {
				m.addAttribute("acShopsList", shopsList);

			} else {
				String acShopsSerachMsg = "還沒有登記商店資料喔!";
				m.addAttribute("acShopsSerachMsg", acShopsSerachMsg);
			}
			
		} catch (Exception e) {
			e.printStackTrace();

			String acShopsSerachMsg = "查詢出錯，請嘗試重新載入";
			m.addAttribute("acShopsSerachMsg", acShopsSerachMsg); // 回傳錯誤訊息
		}
		return "03/front_shop/my_shop";
	}

	@Hibernate
	@RequestMapping(path = "/03/front/shop/createConfirm.ctrl", method = RequestMethod.POST)
	public String redirectToCreateShop(HttpSession session, Model m) {

		try {
			// 從HttpSession中，獲得memberId
			WebsiteMember member = (WebsiteMember) session.getAttribute("member");
			int memberId = member.getId();

			m.addAttribute("memberId", memberId);

		} catch (Exception e) {
			e.printStackTrace();

			String acShopsSerachMsg = "系統出錯，請嘗試重新載入";
			m.addAttribute("acShopsSerachMsg", acShopsSerachMsg); // 回傳錯誤訊息
		}
		return "03/front_shop/create_confirm";
	}

	@Hibernate
	@RequestMapping(path = "/03/front/shop/shopDetails.ctrl", method = RequestMethod.POST)
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
		return "03/front_shop/shop_details";
	}

}
