package com.occm.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.parsing.Problem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import com.occm.models.Competition;
import com.occm.models.FirstVisit;
import com.occm.models.Submission;
import com.occm.models.User;
import com.occm.models.UserCompetitions;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { JudgeController.URL_MAPPING })
public class JudgeController {
	public static final String URL_MAPPING = "/submission";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession hs) {
		
		Collection<Submission> submissions = service.getSubmissionList();
		map.addAttribute("submissions", submissions);

		return URL_MAPPING + "/list"; 
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
			hs.setAttribute("message_error", "Sign in to join competition.");
			return new ModelAndView("redirect:" + URL_MAPPING);
		}
		Competition comp = service.getCompetitionDetails(compId);
		if (comp.getStatus() == Competition.UPCOMMING) {
			UserCompetitions userComp = service.joinUserCompetition(
					((User) hs.getAttribute("activeUser")), comp);
			hs.setAttribute("firstVisit", new FirstVisit(true));
			if (userComp != null) {
				hs.setAttribute(
						"message_success",
						"Join request has been send, please wait while the admin approves your request.");
			} else {
				hs.setAttribute("message_success",
						"Your Request is pending, please wait while the admin approves your request.");
			}
		}else{
			hs.setAttribute("message_error",
					"You can join only to UPCOMING competitions.");
		}
		return new ModelAndView("redirect:" + URL_MAPPING);
	}

	@RequestMapping("/view/{id}")
	public String viewCompetition(@PathVariable("id") Long compId, Model map,
			HttpSession hs) {
		if (hs.getAttribute("activeUser") == null) {
			hs.setAttribute("message_error", "Please, sign in to continue.");
			return "redirect:" + URL_MAPPING;
		}
		User user = (User) hs.getAttribute("activeUser");
		Competition comp = service.getCompetitionDetails(compId);
		
		Collection<com.occm.models.Problem> problems = service.getProblemList(comp);
		
		if (comp.getStatus() == Competition.RUNNING
				|| comp.getStatus() == Competition.UPCOMMING) {
			if (service.isUserJoinedAndAprovedToCompetition(user, comp)) {
				if (comp.getStatus() == Competition.UPCOMMING) {
					hs.setAttribute("message_error",
							"This Competition not started yet. Please wait.");
					return "redirect:" + URL_MAPPING;
				}
			} else {
				hs.setAttribute(
						"message_error",
						"User not approved to this competition. You should send the join request before start of competition or contact administrator.");
				return "redirect:" + URL_MAPPING;
			}
		}
		map.addAttribute("problems", problems);
		map.addAttribute("competition", comp);
		map.addAttribute("user", user);
		return URL_MAPPING + "/view";
	}
}
