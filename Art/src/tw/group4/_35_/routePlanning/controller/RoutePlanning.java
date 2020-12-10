package tw.group4._35_.routePlanning.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import tw.group4._35_.geo.model.Position;
import tw.group4._35_.geo.model.PositionService;
import tw.group4.util.Hibernate;

@RestController
public class RoutePlanning {

	@Autowired
	PositionService service;

	@Hibernate
	@PostMapping(value = "/35/routePlanning.ctrl")
	public Map<String, String> routePlanningPost(@RequestBody String str) {
		System.out.println("post連上線了");
		return null;
	}

	@Hibernate
	@GetMapping(value = "/35/routePlanning/{userLocation}/{userDistance}/{actCategory}" + ".ctrl")
	public Map<String, Object> routePlanningGetAll(@PathVariable String userLocation, @PathVariable String userDistance,
			@PathVariable String actCategory) {

        Integer category;
		switch (actCategory) {
		case "所有":
			category = 0;
			break;
		case "音樂":
			category = 1;
			break;
		case "戲劇":
			category = 2;
			break;
		case "舞蹈":
			category = 3;
			break;
		case "親子":
			category = 4;
			break;
		case "獨立音樂":
			category = 5;
			break;
		case "展覽":
			category = 6;
			break;
		case "講座":
			category = 7;
			break;
		case "電影":
			category = 8;
			break;
		case "綜藝":
			category = 11;
			break;
		case "競賽":
			category = 13;
			break;
		case "徵選":
			category = 14;
			break;
		case "其他":
			category = 15;
			break;
		case "未知分類":
			category = 16;
			break;
		case "演唱會":
			category = 17;
			break;
		case "研習課程":
			category = 19;
			break;
		default:
			category = 0;
			break;
		}
		
		Map<String, Double> userCoords = service.getUserCoords(userLocation);
		List<Position> list;
		if(!category.equals(0)) {		
			list = service.selectNearActsByDistanceAndCategory(userLocation, userDistance, category);
		}else {
			list = service.selectNearActsByDistance(userLocation, userDistance);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCoords", userCoords);
		map.put("nearActs", list);

		return map;
	}
}
