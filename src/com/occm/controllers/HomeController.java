package com.occm.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.occm.models.User;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { HomeController.URL_MAPPING })
public class HomeController {
	public static final String URL_MAPPING = "/home";

	// D.I
	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession hs) {
		if (hs.getAttribute("activeUser") != null) {
			User user = (User) hs.getAttribute("activeUser");
			map.addAttribute("userFName", user.getFname());
			map.addAttribute("userSName", user.getSname());
			return URL_MAPPING + "/home";
		}
		return URL_MAPPING + "/index"; // show index.jsp
	}

	@RequestMapping("/list")
	public String listUsers(Model map) {

		map.addAttribute("user", service.getDetails(2L));
		System.out.println("Show List of Users: " + map);
		return URL_MAPPING + "/list_users";
	}
	
	@RequestMapping("/logout")
	public String logoutContact(Model map,HttpSession hs)
	{
		//invalidate 
		hs.invalidate();
		return URL_MAPPING + "/index"; // show index.jsp
	}

}
