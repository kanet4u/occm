package com.occm.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.occm.models.Competition;
import com.occm.models.User;
import com.occm.models.UserCompetitions;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { AdminCompetitionController.URL_MAPPING })
public class AdminCompetitionController {
	public static final String URL_MAPPING = "/admin/competition";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
		/* map.addAttribute("message_success", "Some Message Here"); */

		if (hs.getAttribute("competition_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission Denied");
			return "redirect:" + AdministratorController.URL_MAPPING;
		}

		Collection<Competition> competitions = service.getCompetitionList();

		for (Competition competition : competitions) {
			Date current = new Date();
			competition.setStatus(current);
			competition.setDuration();

			competition.setUserCount(competition.getUsers().size());
			competition.setProblemCount(competition.getProblems().size());
		}

		map.addAttribute("userCompetitions", competitions);
		map.addAttribute("compactive", "active");
		return URL_MAPPING + "/index";
	}

	@RequestMapping(value = "/request", method = RequestMethod.GET)
	public String joinRequests(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
		/* map.addAttribute("message_success", "Some Message Here"); */

		if (hs.getAttribute("competition_join_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission Denied");
			return "redirect:" + URL_MAPPING;
		}

		Collection<UserCompetitions> competitions = service
				.getJoinRequestList();

		map.addAttribute("userCompetitions", competitions);
		map.addAttribute("compactive", "active");
		return URL_MAPPING + "/request";
	}

	@RequestMapping("/request/delete/{id}")
	public String requestDelete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("competition_join_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			redirectAttributes.addFlashAttribute("message_success",
					"Join Request " + id + " is deleted.");
		}
		return "redirect:" + URL_MAPPING + "/request";
	}
	
	@RequestMapping("/request/approve/{id}")
	public String requestApprove(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("competition_join_approve") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {

			redirectAttributes.addFlashAttribute("message_success",
					"Join Request " + id + " is approved.");
		}
		return "redirect:" + URL_MAPPING + "/request";
	}

	@RequestMapping("/request/approveall")
	public String requestApproveAll(
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("competition_join_approve") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {

			redirectAttributes.addFlashAttribute("message_success",
					"All Join Requests are approved.");
		}
		return "redirect:" + URL_MAPPING + "/request";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView joinList(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, HttpSession hs) {
		return new ModelAndView(URL_MAPPING + "/index");
	}

	@RequestMapping(value = "/active", method = RequestMethod.GET)
	public ModelAndView activeList(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, HttpSession hs) {
		return new ModelAndView(URL_MAPPING + "/index");
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addCompetition(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, HttpSession hs) {
		return new ModelAndView(URL_MAPPING + "/index");
	}

	@RequestMapping("/edit/{comp_id}")
	public ModelAndView editCompetition(@PathVariable("comp_id") Long compId,
			final RedirectAttributes redirectAttributes, Model map,
			HttpSession hs) {

		if (hs.getAttribute("management_dashboard") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"You don't have proper authorization.");
			return new ModelAndView(AdministratorController.URL_MAPPING
					+ "/login");
		}

		Competition comp = (Competition) service.getCompetitionDetails(compId);
		if (comp == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Competition Not Found");
			return new ModelAndView("redirect: " + URL_MAPPING);
		}
		map.addAttribute("competition", comp);
		return new ModelAndView(URL_MAPPING + "/edit");
	}

	@RequestMapping(value = "/edit/{comp_id}", method = RequestMethod.POST)
	public ModelAndView register(
			@Valid/* @ModelAttribute("user") */Competition comp,
			BindingResult results, final RedirectAttributes redirectAttributes,
			Model map, HttpSession hs) {

		// chk for P.L errs
		if (results.hasErrors()) {
			map.addAttribute("competition", comp);
			map.addAttribute("message_error", "Competition Updation Failed");
			return new ModelAndView(URL_MAPPING + "/edit");
		}

		comp = service.updateCompetition(comp);
		if(comp==null){
			map.addAttribute("competition", comp);
			map.addAttribute("message_error", "Competition Updation Failed");
			return new ModelAndView(URL_MAPPING + "/edit");
		}
		

		redirectAttributes.addFlashAttribute("message_success",
				"Competition Updated Successfully "+comp.getTitle());
		return new ModelAndView("redirect:" + URL_MAPPING);
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("competition_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			if( service.deleteCompetition(id)){
				redirectAttributes.addFlashAttribute("message_success",
					"Competition " + id + " is deleted.");
			}
			else{
				redirectAttributes.addFlashAttribute("message_error",
						"Competition " + id + " is NOT deleted.");
			}
		}
		return "redirect:" + URL_MAPPING;
	}
	
	

	/*
	 * 
	 * @RequestMapping(value="/login", method = RequestMethod.POST) public
	 * ModelAndView login(
	 * 
	 * @RequestParam(value = "email", required = true) String userName,
	 * 
	 * @RequestParam(value = "password", required = true) String password, final
	 * RedirectAttributes redirectAttributes, ModelMap map, HttpSession hs) {
	 * 
	 * User user = service.validate(new User(userName, password)); if (user !=
	 * null) { if (user.getStatus().isActive()) { user.setLoggedIn(hs);
	 * redirectAttributes.addFlashAttribute("message_success",
	 * "You have successfully logged in."); } else {
	 * redirectAttributes.addFlashAttribute("message_error",
	 * "User is not active!"); } } else {
	 * redirectAttributes.addFlashAttribute("message_error",
	 * "Email or password incorrect!"); } return new ModelAndView("redirect:" +
	 * URL_MAPPING); }
	 * 
	 * @RequestMapping("/logout") public ModelAndView
	 * logoutUser(HttpServletRequest httpServletRequest, HttpServletResponse
	 * httpServletResponse, HttpSession hs) { hs.invalidate(); return new
	 * ModelAndView("redirect:" + URL_MAPPING); }
	 * 
	 * @RequestMapping("/users") public String usersList(final
	 * RedirectAttributes redirectAttributes, ModelMap map, HttpSession hs) { if
	 * (hs.getAttribute("management_dashboard") == null) { return URL_MAPPING +
	 * "/login"; } if (hs.getAttribute("user_list") == null) {
	 * redirectAttributes.addFlashAttribute("message_error",
	 * "Permittion dined!"); return "redirect:" + URL_MAPPING; }
	 * 
	 * map.addAttribute("users", service.viewAll());
	 * 
	 * return URL_MAPPING + "/users/list"; }
	 */
}
