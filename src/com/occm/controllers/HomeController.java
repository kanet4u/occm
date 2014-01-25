package com.occm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = { HomeController.URL_MAPPING })
public class HomeController {
	public static final String URL_MAPPING = "/home";

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map) {
		return URL_MAPPING + "/index"; // show index.jsp
	}

	
}
