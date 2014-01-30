package com.occm.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.ServletContext;
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
import com.occm.models.Language;
import com.occm.models.Problem;
import com.occm.models.Submission;
import com.occm.models.Tag;
import com.occm.models.TestCase;
import com.occm.models.User;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { AdminProblemController.URL_MAPPING })
public class AdminProblemController {
	public static final String URL_MAPPING = "/admin/problem";
	@Autowired
	ServletContext context;

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
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
			if (service.deleteProblem(id)) {
				redirectAttributes.addFlashAttribute("message_success",
						"Problem " + id + " is deleted.");
			} else {
				redirectAttributes.addFlashAttribute("message_error",
						"Problem " + id + " is NOT deleted.");
			}
		}
		return "redirect:" + URL_MAPPING;
	}

	@RequestMapping(value = "/tags", method = RequestMethod.GET)
	public String tags(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
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
			/* User u = service.unsubscribe(id); */
			redirectAttributes.addFlashAttribute("message_success", "Tag " + id
					+ " is deleted.");
		}
		return "redirect:" + URL_MAPPING + "/tags";
	}

	@RequestMapping(value = "/tags/edit", method = RequestMethod.POST)
	public String tagEdit(@RequestParam(value = "id") long id,
			@RequestParam(value = "tag", required = true) String tag,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {

		if (hs.getAttribute("tag_edit") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			if (id == -1) {
				// create
			} else {
				// edit
			}

			redirectAttributes.addFlashAttribute("message_success",
					"Tag <span class='badge'>" + tag + "</span> is saved.");
		}
		return "redirect:" + URL_MAPPING + "/tags";
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
		Collection<Competition> competitionList = (Collection<Competition>) service
				.getCompetitionList();
		System.out.println(" Comp List: " + competitionList.size());

		Collection<Tag> tagsList = service.getTagList();

		ArrayList<String> aliasList = new ArrayList<String>();
		aliasList.add("A");
		aliasList.add("B");
		aliasList.add("C");
		aliasList.add("D");
		aliasList.add("E");
		aliasList.add("F");
		HashMap<String, String> statusList = new HashMap<String, String>();
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
		map.addAttribute("problemsactive", "active");
		return new ModelAndView(URL_MAPPING + "/edit");
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editCompetition(
			@Valid/* @ModelAttribute("user") */Problem prob,
			BindingResult results, final RedirectAttributes redirectAttributes,
			Model map, HttpSession hs, HttpServletRequest req) {

		prob.setCreated(new Date());

		prob.setCompetition(service.getCompetitionDetails(Long.parseLong(req
				.getParameter("competition"))));

		if (req.getParameterMap().keySet().contains("tags")) {
			String[] tags = req.getParameterValues("tags");
			if (tags.length > 0)
				for (String id : tags) {
					prob.getTags().add(
							service.getTagDetails(Long.parseLong(id)));
				}
		}
		/*
		 * // chk for P.L errs if (results.hasErrors()) {
		 * //System.out.println("P.L errs"); return new ModelAndView(URL_MAPPING
		 * + "/edit"); }
		 */

		prob = service.updateProblem(prob);
		if (prob == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Problem Updation Failed2");
			return new ModelAndView("redirect:" + URL_MAPPING + "/edit/"
					+ prob.getId());
		}

		redirectAttributes.addFlashAttribute("message_success",
				"Competition Updated Successfully " + prob.getTitle());
		return new ModelAndView("redirect:" + URL_MAPPING);
	}

	@RequestMapping("/add")
	public ModelAndView addCompetition(
			final RedirectAttributes redirectAttributes, Model map,
			HttpSession hs) {

		if (hs.getAttribute("management_dashboard") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"You don't have proper authorization.");
			return new ModelAndView(AdministratorController.URL_MAPPING
					+ "/login");
		}

		Problem prob = new Problem();
		Collection<Competition> competitionList = (Collection<Competition>) service
				.getCompetitionList();
		System.out.println(" Comp List: " + competitionList.size());

		Collection<Tag> tagsList = service.getTagList();

		ArrayList<String> aliasList = new ArrayList<String>();
		aliasList.add("A");
		aliasList.add("B");
		aliasList.add("C");
		aliasList.add("D");
		aliasList.add("E");
		aliasList.add("F");
		HashMap<String, String> statusList = new HashMap<String, String>();
		statusList.put("0", "Disabled");
		statusList.put("1", "Enabled");

		map.addAttribute("problem", prob);
		map.addAttribute("competitionList", competitionList);
		map.addAttribute("tagsList", tagsList);
		map.addAttribute("aliasList", aliasList);
		map.addAttribute("statusList", statusList);
		map.addAttribute("problemsactive", "active");
		return new ModelAndView(URL_MAPPING + "/edit");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addCompetition(
			@Valid/* @ModelAttribute("user") */Problem prob,
			BindingResult results, final RedirectAttributes redirectAttributes,
			Model map, HttpSession hs, HttpServletRequest req) {

		prob.setCreated(new Date());
		if (req.getParameter("competition") != null) {
			prob.setCompetition(service.getCompetitionDetails(Long
					.parseLong(req.getParameter("competition"))));
		}
		if (req.getParameterValues("tags") != null) {
			for (String id : req.getParameterValues("tags")) {
				prob.getTags().add(service.getTagDetails(Long.parseLong(id)));
			}
		}

		prob = service.addProblem(prob);
		if (prob == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Problem Updation Failed2");
			return new ModelAndView("redirect:" + URL_MAPPING + "/edit/"
					+ prob.getId());
		}

		redirectAttributes.addFlashAttribute("message_success",
				"Competition Updated Successfully " + prob.getTitle());
		return new ModelAndView("redirect:" + URL_MAPPING);
	}

	@RequestMapping(value = "/tests", method = RequestMethod.GET)
	public String tests(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {
		if (hs.getAttribute("problem_test_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:" + AdministratorController.URL_MAPPING;
		}
		Collection<TestCase> tests = service.getTestCaseList();

		map.addAttribute("tests", tests);
		map.addAttribute("problemsactive", "active");
		return URL_MAPPING + "/tests";
	}

	@RequestMapping("/tests/delete/{id}")
	public String problemTestDelete(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {

		if (hs.getAttribute("problem_test_edit") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
		} else {
			if (service.deleteTestCase(id)) {
				redirectAttributes.addFlashAttribute("message_success",
						"Test Case #" + id + " is deleted.");
			} else {
				redirectAttributes.addFlashAttribute("message_error",
						"Test Case #" + id + " is NOT deleted.");
			}
		}
		return "redirect:" + URL_MAPPING + "/tests";
	}

	@RequestMapping(value = "/tests/add", method = RequestMethod.GET)
	public String problemTestAdd(final RedirectAttributes redirectAttributes,
			ModelMap map, HttpSession hs) {

		if (hs.getAttribute("problem_test_edit") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:" + URL_MAPPING + "/tests";
		}

		map.addAttribute("problems", service.getProblemList());
		map.addAttribute("problemsactive", "active");
		return URL_MAPPING + "/tests/add";
	}

	@RequestMapping(value = "/tests/add", method = RequestMethod.POST)
	public String addTest(
			@RequestParam(value = "problem_id", required = true) Long problem_id,
			@RequestParam(value = "input", required = true) String input,
			@RequestParam(value = "output", required = true) String output,
			final RedirectAttributes redirectAttributes, Model map,
			HttpSession hs, HttpServletRequest req) {

		User user = (User) hs.getAttribute("activeUser");

		if (hs.getAttribute("competition_list") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission Denied");
			return "redirect:" + URL_MAPPING + "/tests";
		}

		TestCase test = new TestCase();
		Problem problem = service.getProblemDetails(problem_id);

		test.setProblem(problem);
		test.setInput(input);
		test.setOutput(output);

		test = service.addTestCase(test);

		if (test.getId() > 0) {
			hs.setAttribute("message_success", "Test Case Saved Successfully.");

		} else {
			hs.setAttribute("message_error", "Test Case not saved, try later.");
		}

		try {
			saveTestToFile(problem.getId(), test.getId(), input, output);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			hs.setAttribute("message_error", e.getMessage());
			e.printStackTrace();
		}

		return "redirect:" + URL_MAPPING + "/tests";
	}

	@RequestMapping(value = "/tests/edit/{id}", method = RequestMethod.GET)
	public String problemTestEdit(@PathVariable("id") Long id,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {

		if (hs.getAttribute("problem_test_edit") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:" + URL_MAPPING + "/tests";
		}

		map.addAttribute("problems", service.getProblemList());
		map.addAttribute("test", service.getTestCaseDetails(id));
		map.addAttribute("problemsactive", "active");
		return URL_MAPPING + "/tests/add";
	}

	@RequestMapping(value = "/tests/edit/{id}", method = RequestMethod.POST)
	public String problemTestEditSave(
			@PathVariable("id") Long id,
			@RequestParam(value = "problem_id", required = true) Long problem_id,
			@RequestParam(value = "input", required = true) String input,
			@RequestParam(value = "output", required = true) String output,
			final RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession hs) {

		if (hs.getAttribute("problem_test_edit") == null) {
			redirectAttributes.addFlashAttribute("message_error",
					"Permission denied!");
			return "redirect:" + URL_MAPPING + "/tests";
		}

		TestCase test = service.getTestCaseDetails(id);
		Problem problem = service.getProblemDetails(problem_id);

		test.setProblem(problem);
		test.setInput(input);
		test.setOutput(output);

		test = service.addTestCase(test);

		if (test.getId() > 0) {
			hs.setAttribute("message_success", "Test Case Saved Successfully.");

		} else {
			hs.setAttribute("message_error", "Test Case not saved, try later.");
		}

		try {
			saveTestToFile(problem.getId(), test.getId(), input, output);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			hs.setAttribute("message_error", e.getMessage());
			e.printStackTrace();
		}
		return "redirect:" + URL_MAPPING + "/tests";
	}

	protected boolean saveTestToFile(Long problemId, Long testId, String input,
			String output) throws IOException {
		
		File dir = new File("C:/test/" + problemId);
		dir.mkdir();

		String pathIn = dir.getAbsoluteFile() + "/" + testId + ".in";
		String pathOut = dir.getAbsoluteFile() + "/" + testId + ".out";

		File file1 = new File(pathIn);
		File file2 = new File(pathOut);
		
		file1.createNewFile();
		file2.createNewFile();
	
		FileWriter fw = new FileWriter(pathIn); 
		fw.write(input); 
		fw.flush();
		
		FileWriter fw2 = new FileWriter(pathOut); 
		fw2.write(output); 
		fw2.flush();

		

		return true;
	}
}
