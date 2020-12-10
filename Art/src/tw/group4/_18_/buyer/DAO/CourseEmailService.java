package tw.group4._18_.buyer.DAO;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import tw.group4._04_.front.javaMail.model.EmailServiceImpl;
import tw.group4._18_.buyer.model.CourseOrders;

@Service
public class CourseEmailService {

	@Autowired
	private JavaMailSender emailSender;

	@Autowired
	private EmailServiceImpl emailServiceImpl;

	public void mailtoCo(CourseOrders cos) throws MessagingException {
		
		
	    String to = cos.getEmail();
		String subject = "ts1";
		String text = "0923rr";
		emailServiceImpl.sendMessageWithAttachment(to, subject, text);
		System.out.println("mail寄出");
	}

}
