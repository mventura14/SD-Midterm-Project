package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.EventDAO;
import com.skilldistillery.snowboardswap.data.EventTypeDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class DashboardController {

	private EventDAO eventDAO;
	private AddressDAO addressDAO;
	private EventTypeDAO eventTypeDAO;
	private UserDAO userDAO;

	public DashboardController(EventDAO eventDAO, AddressDAO addressDAO, EventTypeDAO eventTypeDAO, UserDAO userDAO) {
		this.eventDAO = eventDAO;
		this.addressDAO = addressDAO;
		this.eventTypeDAO = eventTypeDAO;
		this.userDAO = userDAO;
	}

	@GetMapping("dashboard")
	public ModelAndView dashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("dashboard");

		if (session.getAttribute("loggedInUser") == null) {
			mv.setViewName("login");
			return mv;
		}

		return mv;
	}
}
