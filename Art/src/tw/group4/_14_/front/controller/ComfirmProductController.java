package tw.group4._14_.front.controller;


import java.text.SimpleDateFormat;
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


import tw.group4._14_.back.ARTProduct;
import tw.group4._14_.front.model.MBRecordBean;
import tw.group4._14_.front.model.OrderItemBeanAP;
import tw.group4._14_.front.model.OrderListBeamAP;
import tw.group4._14_.front.model.ShoppingCartAP;
import tw.group4._14_.front.model.dao.MBRecordDAOService;
import tw.group4._14_.front.model.dao.OrderDaoService;
import tw.group4._14_.front.util.MBRecordUtil;
import tw.group4._14_.sendMail.SendMailService;
import tw.group4._14_.utils.ECPayment;
import tw.group4._35_.login.model.WebsiteMember;
import tw.group4._35_.login.model.WebsiteMemberDao;
import tw.group4._35_.login.model.WebsiteMemberService;
import tw.group4.util.Hibernate;


@Controller
public class ComfirmProductController {
	
	@Autowired
	private OrderDaoService oDaoService;
	
	@Autowired
	private WebsiteMemberService mDaoService;
	
	@Autowired
	private SendMailService smService;
	
	@Autowired
	private MBRecordDAOService mbrService;
	
	@Autowired
	private MBRecordUtil util;

	@Hibernate
	@RequestMapping(path = "/14/productListDelet.ctrl")
	public String productListDelet(HttpSession session, @RequestParam(name = "productIdAP") String productIdAP) {
		if (session == null) {      // 使用逾時
			
			return "redirect:/14/shopListController.ctrl";
		}
		
		ShoppingCartAP sCartAP = (ShoppingCartAP)session.getAttribute("carList");
		System.out.println("/14/productListDelet.ctrl");
		sCartAP.deleteProduct(productIdAP);
		
		return "14/14_OrderConfirm1";
		
	}
	
	@Hibernate
	@RequestMapping(path = "/14/productListModify.ctrl")
	public String productListModify(HttpSession session, @RequestParam(name = "productIdAP") String productIdAP,
			@RequestParam(name = "newQty") int newQty) {
		
		 // 使用逾時
		if (session == null) {     
			return "redirect:/14/shopListController.ctrl";
		}
		
		ShoppingCartAP sCartAP = (ShoppingCartAP)session.getAttribute("carList");
		sCartAP.modifyQty(productIdAP, newQty);
		
		return "14/14_OrderConfirm1";
	}
	
	@Hibernate
	@RequestMapping(path = "/14/AbortCart.ctrl")
	public String AbortCart(HttpSession session) {
		
        ShoppingCartAP cart = (ShoppingCartAP)session.getAttribute("carList");
		if (cart != null) {
			//由session物件中移除ShoppingCart物件
			session.removeAttribute("carList");
		}
		return "redirect:/14/shopListController.ctrl";
	}
	
	@Hibernate
	@RequestMapping(path = "/14/SubmitAPCart.ctrl")
	public String SubmitAPCart(HttpSession session , Model m) {
		//如果使用逾時
		if (session == null) {      
			
			return "redirect:/14/shopListController.ctrl";
			
		}

		//找不到會員登入紀錄
		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");
		if (mb == null) {
			return "redirect:/35/loginEntry";

		}
		
		// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
		ShoppingCartAP sc = (ShoppingCartAP) session.getAttribute("carList");	
		if (sc == null) {
			
			// 導向首頁
			return "redirect:/14/shopListController.ctrl";
		}
		
		
		Integer id = mb.getId();
		
		WebsiteMember selectById = mDaoService.selectById(id);
		m.addAttribute("mb", selectById);
		
		// 結帳
		return "14/14_CheckOrder";
	}
	
	@Hibernate
	@RequestMapping(path = "/14/ProcessOrder.ctrl")
	public String ProcessOrder(HttpSession session, @RequestParam(name = "Address") String Address, @RequestParam(name = "BNO") String BNO, 
			@RequestParam(name = "InvoiceTitle")String InvoiceTitle,@RequestParam(name = "email") String email ) {
		System.out.println("---ProcessOrder.ctrl---");
		ShoppingCartAP sc = (ShoppingCartAP) session.getAttribute("carList");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			
			return "redirect:/14/shopListController.ctrl";
		}
		
		
		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");
		if (mb == null) {
			return "redirect:/35/loginEntry";

		}
		
		
//		String memberID = Integer.toString(mb.getId()); 這是流水號
//		String memberID = "測試用";
		String memberID = mb.getRealName();
		int totalAmount = sc.getSubtotal();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date today = new Date();
		String dateString = sdFormat.format(today);
		System.out.println("進入 ProcessOrderServlet");
		System.out.println(" memberID=" + memberID + ", addAP=" + Address
				+ ", bnoAP=" + BNO + ", orderTitleAP=" + InvoiceTitle+", date=" + today +", totalAmount="+totalAmount );
		
		OrderListBeamAP olb = new OrderListBeamAP(memberID, email, Address, BNO, InvoiceTitle,totalAmount, today);
		
		Set<OrderItemBeanAP> items = new HashSet<OrderItemBeanAP>();
		
		
		Map<String, ARTProduct> cartAP = sc.getCartAP();
		
		Set<String> keySet = cartAP.keySet();
		
		
		for (String i : keySet) {
			ARTProduct pi = cartAP.get(i);
			
			
			//設定是否可以評論起始
			int apid = Integer.parseInt(pi.getProductId());
			Integer mid = mb.getId();
			util.MBRCtrlIncrease(mid, apid);

			//將購買的商品細目裝進大清單中
			OrderItemBeanAP oibAP = new OrderItemBeanAP(pi.getProductTitle(), pi.getProductNum(), pi.getProductPrice());
			oibAP.setOrderListBeamAP(olb); //OneToMany
			items.add(oibAP);
			System.out.println("oibAP:"+oibAP);
			
		}
		System.out.println("olb.getOrderTitleAP():"+olb.getOrderTitleAP());
		olb.setItems(items);
		try {
			oDaoService.persistOrder(olb);
			
			//買東西的時候送出訊息給後台
			Integer shopAlert = (Integer)session.getAttribute("shopAlert");
			if (shopAlert == null) {
				shopAlert=0;
			}
			shopAlert++;
			
			//寄送訂單確認信
			smService.processSendMailAP(olb);
			
			//綠界金流
			ECPayment payment = new ECPayment();
			String genAioCheckOutALL = payment.genAioCheckOutALL(dateString, Integer.toString(totalAmount));
//			String genAioCheckOutALL = payment.genAioCheckOutALL();

			
			session.setAttribute("shopAlert", shopAlert);
			session.setAttribute("shopDetile", olb);
			session.removeAttribute("carList");
//			session.setAttribute("form", genAioCheckOutALL);
			session.setAttribute("form", "我把綠界的東西註解掉了，因為很麻煩，請到 212 行打開");
			return "14/14_Thank";
			
		} catch(Exception ex){
			
			ex.printStackTrace();
			return "redirect:/14/shopListController.ctrl";
		}
		
		
	}
	
	@Hibernate
	@RequestMapping(path = "/14/OrderDetial.ctrl")
	public String orderListProcesses(Model m, @RequestParam(name = "orderNo")int orderNo) {
		OrderListBeamAP order = oDaoService.getOrder(orderNo);
		m.addAttribute("OrderBean", order);
		return "14/14_OrderDetail";
		
	}
	

}
