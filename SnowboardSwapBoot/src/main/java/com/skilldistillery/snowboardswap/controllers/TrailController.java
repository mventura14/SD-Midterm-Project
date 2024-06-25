package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.ResortDAO;
import com.skilldistillery.snowboardswap.data.TrailDAO;
import com.skilldistillery.snowboardswap.entities.Resort;
import com.skilldistillery.snowboardswap.entities.Trail;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TrailController {

	private TrailDAO trailDAO;
	private ResortDAO resortDAO;

	public TrailController(TrailDAO trailDAO, ResortDAO resortDAO) {
		this.trailDAO = trailDAO;
		this.resortDAO = resortDAO;
	}

	@PostMapping("addTrail")
	public ModelAndView addTrail(Trail trail, @RequestParam("resortId") int resortID, HttpSession session,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		Resort resort = resortDAO.getResortByID(resortID);
		trail.setResort(resort);

		System.out.println(trail);

		Trail newTrail = trailDAO.addTrail(trail);

		session.setAttribute("referer", request.getHeader("Referer"));
		String referer = session.getAttribute("referer") != null ? session.getAttribute("referer").toString() : "/";
		mv.setViewName("redirect:" + referer);
		return mv;
	}

	@PostMapping("editTrail")
	public ModelAndView editTrail(Trail trail, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		trailDAO.editTrail(trail);

		session.setAttribute("referer", request.getHeader("Referer"));
		String referer = session.getAttribute("referer") != null ? session.getAttribute("referer").toString() : "/";
		mv.setViewName("redirect:" + referer);
		return mv;
	}
}
