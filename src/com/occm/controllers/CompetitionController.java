package com.occm.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.occm.models.Competition;
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
		/* Only if we want to restrict access to this page to only who are users and logged in
		 * if (hs.getAttribute("activeUser") == null) {
			return "/home/index";
		}*/

		Collection<Competition> competitions = service.getCompetitionList();

		for (Competition competition : competitions) {
			Date current = new Date();
			competition.setStatus(current);
			competition.setDuration();
			
			competition.setUserCount(competition.getUsers().size());
			competition.setProblemCount(competition.getProblems().size());
		}

		ArrayList<Competition> sorted = new ArrayList<Competition>();
		sorted.addAll(competitions);
		Collections.sort(sorted,Competition.CompetitionStatusComparator);
		
		map.addAttribute("userCompetitions", sorted);

		return URL_MAPPING + "/list"; // show index.jsp
	}

}
