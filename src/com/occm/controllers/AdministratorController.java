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
import com.occm.models.User;
import com.occm.services.interfaces.UserService;

@Controller
@RequestMapping(value = { AdministratorController.URL_MAPPING })
public class AdministratorController {
	public static final String URL_MAPPING = "/admin";

	@Autowired
	@Qualifier("user_service_dao")
	private UserService service;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession hs) {
		if(hs.getAttribute("management_dashboard")==null){
			return URL_MAPPING + "/login";
		}
		return URL_MAPPING + "/index";
	}

	
}
