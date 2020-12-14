package tw.group4._35_.routePlanning.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyJourneyService {
	
	MyJourneyDao dao;
	
	@Autowired
	public MyJourneyService(MyJourneyDao dao) {
		this.dao = dao;
	}
	
	public boolean insertMyJourney(MyJourney myJourney) {
		return dao.insertMyJourney(myJourney);
	}
}
