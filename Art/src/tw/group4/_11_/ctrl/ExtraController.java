package tw.group4._11_.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group4._11_.model.UserSABean;
import tw.group4._11_.model.UserSADao;
import tw.group4._11_.model.UserSAService;
import tw.group4._35_.login.model.WebsiteMemberService;
import tw.group4.util.Hibernate;

@Controller
@SessionAttributes(names = "result2")
public class ExtraController {
	@Autowired
	private UserSADao uDAO;
	@Autowired
	private UserSAService uService;
	@Autowired
	private WebsiteMemberService wDaoService;
	
	@Hibernate
	@RequestMapping(path = "/userStreetArtistPage.ctrl" ,method = RequestMethod.GET)
	public String showingSA(
			@RequestParam(name = "page" , required = false) Integer page,
			@RequestParam(name = "query" ,required = false) String query,
			Model m) {
		
		
		if (query != "" && query != null) {
			
			if (page == null || page == 0) {
				page =1;
			}
			
			List<UserSABean> querylist = uService.selectQueryAll(page, query);
			int totalPage = uService.getPages(query);
			
			List<Integer> totlePages = new ArrayList<Integer>();
			for (int i = 1; i <= totalPage; i++) {
				totlePages.add(i);
			}
			
			m.addAttribute("BeanList_SA",querylist);
			m.addAttribute("query",query);
			m.addAttribute("PageMum_SA",page);
			m.addAttribute("totalPages_SA",totalPage);
			m.addAttribute("allPages",totlePages);
		}else {
			if (page == null || page == 0) {
				page =1;
			}
			
			List<UserSABean> list = uService.selectPage(page);
			int totalPage = uService.getTotlaPage();
			
			List<Integer> totlePages = new ArrayList<Integer>();
			for (int i = 1; i <= totalPage; i++) {
				totlePages.add(i);
			}
			
			m.addAttribute("BeanList_SA",list);
			m.addAttribute("PageMum_SA",page);
			m.addAttribute("totalPages_SA",totalPage);
			m.addAttribute("allPages",totlePages);
		}
		
		return "_11_SA/NormalUser/Showing_2";
	}
	
	@Hibernate
	@RequestMapping(path = "/searchSA2.ctrl",method = RequestMethod.POST)
	public String searchSA(@RequestParam(name = "word") String searchSA, Model m) {
		
		List<UserSABean> list= uDAO.search(searchSA);
		
		m.addAttribute("reUBeanList_SA",list);
		
		return "_11_SA/NormalUser/UserReturn";
	}
	
//	連個人網站
	@Hibernate
	@GetMapping(value = "/ToWeb.ctrl")
	public String toOtherWeb(
			@RequestParam("id_SA") String sa,Model m
			) {
		int id_SA2 = Integer.parseInt(sa);
		List<UserSABean> list = uService.selectIdSA(id_SA2);
		
		String mas = uDAO.judgePic(id_SA2);
		
    	m.addAttribute("dataForWeb", list);
		m.addAttribute("msgForWeb",mas);
		System.out.println(mas);
    	return "_11_SA/NormalUser/KnowMore";
	}
	
//	連斗內介面
	@Hibernate
	@GetMapping(value = "/ToDonate.ctrl")
	public String toDonate(
			@RequestParam(name = "id_SA") String id_dn,
			HttpSession session,
			Model m) {
		if (session == null) {
			return "redirect:/userStreetArtistPage.ctrl";
		}
		
		int id = Integer.parseInt(id_dn);
		List<UserSABean> list = uDAO.searchID(id);
		
    	m.addAttribute("streetArtist", list);
		return "_11_SA/NormalUser/DonateSA";
	}
	
	@Hibernate
	@GetMapping(path ="/doDonate.ctrl")
	public String doDonate(
			@RequestParam(name = "id_SA") String id_SA,
			@RequestParam(name = "sal") String salWeb,
			ServletRequest request,
			ServletResponse response,
			Model m) throws IOException, ServletException{
		
		HttpServletResponse httpRes = (HttpServletResponse) response;
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpSession session = httpReq.getSession();
		
		
		
		int id = Integer.parseInt(id_SA);
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if (salWeb == null || salWeb.length()==0) {
			errors.put("msg", "please enter a number!!");
		} 
		
		try {
			int sal = Integer.parseInt(salWeb);
			if (sal <= 0) {
				errors.put("msg", "不可輸入小於零或等於零的數字");
			}
			uDAO.donateToSA(id, sal);
		} catch (Exception e) {
			errors.put("msg", "請勿輸入數字以外的字串!!");
			e.printStackTrace();
		}
		
		m.addAttribute("name","donate to streetartist!!");
		return "_11_SA/NormalUser/Success";
	}
	
//	@GetMapping(path ="/doDonate.ctrl")
//	public String doDonate(
//			@RequestParam(name = "id_SA") String id_SA,
//			@RequestParam(name = "sal") String salWeb,
//			Model m) {
//		int id = Integer.parseInt(id_SA);
//		Map<String, String> errors = new HashMap<String, String>();
//		m.addAttribute("errors", errors);
//		
//		if (salWeb == null || salWeb.length()==0) {
//			errors.put("msg", "please enter a number!!");
//		} 
//		
//		try {
//			int sal = Integer.parseInt(salWeb);
//			if (sal <= 0) {
//				errors.put("msg", "不可輸入小於零或等於零的數字");
//			}
//			uDAO.donateToSA(id, sal);
//		} catch (Exception e) {
//			errors.put("msg", "請勿輸入數字以外的字串!!");
//			e.printStackTrace();
//		}
//		
//		m.addAttribute("name","donate to streetartist!!");
//		return IdentityFilter.loginID+"_11_SA/NormalUser/Success";
//	}
}
