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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.occm.models.Competition;
import com.occm.models.FirstVisit;
import com.occm.models.Language;
import com.occm.models.Problem;
import com.occm.models.Submission;
import com.occm.models.User;
import com.occm.models.UserCompetitions;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { ProblemController.URL_MAPPING })
public class ProblemController {
	public static final String URL_MAPPING = "/problem";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping("/view/{id}")
	public String viewProblem(@PathVariable("id") Long id, Model map,
			HttpSession hs) {

		Problem problem = service.getProblemDetails(id);

		if (problem == null || !problem.getStatus()) {
			hs.setAttribute("message_error", "Problem not found.");
			return "redirect:" + HomeController.URL_MAPPING;
		}

		map.addAttribute("problem", problem);
		return URL_MAPPING + "/view";
	}

	@RequestMapping("/send/{id}")
	public String sendProblem(@PathVariable("id") Long id, Model map,
			HttpSession hs) {
		if (hs.getAttribute("activeUser") == null) {
			hs.setAttribute("message_error", "Sign in to write solution.");
			return "redirect:" + URL_MAPPING + "/view/" + id;
		}
		Problem problem = service.getProblemDetails(id);
		Collection<Language> languages=service.getLanguageList();
		
		if (problem == null || !problem.getStatus()) {
			hs.setAttribute("message_error", "Problem not found.");
			return "redirect:" + HomeController.URL_MAPPING;
		}

		map.addAttribute("languages", languages);
		map.addAttribute("problem", problem);
		return URL_MAPPING + "/send";
	}

	@RequestMapping(value = "/send/{id}", method = RequestMethod.POST)
	public String sendSolutionProblem(
			@RequestParam(value = "language", required = true) Long languageId,
			@RequestParam(value = "code", required = true) String solutionCode,
			@PathVariable("id") Long id, Model map, HttpSession hs) {
		User user = (User) hs.getAttribute("activeUser");

		if (user == null) {
			hs.setAttribute("message_error", "Sign in to write solution.");
			return "redirect:" + URL_MAPPING + "/view/" + id;
		}
		Language language=service.getLanguage(languageId);
		Problem problem = service.getProblemDetails(id);
		
		if (language==null || problem == null || !problem.getStatus()) {
			hs.setAttribute("message_error", "Request params not valid.");
			return "redirect:" + URL_MAPPING + "/send/" + id;
		}
		
		Submission submission = new Submission();
		submission.setUser(user);
		submission.setProblem(problem);

		map.addAttribute("problem", problem);
		return URL_MAPPING + "/send";
	}

	/*
	 * @RequestMapping("/view/{id}") public String
	 * viewCompetition(@PathVariable("id") Long compId, Model map, HttpSession
	 * hs) { if (hs.getAttribute("activeUser") == null) {
	 * hs.setAttribute("message_error", "Please, sign in to continue."); return
	 * "redirect:" + URL_MAPPING; } User user = (User)
	 * hs.getAttribute("activeUser"); Competition comp =
	 * service.getCompetitionDetails(compId); if (comp.getStatus() ==
	 * Competition.RUNNING || comp.getStatus() == Competition.UPCOMMING) { if
	 * (service.isUserJoinedAndAprovedToCompetition(user, comp)) { if
	 * (comp.getStatus() == Competition.UPCOMMING) {
	 * hs.setAttribute("message_error",
	 * "This Competition not started yet. Please wait."); return "redirect:" +
	 * URL_MAPPING; } } else { hs.setAttribute( "message_error",
	 * "User not approved to this competition. You should send the join request before start of competition or contact administrator."
	 * ); return "redirect:" + URL_MAPPING; } }
	 * 
	 * map.addAttribute("competition", comp); map.addAttribute("user", user);
	 * return URL_MAPPING + "/view"; }
	 */
}
