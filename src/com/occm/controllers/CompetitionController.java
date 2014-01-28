package com.occm.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.occm.models.Competition;
import com.occm.models.CompetitionListDetails;
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
		ArrayList<CompetitionListDetails> details = new ArrayList<CompetitionListDetails>();
		String status = "", timeLeft = "";
		int userCount, problemCount;

		for (Competition competition : competitions) {
			Date current = new Date();
			if (competition.isLimited()) {
				if (current.compareTo(competition.getStartTime()) >= 0
						&& current.compareTo(competition.getEndTime()) <= 0) {
					status = "RUNNING";
					long duration = competition.getEndTime().getTime() - current.getTime();

					long diffHours = TimeUnit.MILLISECONDS.toHours(duration);
					long diffMinutes = TimeUnit.MILLISECONDS.toMinutes(duration
							- TimeUnit.HOURS.toMillis(diffHours));
					long diffSeconds = TimeUnit.MILLISECONDS.toSeconds(duration
							- TimeUnit.MINUTES.toMillis(diffMinutes) - TimeUnit.HOURS.toMillis(diffHours) );

					timeLeft = "" + diffHours + " : " + diffMinutes + " : "
							+ diffSeconds;
				} else if (current.compareTo(competition.getStartTime()) < 0) {
					status = "UPCOMMING";
				} else if (current.compareTo(competition.getEndTime()) > 0) {
					status = "ARCHIEVED";
				}

			} else {
				status = "NEVERENDING";
			}
			userCount = competition.getUsers().size();
			problemCount = competition.getProblems().size();
			details.add(new CompetitionListDetails(status, userCount,
					problemCount, timeLeft));
		}

		map.addAttribute("userCompetitions", competitions);
		map.addAttribute("userCompetitionsDetails", details);

		return URL_MAPPING + "/list"; // show index.jsp
	}

}
