package com.occm.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.occm.models.Competition;
import com.occm.models.User;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { AdminProblemController.URL_MAPPING })
public class AdminProblemController {
	public static final String URL_MAPPING = "/admin/problem";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(final RedirectAttributes redirectAttributes, ModelMap map, HttpSession hs) {
		if (hs.getAttribute("problem_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:" + URL_MAPPING;
		}
		Collection<Competition> problems = service.getCompetitionList();

		map.addAttribute("problems", problems);
		
		return URL_MAPPING + "/index";
	}
	
	@RequestMapping(value="/join",method = RequestMethod.GET)
	public ModelAndView joinList(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, HttpSession hs) {
		return new ModelAndView(URL_MAPPING+"/index");
	}
	
	@RequestMapping(value="/active",method = RequestMethod.GET)
	public ModelAndView activeList(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, HttpSession hs) {
		return new ModelAndView(URL_MAPPING+"/index");
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public ModelAndView addCompetition(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, HttpSession hs) {
		return new ModelAndView(URL_MAPPING+"/index");
	}
	
	@RequestMapping("/edit/{comp_id}")
	public ModelAndView editCompetition(@PathVariable("comp_id") Long compId, Model map, HttpSession hs) {
		
		return new ModelAndView(URL_MAPPING+"/edit");
	}
	@RequestMapping("/delete/{comp_id}")
	public ModelAndView deleteCompetition(@PathVariable("comp_id") Long compId, Model map, HttpSession hs) {
		
		return new ModelAndView("redirect:"+URL_MAPPING);
	}

/*	
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login(
			@RequestParam(value = "email", required = true) String userName,
			@RequestParam(value = "password", required = true) String password,
			final RedirectAttributes redirectAttributes, 
			ModelMap map,
			HttpSession hs) {

		User user = service.validate(new User(userName, password));
		if (user != null) {
			if (user.getStatus().isActive()) {
				user.setLoggedIn(hs);
				redirectAttributes.addFlashAttribute("message_success",
						"You have successfully logged in.");
			} else {
				redirectAttributes.addFlashAttribute("message_error",
						"User is not active!");
			}
		} else {
			redirectAttributes.addFlashAttribute("message_error",
					"Email or password incorrect!");
		}
		return new ModelAndView("redirect:" + URL_MAPPING);
	}

	@RequestMapping("/logout")
	public ModelAndView logoutUser(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, HttpSession hs) {
		hs.invalidate();
		return new ModelAndView("redirect:" + URL_MAPPING);
	}

	@RequestMapping("/users")
	public String usersList(final RedirectAttributes redirectAttributes, ModelMap map, HttpSession hs) {
		if (hs.getAttribute("management_dashboard") == null) {
			return URL_MAPPING + "/login";
		}
		if (hs.getAttribute("user_list") == null) {
			redirectAttributes.addFlashAttribute("message_error", "Permittion dined!");
			return "redirect:" + URL_MAPPING;
		}
		
		map.addAttribute("users", service.viewAll());

		return URL_MAPPING + "/users/list";
	}
*/
}
