package com.welfare.project;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/send")
public class Send extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
			
		String email = request.getParameter("email");
		
		//String host = "http://127.0.0.1:";
			Properties props = new Properties();
        Session session = Session.getDefaultInstance(props);

        String msgBody = "body of email....";

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("saiprasad.sridhar@a-cti.com"));
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress(email));
            msg.setSubject("Your account has been activated");
            msg.setText(msgBody);
            Transport.send(msg);

        } catch (AddressException e) {
           
        } catch (MessagingException e) {
           
        }
}
}