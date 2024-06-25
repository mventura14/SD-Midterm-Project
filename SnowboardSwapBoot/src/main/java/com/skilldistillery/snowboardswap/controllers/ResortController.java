package com.skilldistillery.snowboardswap.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.LiftTypeDAO;
import com.skilldistillery.snowboardswap.data.ResortDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.LiftType;
import com.skilldistillery.snowboardswap.entities.Resort;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ResortController {

	private ResortDAO resortDAO;
	private AddressDAO addressDAO;
	private LiftTypeDAO liftTypeDAO;

	public ResortController(ResortDAO resortDAO, AddressDAO addressDAO, LiftTypeDAO liftTypeDAO) {
		this.resortDAO = resortDAO;
		this.addressDAO = addressDAO;
		this.liftTypeDAO = liftTypeDAO;
	}

	@GetMapping({ "resorts" })
	public ModelAndView showResorts() {
		ModelAndView mv = new ModelAndView();

		List<Resort> resorts = resortDAO.getResorts();

		mv.addObject("resorts", resorts);

		mv.setViewName("resorts");
		return mv;
	}

	@GetMapping({ "resort" })
	public ModelAndView getResort(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();

		Resort resort = resortDAO.getResortByID(id);
		List<LiftType> liftTypes = liftTypeDAO.getLiftTypeList(id);

		mv.addObject("resort", resort);
		mv.addObject("liftTypes", liftTypes);
		mv.setViewName("resortInfo");
		return mv;
	}

	@PostMapping("addResort")
	public ModelAndView addResort(Resort resort, Address address) {
		ModelAndView mv = new ModelAndView();

		address = addressDAO.addAddress(address);
		resort.setAddress(address);
		resort = resortDAO.addResort(resort);

		mv.setViewName("redirect:/resorts");
		return mv;
	}

	@PostMapping("editResort")
	public ModelAndView editResort(Resort resort, Address address, @RequestParam("addressId") int addressId,
			HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		address.setId(addressId);

		resortDAO.editResort(resort);
		addressDAO.editAddress(address);

		session.setAttribute("referer", request.getHeader("Referer"));
		String referer = session.getAttribute("referer") != null ? session.getAttribute("referer").toString() : "/";
		mv.setViewName("redirect:" + referer);
		return mv;

	}
}
