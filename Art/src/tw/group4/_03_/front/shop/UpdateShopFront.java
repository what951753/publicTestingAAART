package tw.group4._03_.front.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group4._03_.cms.shop.model.CreativeShopBean;
import tw.group4._03_.cms.shop.model.CreativeShopService;
import tw.group4._03_.cms.util.CustomizedTypeConversion;
import tw.group4.util.Hibernate;

@Controller
public class UpdateShopFront {

	@Autowired
	private CreativeShopService css;
	
	@Hibernate
	@RequestMapping(path = "/03/front/shop/updateShopByShopId.ctrl", method = RequestMethod.POST)
	private String updateShopByShopId(@RequestParam(name = "shopId") String shopId, Model m) {
		
		try {
			int id = Integer.parseInt(shopId);
			List<CreativeShopBean> shopsList = css.selectByShopId(id);
			
			if (shopsList.size() != 0) {
				m.addAttribute("acShopsList", shopsList);
			} else {
				String acShopsSerachMsg = "系統出錯，請嘗試重新載入";
				m.addAttribute("acShopsSerachMsg", acShopsSerachMsg);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			String acShopsSerachMsg = "系統出錯，請嘗試重新載入";
			m.addAttribute("acShopsSerachMsg", acShopsSerachMsg); // 回傳錯誤訊息
		}
		return "03/front_shop/update_confirm";
	}
	
	@Hibernate
	@RequestMapping(path = "/03/front/shop/updateShop.ctrl", method = RequestMethod.POST)
	private String updateShop( 
			@RequestParam(name="shopId") String shopId,
			@RequestParam(name="shopName") String shopName, 
			@RequestParam(name="memberId") String memberId, 
			@RequestParam(name="image") String image,
			@RequestParam(name="intro") String intro, 
			
			@RequestParam(name="cityName") String cityName,
			@RequestParam(name="address") String address,
			@RequestParam(name="openTime") String openTime,
			@RequestParam(name="phone") String phone,
			@RequestParam(name="fax") String fax,
			
			@RequestParam(name="email") String email,
			@RequestParam(name="facebook") String facebook,
			@RequestParam(name="website") String website,
			@RequestParam(name="clicks") String clicks,
			@RequestParam(name="reservation") String reservation,
		
			Model m) {
		try {

			int intShopId = Integer.parseInt(shopId);
			int intMemberId = Integer.parseInt(memberId);
			int intClicks = CustomizedTypeConversion.customizedParseInt(clicks);
			int intReservation = Integer.parseInt(reservation);

			// 執行更新
			css.update(intShopId, shopName, intMemberId, image, intro, 
					cityName, address, openTime, phone, fax, email, facebook,
					website, intClicks, intReservation);

			String acShopsUpdateMsg = "商店資料更新成功";
			m.addAttribute("acShopsUpdateMsg", acShopsUpdateMsg);

		} catch (Exception e) {
			e.printStackTrace();
			String acShopsUpdateMsg = "商店資料更新失敗";
			m.addAttribute("acShopsUpdateMsg", acShopsUpdateMsg); // 回傳錯誤訊息
		}
		return "03/front_shop/update_return";
	}

}
