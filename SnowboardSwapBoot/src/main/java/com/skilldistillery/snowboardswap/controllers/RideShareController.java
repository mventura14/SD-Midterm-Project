package com.skilldistillery.snowboardswap.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.ResortDAO;
import com.skilldistillery.snowboardswap.data.RideShareDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.Ride;
import com.skilldistillery.snowboardswap.entities.User;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class RideShareController {

	private RideShareDAO rideShareDAO;
	private AddressDAO addressDAO;
	private ResortDAO resortDAO;

	public RideShareController(UserDAO userDAO, RideShareDAO rideShareDAO, AddressDAO addressDAO, ResortDAO resortDAO) {
		this.rideShareDAO = rideShareDAO;
		this.addressDAO = addressDAO;
		this.resortDAO = resortDAO;
	}

	@PostMapping("rideshare")
	public String createRideShare(@RequestParam("sponsorid") int id, @RequestParam("resortid") int resortId,
			@RequestParam("street1") String street1, @RequestParam("city1") String city1,
			@RequestParam("state1") String state1, @RequestParam("street2") String street2,
			@RequestParam("city2") String city2, @RequestParam("state2") String state2, Model model,
			BindingResult result, Ride ride, HttpSession session) {

		User loggedInUser = (User) session.getAttribute("loggedInUser");

		// Ride ride = new Ride();
		ride.setUser(loggedInUser);

		Address departureAddress = addressDAO.createAddress(street1, city1, state1);
		Address arrivalAddress = addressDAO.createAddress(street2, city2, state2);

		ride.setDepartureAddress(departureAddress);
		ride.setArrivalAddress(arrivalAddress);

		ride.setResort(resortDAO.getResortByID(resortId));

		rideShareDAO.createRideShare(ride);

		return "rideshare";
	}

	@GetMapping("rideshare")
	public ModelAndView displayRides() {
		ModelAndView mv = new ModelAndView();
		List<Ride> rides = rideShareDAO.displayAllRides();
		mv.addObject("allRides", rides);
		mv.setViewName("rideshare");
		return mv;
	}

	@GetMapping("editRideShare")
	public ModelAndView editRide(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Ride ride = rideShareDAO.findRideById(id);
		mv.addObject("ride", ride);

		mv.setViewName("editRideShare");
		return mv;
	}

	@PostMapping("updateRideShare")
	public ModelAndView updateRideShare(Ride ride, HttpSession session) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/rideshare");

		rideShareDAO.updateRideShare(ride);

		// Update the rideshare with the new information

		return mv;
	}

	@PostMapping("deleteRideShare")
	public ModelAndView deleteRidePost(Ride ride) {
		ModelAndView mv = new ModelAndView();
		rideShareDAO.deleteRideShare(ride);
		mv.setViewName("redirect:/rideshare");
		return mv;
	}

}
