package tw.group4._18_.buyer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tw.group4._18_.buyer.DAO.CourseOrderService;
import tw.group4._18_.buyer.model.CourseOrders;
import tw.group4._35_.login.model.WebsiteMember;
import tw.group4.util.Hibernate;

@Controller
public class CourseOrderController {

	@Autowired
	private CourseOrderService coService;
	
	// 查詢訂單
	@Hibernate
	@RequestMapping(path = "18/coOrderList.ctrl")
	public String coOrderList(Model m, HttpSession session) {

		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");
		if (mb == null) {
			return "redirect:/35/loginEntry";
		}else {
			String memberId = mb.getName();
			List<CourseOrders> col = coService.getcoOrderByMId(memberId);
			m.addAttribute("col", col);
//			System.err.println(col);
			return "18/buyerCo/18_OrderList";  //jsp
			
		}
		
		
	}
	
	
	
	
	
}