package com.occm.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.occm.models.User;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { HomeController.URL_MAPPING })
public class HomeController {
	public static final String URL_MAPPING = "/home";
	
	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession hs) {
		if (hs.getAttribute("activeUser") != null) {
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
	public ModelAndView logoutUser(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,HttpSession hs)
	{
		 
		//invalidate 
		hs.invalidate();
		return new ModelAndView("redirect:" + URL_MAPPING);
	}
	
	@RequestMapping("/register")
	public String showRegForm(Model map) {
		
		map.addAttribute(new User());
		return URL_MAPPING+"/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(
			@Valid/* @ModelAttribute("user") */User user,
			BindingResult results, Model map, HttpSession hs) {
		
		
		
		
		// chk for P.L errs
		if (results.hasErrors()) {
			return URL_MAPPING+"/register";
		}
		
		user.setImage("user.png");
		user.setStatus(service.getUserStatus(1L));
		user.setRole(service.getRole(2L));
		
		System.out.println("New User Role " + user.getRole());
		
		System.out.println("New User Status " + user.getStatus());
		
		user = service.register(user);
		
		
		if (user == null) {
			System.out.println("New User Errors were Found : " + user);
			map.addAttribute("errorMsg", "Registration Failed : As Email already exists.");
			return URL_MAPPING + "/register";
		}
		
		// Add User in Session to allow browsing as logged in user. 
		hs.setAttribute("activeUser", user);
		
		System.out.println("New User Successfully Added " + user);
	
		map.addAttribute("successMsg", "Registration is successful...");
		return URL_MAPPING+"/home";
	}

}
