package com.occm.controllers.rest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.occm.models.rest.response.Login;

@Controller
@RequestMapping(value = { AccountRESTController.URL_MAPPING })
public class AccountRESTController {
	public static final String URL_MAPPING = "/REST/account";

	@RequestMapping(value = "/login", method = RequestMethod.POST, headers = "Accept=*/*")
	@ResponseBody
	public Login login(@RequestParam(value="username", required=true) String userName, 
	        @RequestParam(value="password", required=true) String password, HttpSession hs) {
		
		// Send request to API or DAO layer to get the user information
		Login response = new Login();
		
		if (userName.equals("vivek@gmail.com") && password.equals("yadav")) {
			
			response.setResult("SUCCESS");
			response.setUserId(1L);
			response.setUserFName("Vivek");
			response.setUserSName("Yadav");
			response.setUserEmail("vivek@gmail.com");
		}
		else{
			response.setResult("FAILURE");
			response.setMessage("Login Failed!!! Please Try again with correct User Name and Password");
		}

		return response;

	}
}
