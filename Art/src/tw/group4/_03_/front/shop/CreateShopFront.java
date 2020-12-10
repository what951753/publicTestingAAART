package tw.group4._03_.front.shop;

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
public class CreateShopFront {

	@Autowired
	private CreativeShopService css;
	
	@Hibernate
	@RequestMapping(path = "/03/front/shop/createShop.ctrl", method = RequestMethod.POST)
	public String createShop(
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
			CreativeShopBean shop = new CreativeShopBean();
//			測試
//			System.out.println("ShopId = " + shop.getShopId());

			shop.setShopName(shopName);
			shop.setMemberId(Integer.parseInt(memberId));
			shop.setImage(image);
			shop.setIntro(intro);
			
			shop.setCityName(cityName);
			shop.setAddress(address);
			shop.setOpenTime(openTime);
			shop.setPhone(phone);
			shop.setFax(fax);
			
			shop.setEmail(email);
			shop.setFacebook(facebook);
			shop.setWebsite(website);
			shop.setClicks(CustomizedTypeConversion.customizedParseInt(clicks));
			shop.setReservation(Integer.parseInt(reservation));
				
			css.insert(shop);
			String acShopsCreateMsg = "商店資料新建成功";
			m.addAttribute("acShopsCreateMsg", acShopsCreateMsg);

		} catch (Exception e) {
			e.printStackTrace();

			String acShopsCreateMsg = "商店資料新建失敗";
			m.addAttribute("acShopsCreateMsg", acShopsCreateMsg); // 回傳錯誤訊息
		}
		return "03/front_shop/create_return";
	}
}