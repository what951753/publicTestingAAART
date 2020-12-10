package tw.group4._18_.buyer.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.group4._18_.buyer.DAO.CourseEmailService;
import tw.group4._18_.buyer.DAO.CourseOrderService;
import tw.group4._18_.buyer.model.CourseCartCo;
import tw.group4._18_.buyer.model.CourseFront;
import tw.group4._18_.buyer.model.CourseOrderItems;
import tw.group4._18_.buyer.model.CourseOrders;
import tw.group4._35_.login.model.WebsiteMember;
import tw.group4._35_.login.model.WebsiteMemberService;
import tw.group4.util.Hibernate;

@Controller
public class CourseCartController {

	@Autowired
	private CourseOrderService coService;
	
	@Autowired
	private WebsiteMemberService mDaoService;
	
	@Autowired
	private CourseEmailService coeservice;
	
	@Hibernate
	@RequestMapping(path = "/18/deleteCartList.ctrl") // 網址
	public String deleteCartList(HttpSession session, @RequestParam(name = "coId") String coId) {
		if (session == null) {
			return "redirect:/18/cSelectAllFront.ctrl";
		}

		CourseCartCo ccc2 = (CourseCartCo) session.getAttribute("ccc");
		ccc2.deleteCart(coId);

		return "18/buyerCo/18_Order"; // jsp
	}
	
	@Hibernate
	@RequestMapping(path = "/18/ProcessOrderCo.ctrl")
	public String processOrderCo(HttpSession session, @RequestParam(name = "customerAddress") String customerAddress,
			@RequestParam(name = "email") String email, @RequestParam(name = "coComment") String coComment) {
		CourseCartCo ccc3 = (CourseCartCo) session.getAttribute("ccc");
		if (ccc3 == null) { // 訂單找不到購物則回首頁
			return "redirect:/18/cSelectAllFront.ctrl";
		}

		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");
		if (mb == null) {
			return "redirect:/35/loginEntry";
		}

		String memberId = mb.getName();
//		String customerAddress;
//		String coComment;
		int totalAmount = ccc3.getTotal();
		Date today = new Date();
		System.out.println(" memberId=" + memberId + ", date=" + today + ", customerAddress=" + customerAddress
				+ ",  coComment=" + coComment + ", totalAmount=" + totalAmount);

		CourseOrders cOrders = new CourseOrders(memberId, email, customerAddress, coComment, totalAmount, today);
		// List
		Set<CourseOrderItems> coItems = new HashSet<CourseOrderItems>();
		// List裡面的Item

		Map<String, CourseFront> cartCO = ccc3.getCartCo();

		Set<String> keySet = cartCO.keySet();

		for (String a : keySet) {
			CourseFront cf = cartCO.get(a);

			CourseOrderItems cOrderItems = new CourseOrderItems(cf.getCoTitle(), cf.getCoNum(), cf.getCoPrice());
			cOrderItems.setCourseOrders(cOrders); // OneToMany
			coItems.add(cOrderItems);
			System.out.println("cOrders2:" + cOrderItems);
		}
		cOrders.setCourseOrderItems(coItems);
		try {
			coService.persistOrder(cOrders);
			
			coeservice.mailtoCo(cOrders);
			
			
			session.removeAttribute("ccc");
			return "18/buyerCo/18_ThankForOrder";

		} catch (Exception e) {

			e.printStackTrace();
			return "redirect:/18/cSelectAllFront.ctrl";

		}

	}
	
	@Hibernate
	@RequestMapping(path = "/18/SubmitCartCo.ctrl")
	public String SubmitCartCo(Model m, HttpSession session) {

		if (session == null) { // 使用逾時
			return "redirect:/18/cSelectAllFront.ctrl";
		}

		// 無會員登入
		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");
		if (mb == null) {
			return "redirect:/35/loginEntry";
		}

		CourseCartCo courseCartCo = (CourseCartCo) session.getAttribute("ccc");

		if (courseCartCo == null) {
			// 找不到購物車(通常是Session逾時)，不往下直接導回首頁
			return "redirect:/18/cSelectAllFront.ctrl";
		}

		Integer id = mb.getId();
		WebsiteMember selectById = mDaoService.selectById(id);
		m.addAttribute("mb", selectById);

		// 結帳
		return "18/buyerCo/18_CheckOutCo";
	}
	
	@Hibernate
	@RequestMapping(path = "/18/coOrderListOne.ctrl")
	public String processOrderList(Model m, @RequestParam(name = "orderNoCo")int orderNoCo) {
		CourseOrders courseOrders = coService.getcoOrderByONo(orderNoCo);
		m.addAttribute("cooo", courseOrders);
		
		return "18/buyerCo/18_OrderListOne";  // jsp
	}

}
