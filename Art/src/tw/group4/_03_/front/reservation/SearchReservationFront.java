package tw.group4._03_.front.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group4._03_.cms.reservation.model.ShopReservationBean;
import tw.group4._03_.cms.reservation.model.ShopReservationService;
import tw.group4.util.Hibernate;

@Controller
public class SearchReservationFront {

	@Autowired
	private ShopReservationService srs;
	
	@Hibernate
	@RequestMapping(path = "/03/front/reservation/searchReservationByNo.ctrl", method = RequestMethod.POST)
	public String searchReservationByNo(@RequestParam(name = "reservationNo") String reservationNo, Model m) {

		try {
			int no = Integer.parseInt(reservationNo);
			List<ShopReservationBean> reservationList = srs.selectByNo(no);
			/*
			 * 不可使用xxxList != null) xxxList 會含一個空陣列
			 */
			if (reservationList.size() != 0) {
				m.addAttribute("reservationList", reservationList);
			} else {
				String reservationSerachMsg = "查無此預約資料，請重新查詢";
				System.out.println(reservationSerachMsg);
				m.addAttribute("reservationSerachMsg", reservationSerachMsg);
			}
		} catch (Exception e) {
			e.printStackTrace();

			String reservationSerachMsg = "搜尋出錯，請重新查詢";
			m.addAttribute("reservationSerachMsg", reservationSerachMsg); // 回傳錯誤訊息
		}
		return "03/front_reservation/search_return";

	}
	
	@Hibernate
	@RequestMapping(path = "/03/front/reservation/searchReservationByMemberName.ctrl", method = RequestMethod.POST)
	public String searchReservationByMemberName(@RequestParam(name = "memberName") String memberName, Model m) {
		
		try {
			List<ShopReservationBean> reservationList = srs.selectByMemberName(memberName);
			/*
			 * 不可使用xxxList != null) xxxList 會含一個空陣列
			 */
			if (reservationList.size() != 0) {
				m.addAttribute("reservationList", reservationList);
			} else {
				String reservationSerachMsg = "查無此帳號名稱，請重新查詢";
				System.out.println(reservationSerachMsg);
				m.addAttribute("reservationSerachMsg", reservationSerachMsg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			String reservationSerachMsg = "搜尋出錯，請重新查詢";
			m.addAttribute("reservationSerachMsg", reservationSerachMsg); // 回傳錯誤訊息
		}
		return "03/front_reservation/search_return";
	}

	@Hibernate
	@RequestMapping(path = "/03/front/reservation/searchReservationByShopName.ctrl", method = RequestMethod.POST)
	public String searchReservationByShopName(@RequestParam(name = "shopName") String shopName, Model m) {
		
		try {
//			List<ShopReservationBean> reservationList = srs.selectByShopName(shopName);
			
//			if (reservationList.size() != 0) {
//				m.addAttribute("reservationList", reservationList);
//			} else {
//				String reservationSerachMsg = "查無此商店名稱，請重新查詢";
//				m.addAttribute("reservationSerachMsg", reservationSerachMsg);
//			}
		} catch (Exception e) {
			e.printStackTrace();
			
			String reservationSerachMsg = "搜尋出錯，請重新查詢";
			m.addAttribute("reservationSerachMsg", reservationSerachMsg); // 回傳錯誤訊息
		}
		return "03/front_reservation/search_return";
	}
	
	@Hibernate
	@RequestMapping(path = "/03/front/reservation/searchAllReservations.ctrl", method = RequestMethod.POST)
	public String searchAllReservations(Model m) {
		try {
			List<ShopReservationBean> reservationList = srs.selectAll();
			
			if (reservationList.size() != 0) {
				m.addAttribute("reservationList", reservationList);
			} else {
				String reservationSerachMsg = "搜尋出錯，請重新查詢";
				m.addAttribute("reservationSerachMsg", reservationSerachMsg);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			String reservationSerachMsg = "搜尋出錯，請重新查詢";
			m.addAttribute("reservationSerachMsg", reservationSerachMsg); // 回傳錯誤訊息
		}
		return "03/front_reservation/search_return";
	}
}
