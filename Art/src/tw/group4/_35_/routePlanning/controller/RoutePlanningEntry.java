package tw.group4._35_.routePlanning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import tw.group4.util.NeedLogin;

@Controller
public class RoutePlanningEntry {

	@GetMapping(value = "/35/routePlanningEntry")
	public String routePlanningEntry() {

		return "35/routePlanning/allRoutes";
	}
	
	@NeedLogin
	@GetMapping(value = "/35/myJourneyEntry")
	public String myJourneyEntry() {
		
		return "35/routePlanning/myJourney";
	}

}
