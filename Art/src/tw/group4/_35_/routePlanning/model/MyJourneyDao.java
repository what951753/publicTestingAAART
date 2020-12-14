package tw.group4._35_.routePlanning.model;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class MyJourneyDao {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public MyJourneyDao(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Boolean insertMyJourney(MyJourney myJourney) {
		Session session = sessionFactory.getCurrentSession();
		try {		
			session.save(myJourney);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
