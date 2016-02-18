package com.welfare.project;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.*;

import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import com.google.appengine.api.taskqueue.TaskOptions.Method;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.welfare.project.Registration;
import com.welfare.project.PMF;

@Controller
@RequestMapping("/choose")
class WelfareJ2EEServlet {
	private static final Logger logger = Logger
			.getLogger(WelfareJ2EEServlet.class);

	static int total = 0;

	/*
	 * @RequestMapping(value = "/log", method = RequestMethod.GET) public
	 * ModelAndView getWelcome() {
	 * 
	 * //logs debug message if(logger.isDebugEnabled()){
	 * logger.info("statement is executed!"); }
	 * 
	 * //logs exception //logger.error("This is Error message", new
	 * Exception("Testing"));
	 * 
	 * ModelAndView model = new ModelAndView("index"); model.addObject("msg",
	 * "Hello"); //System.out.println(); return model;
	 * 
	 * }
	 */

	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public String getCount(ModelMap model) {

		model.addAttribute("total", total);
		// logger.warn("total requests : "+total);
		// System.out.println("in count");
		return "index";

	}

	@RequestMapping(value = "/validate", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getvalidPage() {

		// System.out.println("message "+req.getAttribute("message"));
		return "";

	}

	@RequestMapping(value = "/register", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getRegisterPage() {

		// System.out.println("message "+req.getAttribute("message"));
		return "registerForm";

	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void logOut(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession(false);
		// System.out.println("User="+session.getAttribute("username"));
		if (session != null) {
			// session.removeAttribute("username");
			request.getSession().invalidate();

		}
		response.sendRedirect("login");
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getLoginPage(ModelMap model) {

		return "login";

	}

	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendMail(String messageSubject, String messageText)
			throws Exception {
		Properties prop = new Properties();
		Session session = Session.getDefaultInstance(prop, null);
		messageText = "Hello, Sai ! Good Morning !!";
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("saiprasad.sridhar@a-cti.com"));
			// msg.setFrom(new InternetAddress("saiprasad949@gmail.com"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
					"y.saiprasadreddy@gmail.com", "Mr. User"));
			// msg.addRecipient(Message.RecipientType.TO, new
			// InternetAddress(sendMailTo, "swathi.gokavarapu@gmail.com"));
			msg.setSubject("Good Morning !");
			msg.setText(messageText);
			Transport.send(msg);
			// logger.info("testing mail..../");
			// System.out.println("Successfull Delivery.");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "send";
	}

	@RequestMapping(value = "/newPost", method = RequestMethod.POST)
	public String getSeekerPage(ModelMap model) {

		return "HelpSeeker";

	}

	@RequestMapping(value = "/index", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView getIndex() {
		int val = total;
		// System.out.println("registrations"+val);
		return new ModelAndView("index", "message", val);

	}

	@RequestMapping(value = "/volunteerList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getvolunteerListPage(ModelMap model) {

		return "volunteer-list";

	}

	@RequestMapping(value = "/charity", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getCharityOrgPage(ModelMap model) {

		return "charity-organisations";

	}

	@RequestMapping(value = "/regDetails", method = RequestMethod.POST)
	public String add(HttpServletRequest request, ModelMap model) {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String location = request.getParameter("location");
		String role = request.getParameter("role");

		// Queue queue = QueueFactory.getDefaultQueue();
		// queue.add(TaskOptions.Builder.withUrl("/choose/send").method(Method.POST).param("email",
		// email));

		Registration regObj = new Registration();

		regObj.setName(name);
		regObj.setEmail(email);
		regObj.setUserName(username);
		regObj.setPassword(password);
		regObj.setLocation(location);
		regObj.setRole(role);

		PersistenceManager pm = PMF.get().getPersistenceManager();

		if (name != null && email != null && username != null
				&& password != null && role != null && location != null) {

			pm.makePersistent(regObj);

			total++;
			System.out.println(total);
		}

		else {
			request.setAttribute("message", "values can't be stored NULL");
		}

		return "login";

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/checkEmail", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody
	String check(HttpServletRequest request, ModelMap model,
			HttpServletResponse response) throws IOException {

		String emailCheck = request.getParameter("email");

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(Registration.class);
		q.setFilter(" email == '" + emailCheck + "'");

		try {
			List<Registration> list = (List<Registration>) q.execute();
			// request.setAttribute("1", "id  not available");
			// System.out.println("log details :" + list.size());

			if (list != null && !list.isEmpty()) {

				return "1";
			} else
				
			return "0";

		} finally {
			q.closeAll();
		}

	}

	/*
	 * if (!list.isEmpty()) // response = ""; return "available";
	 * //response.getWriter().write("email available"); else
	 * //response.getWriter().write("email already exists"); return
	 * "not available"; }
	 */

	@RequestMapping(value = "/loginValidate", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String validateLogin(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

		String userNameLog = request.getParameter("userNameLogin");
		String passwordLog = request.getParameter("passwordLogin");
		String roleLog = request.getParameter("roleLogin");

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(Registration.class);

		q.setFilter("userName == '" + userNameLog + "' && password == '"
				+ passwordLog + "' && role == '" + roleLog + "'");

		List<Registration> loginDetails = (List<Registration>) q.execute(
				userNameLog, passwordLog, roleLog);

		try {
			// String detail= loginDetails.get(0).getUserName();
			if (!loginDetails.isEmpty()) {
				HttpSession session = request.getSession();
				session.setAttribute("username", userNameLog);

				if (roleLog.equals("1")) {
					Cookie userName = new Cookie("username", userNameLog);
					response.addCookie(userName);

					storeHelpRequests(model);

					return "Volunteer";

				} else if (roleLog.equals("2")) {
					Cookie userName = new Cookie("username", userNameLog);
					response.addCookie(userName);

					return "HelpSeeker";
				} else {
					return "login";
				}

			}

		} finally {
			q.closeAll();

		}
		return "login_failure";
	}

	@RequestMapping(value = "/requests", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView storeRequests(HttpServletRequest request) {

		String hsName = request.getParameter("hsname");
		String helpRequest = request.getParameter("helprequest");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");

		HelpRequests requestObj = new HelpRequests();

		requestObj.setHSName(hsName);
		requestObj.setHelpRequest(helpRequest);
		requestObj.setMobile(mobile);
		requestObj.setAddress(address);

		PersistenceManager pm = PMF.get().getPersistenceManager();

		try {
			pm.makePersistent(requestObj);
		} finally {
			pm.close();
		}

		return new ModelAndView("redirect:postSuccess");

	}

	/*
	 * @RequestMapping(value = "/requestDetails", method = { RequestMethod.GET,
	 * RequestMethod.POST })
	 */public String storeHelpRequests(ModelMap model) {

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(HelpRequests.class);

		try {
			List<HelpRequests> requestResults = (List<HelpRequests>) q.execute();

			if (requestResults.isEmpty()) {
				model.addAttribute("requestsList", null);
			} else {
				model.addAttribute("requestsList", requestResults);
			}

		} finally {
			q.closeAll();
			pm.close();
		}

		return "userDetails";

	}

	@RequestMapping(value = "/postSuccess", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String displayMessage() {
		return "post_success";
	}

}
