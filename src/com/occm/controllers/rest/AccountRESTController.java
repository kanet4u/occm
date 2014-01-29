package com.occm.controllers.rest;

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
		
		User user = service.validate(new User(userName, password));
		
		// Send request to API or DAO layer to get the user information
		Login response = new Login();
		
		
		if (user != null) {
			if (user.getStatus().isActive()) {
				user.setLoggedIn(hs);
				System.out.println("You have successfully logged in.");
				response.setResult("SUCCESS");
				response.setUserId(user.getId());
				response.setUserFName(user.getFname());
				response.setUserSName(user.getSname());
				response.setUserEmail(user.getEmail());
				hs.setAttribute("message_success", "You have successfully logged in.");
			} else {
				response.setResult("FAILURE");
				response.setMessage("User is not activated!");
			}
		} else {
			response.setResult("FAILURE");
			response.setMessage("Email or password is incorrect.");
		}

		return response;

	}
}