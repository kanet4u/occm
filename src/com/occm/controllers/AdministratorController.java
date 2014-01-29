package com.occm.controllers;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.occm.models.Role;
import com.occm.models.User;
import com.occm.models.UserStatus;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { AdministratorController.URL_MAPPING })
public class AdministratorController {
	public static final String URL_MAPPING = "/admin";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession hs) {
		/* map.addAttribute("message_success", "Some Message Here"); */
		if (hs.getAttribute("management_dashboard") == null) {
			return URL_MAPPING + "/login";
		}
		return URL_MAPPING + "/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(
			@RequestParam(value = "email", required = true) String userName,
			@RequestParam(value = "password", required = true) String password,
			final RedirectAttributes redirectAttributes, ModelMap map,
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

	@RequestMapping("/user")
	public String usersList(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
		if (hs.getAttribute("user_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:" + URL_MAPPING;
		}
		map.addAttribute("usersactive", "active");
		map.addAttribute("users", service.viewAll());

		return URL_MAPPING + "/user/index";
	}

	@RequestMapping("/user/delete/{id}")
	public String userDelete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("user_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			User u = service.unsubscribe(id);
			redirectAttributes.addFlashAttribute("message_success",
					"User " + u.getEmail() + " is deleted.");
		}
		return "redirect:" + URL_MAPPING + "/user";
	}


	@RequestMapping("/user/roles")
	public String userRoles(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
		if (hs.getAttribute("role_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:" + URL_MAPPING+"/user";
		}
		map.addAttribute("usersactive", "active");
		map.addAttribute("roles", service.getRoleList());

		return URL_MAPPING + "/user/roles";
	}

	@RequestMapping("/user/roles/delete/{id}")
	public String userRoleDelete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("role_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			
			redirectAttributes.addFlashAttribute("message_success",
					"Role " +id + " is deleted.");
		}
		return "redirect:" + URL_MAPPING + "/user/roles";
	}

	@RequestMapping("/user/edit/{id}")
	public ModelAndView userEdit(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("user_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		}
		
		User user = service.getDetails(id);		
		hs.setAttribute("user", user);
		
		Collection<Role> roles = service.getRoleList();
		hs.setAttribute("roleList", roles);
		
		Collection<UserStatus> statusList = service.getUserStatusList();
		hs.setAttribute("statusList", statusList);
		
		return new ModelAndView(URL_MAPPING + "/user/edit");
	}
	
}
