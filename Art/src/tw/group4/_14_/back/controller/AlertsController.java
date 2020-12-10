package tw.group4._14_.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import tw.group4._14_.back.Alerts;
import tw.group4._14_.back.dao.AlertsService;
import tw.group4._14_.front.model.OrderListBeamAP;
import tw.group4.util.Hibernate;

@Controller
public class AlertsController {
	
	@Autowired
	public AlertsService altService;
	
	//獲取所有訊息
	@Hibernate
	@RequestMapping(path = "/14/showAltartCenter.ctrl", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String showAltartCenter() {
		
		List<Alerts> list = altService.selectPartAlerts();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		return json;
	}
	
	//計算洋行營收，留言數
	@Hibernate
	@RequestMapping(path = "/14/sum.ctrl", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String showSum() {
		
		Long sumTotal = altService.sumTotal();
		
		String sumString = String.valueOf(sumTotal);
		
		return sumString;
	}
	
	

}
