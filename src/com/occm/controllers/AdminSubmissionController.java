package com.occm.controllers;

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

import com.occm.models.User;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { AdminSubmissionController.URL_MAPPING })
public class AdminSubmissionController {
	public static final String URL_MAPPING = "/admin/submission";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
		if (hs.getAttribute("submission_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:/admin";
		}
		map.addAttribute("submissions", service.getSubmissionList());

		return URL_MAPPING + "/index";
	}

	@RequestMapping("/delete/{id}")
	public String submissionDelete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, 
			ModelMap map,
			HttpSession hs) {
		if (hs.getAttribute("submission_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			redirectAttributes.addFlashAttribute("message_success",
					"Submission " + id + " is deleted.");
		}
		return "redirect:" + URL_MAPPING;
	}
	
}
