package com.occm.controllers.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.occm.model.rest.response.Login;

@Controller
@RequestMapping(value = { AccountRESTController.URL_MAPPING })
public class AccountRESTController {
	public static final String URL_MAPPING = "/REST/account";

	@RequestMapping(value = "/login", method = RequestMethod.POST, headers = "Accept=*/*")
	@ResponseBody
	public Login login(@ModelAttribute("username") String userName,
			@ModelAttribute("password") String password) {
		
		// Send request to API or DAO layer to get the user information
		Login response = new Login();
		
		if (userName.equals("vivek") && password.equals("yadav")) {
			
			response.setResult("SUCCESS");
			response.setUserId(1L);
			response.setUserFName("Vivek");
			response.setUserSName("Yadav");
			response.setUserEmail("vivekyadav.jit@gmail.com");
		}
		else{
			response.setResult("FAILURE");
			response.setMessage("Login Failed!!! Please Try again with correct User Name and Password");
		}

		return response;

	}
}
