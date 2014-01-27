package com.occm.controllers.rest;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.occm.models.Action;
import com.occm.models.FirstVisit;
import com.occm.models.User;
import com.occm.models.rest.response.Login;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { AccountRESTController.URL_MAPPING })
public class AccountRESTController {
	public static final String URL_MAPPING = "/REST/account";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST, headers = "Accept=*/*")
	@ResponseBody
	public Login login(@RequestParam(value="username", required=true) String userName, 
	        @RequestParam(value="password", required=true) String password, ModelMap map, HttpSession hs) {
		System.out.println("Entered Login");
		User user = new User(userName, password);
		
		user = service.validate(user);
		
		// Send request to API or DAO layer to get the user information
		Login response = new Login();
		
		if (user != null) {
			if(!user.getStatus().getStatus().equals("active")){
				System.out.println("Login Failed");
				response.setResult("FAILURE");
				response.setMessage("Login Failed!!! Your account is not currently active.");
				return response;
			}
			hs.setAttribute("activeUser", user);
			//hs.setAttribute("activeUserActions", new ArrayList<Action>(user.getRole().getActions()));
			String action;
			Iterator<Action> itr = user.getRole().getActions().iterator();
	        while(itr.hasNext())
	        {
	            action = itr.next().getAction();
	            hs.setAttribute(action, true);
	            
	        }
			hs.setAttribute("firstVisit", new FirstVisit(true));
			
			System.out.println("Login successful");
			response.setResult("SUCCESS");
			response.setUserId(user.getId());
			response.setUserFName(user.getFname());
			response.setUserSName(user.getSname());
			response.setUserEmail(user.getEmail());
		}
		else{
			System.out.println("Login Failed");
			response.setResult("FAILURE");
			response.setMessage("Login Failed!!! Please Try again with correct User Name and Password");
		}

		return response;

	}
}
