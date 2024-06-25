package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.LiftDAO;
import com.skilldistillery.snowboardswap.data.LiftTypeDAO;
import com.skilldistillery.snowboardswap.data.ResortDAO;
import com.skilldistillery.snowboardswap.entities.Lift;
import com.skilldistillery.snowboardswap.entities.Resort;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LiftController {

	private LiftDAO liftDAO;
	private ResortDAO resortDAO;
	private LiftTypeDAO liftTypeDAO;

	public LiftController(LiftDAO liftDAO, ResortDAO resortDAO, LiftTypeDAO liftTypeDAO) {
		this.liftDAO = liftDAO;
		this.resortDAO = resortDAO;
		this.liftTypeDAO = liftTypeDAO;
	}

	@PostMapping("addLift")
	public ModelAndView addLift(Lift lift, @RequestParam("resortId") int resortID,
			@RequestParam("liftTypeId") int liftTypeID, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		Resort resort = resortDAO.getResortByID(resortID);
		lift.setResort(resort);
		lift.setLiftType(liftTypeDAO.findLiftTypeByID(liftTypeID));

		Lift newLift = liftDAO.addLift(lift);
		System.out.println(newLift);

		session.setAttribute("referer", request.getHeader("Referer"));
		String referer = session.getAttribute("referer") != null ? session.getAttribute("referer").toString() : "/";
		mv.setViewName("redirect:" + referer);
		return mv;
	}

	@PostMapping("editLift")
	public ModelAndView editLift(Lift lift, HttpSession session, HttpServletRequest request,
			@RequestParam("liftTypeId") int typeId) {
		ModelAndView mv = new ModelAndView();

		lift.setLiftType(liftTypeDAO.findLiftTypeByID(typeId));
		liftDAO.editLift(lift);

		session.setAttribute("referer", request.getHeader("Referer"));
		String referer = session.getAttribute("referer") != null ? session.getAttribute("referer").toString() : "/";
		mv.setViewName("redirect:" + referer);
		return mv;
	}

}
