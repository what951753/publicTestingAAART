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
import tw.group4._03_.cms.restaurant.model.RestaurantBean;
import tw.group4._03_.cms.restaurant.model.RestaurantService;
import tw.group4.util.Hibernate;

@Controller
public class UpdateReservationFront {

	@Autowired
	private RestaurantService rs;
	
	@Autowired
	private ShopReservationService srs;
	
	@Hibernate
	@RequestMapping(path = "/03/front/reservation/updateReservationByNo.ctrl", method = RequestMethod.POST)
	private String updateReservationByNo(@RequestParam(name = "reservationNo") String reservationNo, Model m) {
		
		try {
			int no = Integer.parseInt(reservationNo);
			List<ShopReservationBean> reservationList = srs.selectByNo(no);
			ShopReservationBean reservation = reservationList.get(0);

			// 獲得該時段的剩餘座位數
			List<RestaurantBean> restaurantList = rs.selectByDateTime(reservation.getDateTime());
			RestaurantBean restaurant = restaurantList.get(0);
			
			if(reservation.getTime() == "09:00") {
				String moment = "上午9點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH09();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "10:00") {
				String moment = "上午10點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "11:00") {
				String moment = "上午11點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH11();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "12:00") {
				String moment = "中午12點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH12();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "13:00") {
				String moment = "下午1點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH13();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "14:00") {
				String moment = "下午2點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH14();
				m.addAttribute("remainingNum", remainingNum);

			}else if (reservation.getTime() == "15:00") {
				String moment = "下午3點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "16:00") {
				String moment = "下午4點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "17:00") {
				String moment = "下午5點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "18:00") {
				String moment = "晚上6點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "19:00") {
				String moment = "晚上7點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
				
			}else if (reservation.getTime() == "20:00") {
				String moment = "晚上8點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
				
			}else {
				String moment = "晚上9點";
				m.addAttribute("moment", moment);
				int remainingNum = restaurant.getH10();
				m.addAttribute("remainingNum", remainingNum);
			}
			
			m.addAttribute("reservation", reservation);
			m.addAttribute("restaurant", restaurant);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("搜尋出錯，請重新查詢");
		}
		return "03/front_reservation/update_choose_number";
	}

	
	
	@Hibernate
	@RequestMapping(path = "/03/front/reservation/updateReservation.ctrl", method = RequestMethod.POST)
	private String updateReservation( 
			@RequestParam(name = "reservationNo") String reservationNo,
			@RequestParam(name = "memberId") String memberId, 
			@RequestParam(name = "memberName") String memberName,
			@RequestParam(name = "shopId") String shopId, 
			@RequestParam(name = "shopName") String shopName,

			@RequestParam(name = "customerName") String customerName,
			@RequestParam(name = "customerPhone") String customerPhone,
			@RequestParam(name = "adultsNum") String adultsNum, 
			@RequestParam(name = "childrenNum") String childrenNum,
			@RequestParam(name = "amount") String amount,

			
			@RequestParam(name = "dateTime") String dateTime, 
			@RequestParam(name = "startTime") String startTime, 
			@RequestParam(name = "endTime") String endTime,
			@RequestParam(name = "note") String note,
			Model m) {
		try {
			int intReservationNo = Integer.parseInt(reservationNo);
			int intMemberId = Integer.parseInt(memberId);
			int intShopId = Integer.parseInt(shopId);
			int intAdultsNum = Integer.parseInt(adultsNum);
			int intChildrenNum = Integer.parseInt(childrenNum);
			int intAmount = Integer.parseInt(amount);

			// 執行更新
//			srs.update(intReservationNo, intMemberId, memberName, intShopId, shopName, 
//					customerName, customerPhone, intAdultsNum, intChildrenNum, intAmount, 
//					dateTime, startTime, endTime, note);

			String reservationUpdateMsg = "商店資料修改成功";
			m.addAttribute("reservationUpdateMsg", reservationUpdateMsg);

		} catch (Exception e) {
			e.printStackTrace();
			String reservationUpdateMsg = "商店預約修改失敗，請重新輸入";
			m.addAttribute("reservationUpdateMsg", reservationUpdateMsg); // 回傳錯誤訊息
		}
		return "03/front_reservation/update_return";
	}

//	@RequestMapping(path = "/03/csm/reservation/updateReservationByMemberName.ctrl", method = RequestMethod.POST)
//	private String updateReservationByMemberName(@RequestParam(name = "memberName") String memberName, Model m) {
//
//		try {
//			List<ShopReservationBean> reservationList = srs.selectByMemberName(memberName);
//			/*
//			 * 不可使用xxxList != null) xxxList 會含一個空陣列
//			 */
//			if (reservationList.size() != 0) {
//				m.addAttribute("reservationList", reservationList);
//			} else {
//				String reservationSerachMsg = "查無此預約資料，請重新查詢";
//				System.out.println(reservationSerachMsg);
//				m.addAttribute("reservationSerachMsg", reservationSerachMsg);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			String reservationSerachMsg = "搜尋出錯，請重新查詢";
//			m.addAttribute("reservationSerachMsg", reservationSerachMsg); // 回傳錯誤訊息
//		}
//		return IdentityFilter.loginID+"03/csm_reservation/update_by_name";
//	}

	
}
