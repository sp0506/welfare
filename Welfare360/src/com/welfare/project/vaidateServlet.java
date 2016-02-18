package com.welfare.project;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.appengine.api.datastore.Query;



@Controller
@RequestMapping("/validate")
public class vaidateServlet extends HttpServlet {
	public @ResponseBody String validateDetails(ModelMap model,HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String text;
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		javax.jdo.Query q = pm.newQuery(Registration.class);
		//q.setFilter("' email == '" + email + "'");
		try {
		q = pm.newQuery("select from Registration " +
                "where email == email");
		request.setAttribute("1", "id  not available");
		response.getWriter().print(1);
		List<Registration> loginDetails= (List<Registration>) q.execute(email);
System.out.println("log details :" + loginDetails);

		} finally {
			q.closeAll();

		}return "1";

	}
/*    private static final long serialVersionUID = 1L;
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        String userName = request.getParameter("userName").trim();
        if(userName == null || "".equals(userName)){
            userName = "Guest";
        }
         
        String greetings = "Hello " + userName;
         
        response.setContentType("text/plain");
        response.getWriter().write(greetings);
    }
 
*/}//   String avail;
		
		/*for (Registration a : accounts.values()) {
	        if (a.getName().equals(name)) {
	            return AvailabilityStatus.notAvailable(name);
	        }
	    }
	    return AvailabilityStatus.available();
	}*/
	
/*	public @ResponseBody String validateDetails(ModelMap model,HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String text;
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		javax.jdo.Query q = pm.newQuery(Registration.class);
		//q.setFilter("' email == '" + email + "'");
		try {
		q = pm.newQuery("select from Registration " +
                "where email == email ");
		request.setAttribute("1", "id  not available");
		response.getWriter().print(1);
		List<Registration> loginDetails= (List<Registration>) q.execute(email);
System.out.println("log details :" + loginDetails);

		} finally {
			q.closeAll();

		}return "1";

	}
}
	*/	//if(q.setFilter("' email == '" + email + "'")){}
		
	/* q = pm.newQuery("select from Registration " +
                "where email == email ");*/
		
			// && email!=null && username!=null && password!=null && role!=null && location!=null  ){
	//System.out.println("yes");
		//	pm.makePersistent();
		
		

