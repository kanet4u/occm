package com.occm.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.occm.models.Competition;
import com.occm.models.Problem;
import com.occm.models.Tag;
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
			return "redirect:/admin";
		}
		Collection<Problem> problems = service.getProblemList();

		map.addAttribute("problems", problems);
		map.addAttribute("problemsactive", "active");
		return URL_MAPPING + "/index";
	}
	
	@RequestMapping("/delete/{id}")
	public String problemDelete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		
		if (hs.getAttribute("problem_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			if( service.deleteProblem(id)){
				redirectAttributes.addFlashAttribute("message_success",
					"Problem " + id + " is deleted.");
			}
			else{
				redirectAttributes.addFlashAttribute("message_error",
						"Problem " + id + " is NOT deleted.");
			}
		}
		return "redirect:" + URL_MAPPING;
	}

	@RequestMapping(value="/tags",method = RequestMethod.GET)
	public String tags(final RedirectAttributes redirectAttributes, ModelMap map, HttpSession hs) {
		if (hs.getAttribute("tag_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:/admin";
		}
		Collection<Tag> tags = service.getTagList();

		map.addAttribute("tags", tags);
		map.addAttribute("problemsactive", "active");
		return URL_MAPPING + "/tags";
	}
	
	@RequestMapping("/tags/delete/{id}")
	public String tagDelete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {
		
		if (hs.getAttribute("tag_delete") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			/*User u = service.unsubscribe(id);*/
			redirectAttributes.addFlashAttribute("message_success",
					"Tag " +id + " is deleted.");
		}
		return "redirect:" + URL_MAPPING+"/tags";
	}
	
	@RequestMapping(value="/tags/edit", method = RequestMethod.POST)
	public String tagEdit(
			@RequestParam(value = "id") long id,
			@RequestParam(value = "tag", required = true) String tag,
			final RedirectAttributes redirectAttributes, 
			ModelMap map,
			HttpSession hs) {
		
		if (hs.getAttribute("tag_edit") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			if(id==-1){
				//create
			}else{
				//edit
			}

			redirectAttributes.addFlashAttribute("message_success",
					"Tag <span class='badge'>" +tag + "</span> is saved.");
		}
		return "redirect:" + URL_MAPPING+"/tags";
	}
	
	@RequestMapping("/edit/{id}")
	public ModelAndView editCompetition(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, Model map,
			HttpSession hs) {

		if (hs.getAttribute("management_dashboard") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"You don't have proper authorization.");
			return new ModelAndView(AdministratorController.URL_MAPPING
					+ "/login");
		}

		Problem prob = (Problem) service.getProblemDetails(id);
		Collection<Competition> competitionList = (Collection<Competition>) service.getCompetitionList();
		System.out.println(" Comp List: "+competitionList.size());
		
		Collection<Tag> tagsList = service.getTagList();
		
		ArrayList<String> aliasList = new ArrayList<String>();
		aliasList.add("A");aliasList.add("B");aliasList.add("C");aliasList.add("D");aliasList.add("E");aliasList.add("F");
		HashMap<String,String> statusList = new HashMap<String,String>();
		statusList.put("0", "Disabled");
		statusList.put("1", "Enabled");
		
		if (prob == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Problem Not Found");
			return new ModelAndView("redirect: " + URL_MAPPING);
		}
		map.addAttribute("problem", prob);
		map.addAttribute("competitionList", competitionList);
		map.addAttribute("tagsList", tagsList);
		map.addAttribute("aliasList", aliasList);
		map.addAttribute("statusList", statusList);
		
		return new ModelAndView(URL_MAPPING + "/edit");
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView register(
			@Valid/* @ModelAttribute("user") */Problem prob,
			BindingResult results, final RedirectAttributes redirectAttributes,
			Model map, HttpSession hs, HttpServletRequest req) {
		
		prob.setCreated(new Date());
		
		prob.setCompetition(service.getCompetitionDetails(Long.parseLong(req.getParameter("competition"))));
		
		for(String id :req.getParameterValues("tags")){
			prob.getTags().add(service.getTagDetails(Long.parseLong(id)));
		}
		
		
		/*// chk for P.L errs
		if (results.hasErrors()) {
			//System.out.println("P.L errs");
			return new ModelAndView(URL_MAPPING + "/edit");
		}*/

		prob = service.updateProblem(prob);
		if(prob==null){
			redirectAttributes.addFlashAttribute("message_error", "Problem Updation Failed2");
			return new ModelAndView("redirect:"+URL_MAPPING + "/edit/"+prob.getId());
		}
		

		redirectAttributes.addFlashAttribute("message_success",
				"Competition Updated Successfully "+prob.getTitle());
		return new ModelAndView("redirect:" + URL_MAPPING);
	}
}
