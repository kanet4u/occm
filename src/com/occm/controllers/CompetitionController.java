package com.occm.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.occm.models.Competition;
import com.occm.models.FirstVisit;
import com.occm.models.User;
import com.occm.models.UserCompetitions;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { CompetitionController.URL_MAPPING })
public class CompetitionController {
	public static final String URL_MAPPING = "/competition";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession hs) {
		/*
		 * Only if we want to restrict access to this page to only who are users
		 * and logged in if (hs.getAttribute("activeUser") == null) { return
		 * "/home/index"; }
		 */

		Collection<Competition> competitions = service.getCompetitionList();
		
		for (Competition competition : competitions) {
			competition.setAdditionalData();
			
		}

		ArrayList<Competition> sorted = new ArrayList<Competition>();
		sorted.addAll(competitions);
		Collections.sort(sorted, Competition.CompetitionStatusComparator);

		map.addAttribute("userCompetitions", sorted);

		return URL_MAPPING + "/list"; // show index.jsp
	}

	@RequestMapping("/mylist")
	public ModelAndView showMyCompetitions(Model map, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null) {
			return new ModelAndView("redirect:" + HomeController.URL_MAPPING);
		}
		Collection<UserCompetitions> competitions = service
				.getUserCompetitionList(((User) hs.getAttribute("activeUser")));

		for (UserCompetitions competition : competitions) {
			competition.getCompetition().setAdditionalData();
		}

		ArrayList<UserCompetitions> sorted = new ArrayList<UserCompetitions>();
		sorted.addAll(competitions);
		Collections.sort(sorted,
				UserCompetitions.UserCompetitionsStatusComparator);

		map.addAttribute("userCompetitions", sorted);

		return new ModelAndView(URL_MAPPING + "/mylist"); // show index.jsp
	}

	@RequestMapping("/join/{comp_id}")
	public ModelAndView joinCompetition(@PathVariable("comp_id") Long compId,
			Model map, HttpSession hs) {
		if (hs.getAttribute("activeUser") == null) {
			hs.setAttribute(
					"message_error",
					"Sign in to join competition.");
			return new ModelAndView("redirect:" + URL_MAPPING);
		}

		UserCompetitions userComp = service.joinUserCompetition(
				((User) hs.getAttribute("activeUser")),
				service.getCompetitionDetails(compId));
		hs.setAttribute("firstVisit", new FirstVisit(true));
		if (userComp != null) {
			hs.setAttribute(
					"message_success",
					"Join request has been send, please wait while the admin approves your request.");
		} else {
			hs.setAttribute("message_success",
					"Request Failed please try again later.");
		}

		return new ModelAndView("redirect:" + URL_MAPPING);
	}

}
