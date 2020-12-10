package tw.group4._18_.seller.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.group4._18_.seller.model.CourseBeanService;
import tw.group4._18_.seller.model.Course;
import tw.group4.util.Hibernate;

@Controller
public class CRUDController_LN {
	
	@Autowired
	private CourseBeanService cBeanService;
	
	@Hibernate
	@RequestMapping(path = "/18/cSelectAll.ctrl" ,method = RequestMethod.GET) //網址
	public String processActionSelectAll(@ModelAttribute("Update") String update2, Model m) {
		List<Course> selectAll = cBeanService.selectAll();
		m.addAttribute("cList", selectAll);
//	    String str =   (String) m.getAttribute("Update");
//	    m.addAttribute("end1", str);
//	    System.out.println(str);
		return "18/sellerCo/18_SelectAll"; //欲跳之jsp名字
	}
	
//	@RequestMapping(path = "/18/cSelectAllFront.ctrl" ,method = RequestMethod.GET)
//	public String processActionSelectAll2(Model m) {
//		List<Course> selectAll = cBeanService.selectAll();
//		m.addAttribute("cList", selectAll);
//		return IdentityFilter.loginID+"18/18_SelectAll";
//	}
	
	
	@Hibernate
	@RequestMapping(path = "/18/cInsert.ctrl" ,method = RequestMethod.POST)
	public String processActionInsert(Model m, @RequestParam(name = "coTitle")String coTitle, @RequestParam(name = "coAct_Type")String coAct_Type, 
			@RequestParam(name = "coAct_Location")String coAct_Location, @RequestParam(name = "coLocation_Name")String coLocation_Name, 
			@RequestParam(name = "coNum")int coNum, @RequestParam(name = "coPrice")int coPrice, @RequestParam(name = "coAct_Date")String coAct_Date, @RequestParam(name = "coAct_Time")String coAct_Time, 
			@RequestParam(name = "coEnd_Date")String coEnd_Date, @RequestParam(name = "coEnd_Time")String coEnd_Time, @RequestParam(name = "coAct_Description")String coAct_Description,  
			@RequestParam(name = "coHot")int coHot, @RequestParam(name = "coAct_Image")MultipartFile coAct_Image)	{  
		    //name = "輸入值"
		Course co = new Course();
//		co.setCoId(coId);
		co.setCoTitle(coTitle);
		co.setCoAct_Type(coAct_Type);
		co.setCoAct_Location(coAct_Location);
		co.setCoLocation_Name(coLocation_Name);
		co.setCoNum(coNum);
		co.setCoPrice(coPrice);
		co.setCoAct_Date(coAct_Date);
		co.setCoAct_Time(coAct_Time);
		co.setCoEnd_Date(coEnd_Date);
		co.setCoEnd_Time(coEnd_Time);
		co.setCoAct_Description(coAct_Description);
		co.setCoHot(coHot);
		try {
			co.setCoAct_Image(coAct_Image.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
//		co.setCoAct_ImageStr(coAct_ImageStr);
		
		Course cbs = cBeanService.insert(co);
		
		System.out.println(cbs.getCoAct_Time());
		m.addAttribute("successLN", "新增課程成功");
		return "redirect:/18/cSelectAll.ctrl"; //欲跳之網址
	}
	
	@Hibernate
	@RequestMapping(path="/18/insertData.ctrl") //網址
	public String processActionInsert2() {
		return "18/sellerCo/18_Insert";  //jsp名字
		
	}
	
	
	@Hibernate
	@RequestMapping(path = "/18/cDelete.ctrl", method = RequestMethod.GET)
	public String processActionDelete(Model m, @RequestParam(name= "coId")String coId) {  //name = "輸入值"
		boolean result = cBeanService.delete(coId);
		Course co = cBeanService.select(coId);
		m.addAttribute("co", co); 
		m.addAttribute("coId", coId);
		
		if (result) {
			m.addAttribute("Delete", "刪除課程成功");			
		} else {			
			m.addAttribute("Delete", "修改課程失敗");			
		}
		return "redirect:/18/cSelectAll.ctrl"; //欲跳之網址
		
	}
	
	@Hibernate
	@RequestMapping(path = "/18/DeleteData.ctrl")  //網址
	public String processActionDelete2() {
		return "18/sellerCo/18_Delete";  //jsp名字
	}
	
	
	@Hibernate
	@RequestMapping(path = "/18/cUpdate.ctrl", method = RequestMethod.POST)
	public String processActionUpdate(Model m, @RequestParam(name = "coId")String coId, @RequestParam(name = "coTitle")String coTitle, @RequestParam(name = "coAct_Type")String coAct_Type, 
			@RequestParam(name = "coAct_Location")String coAct_Location, @RequestParam(name = "coLocation_Name")String coLocation_Name, @RequestParam(name = "coNum")int coNum, @RequestParam(name = "coPrice")int coPrice, 
			@RequestParam(name = "coAct_Date")String coAct_Date, @RequestParam(name = "coAct_Time")String coAct_Time, @RequestParam(name = "coEnd_Date")String coEnd_Date, 
			@RequestParam(name = "coEnd_Time")String coEnd_Time, @RequestParam(name = "coAct_Description")String coAct_Description, @RequestParam(name = "coHot")int coHot, @RequestParam(name = "coAct_Image") MultipartFile coAct_Image) {
//	    try {
//			System.out.println(coAct_Image.getBytes());
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		byte [] byt2= null;
		try {
			byt2 = coAct_Image.getBytes();
		} catch (IOException e) {
			e.printStackTrace();
		}
		boolean result = cBeanService.update(coId, coTitle, coAct_Type, coAct_Location, coLocation_Name, coNum, coPrice, coAct_Date, coAct_Time, coEnd_Date, coEnd_Time, coAct_Description, coHot, byt2);
		Course co = cBeanService.select(coId);
//		m.addAttribute("co", co); 
//		m.addAttribute("coId", coId);
//		m.addAttribute("coTitle", coTitle);
//		m.addAttribute("coAct_Location", coAct_Location);
//		m.addAttribute("coLocation_Name", coLocation_Name);
//		m.addAttribute("coPrice", coPrice);
//		m.addAttribute("coAct_Time", coAct_Time);
//		m.addAttribute("coEnd_Time", coEnd_Time);
//		m.addAttribute("coAct_Description", coAct_Description);
//		m.addAttribute("coAct_Image", coAct_Image);
		
		
		if (result) {
			m.addAttribute("Update", "修改課程成功");			
		} else {			
			m.addAttribute("Update", "修改課程失敗");
		}
		
		return "redirect:/18/cSelectAll.ctrl"; //欲跳之網址
	}
	
	@Hibernate
	@RequestMapping(path = "/18/UpdateData.ctrl", method = RequestMethod.GET) //網址
	public String processActionUpdate2(Model m, @RequestParam(name = "coId")String coId, @RequestParam(name = "coTitle")String coTitle, @RequestParam(name = "coAct_Type")String coAct_Type, 
			@RequestParam(name = "coAct_Location")String coAct_Location, @RequestParam(name = "coLocation_Name")String coLocation_Name, @RequestParam(name = "coPrice")int coPrice, 
			@RequestParam(name = "coAct_Date")String coAct_Date, @RequestParam(name = "coAct_Time")String coAct_Time, @RequestParam(name = "coEnd_Date")String coEnd_Date, 
			@RequestParam(name = "coEnd_Time")String coEnd_Time, @RequestParam(name = "coAct_Description")String coAct_Description, @RequestParam(name = "coNum")int coNum) {  //name = "輸入值"
				
//		cBeanService.update(id, title, price);
		m.addAttribute("coId", coId);
		m.addAttribute("coTitle", coTitle);
		m.addAttribute("coAct_Type", coAct_Type);
		m.addAttribute("coAct_Location", coAct_Location);
		m.addAttribute("coLocation_Name", coLocation_Name);
		m.addAttribute("coPrice", coPrice);
		m.addAttribute("coAct_Date", coAct_Date);
		m.addAttribute("coAct_Time", coAct_Time);
		m.addAttribute("coEnd_Date", coEnd_Date);
		m.addAttribute("coEnd_Time", coEnd_Time);
		m.addAttribute("coAct_Description", coAct_Description);
		m.addAttribute("coNum", coNum);
//		m.addAttribute("coAct_Image", coAct_Image);
		
		return "18/sellerCo/18_Update";  //jsp名字
	}

}
