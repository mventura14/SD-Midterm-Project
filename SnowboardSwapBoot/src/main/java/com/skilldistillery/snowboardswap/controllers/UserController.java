package com.skilldistillery.snowboardswap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private UserDAO userDAO;
	private AddressDAO addressDAO;

	public UserController(UserDAO userDAO, AddressDAO addressDAO) {
		this.userDAO = userDAO;
		this.addressDAO = addressDAO;
	}

	// Ash update
	@GetMapping("login.do")
	public String showLoginForm(HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "login"; // Return the login page if the user is not logged in
		}
		return "redirect:dashboard";
	}

	@PostMapping("login.do")
	public ModelAndView login(@RequestParam("userName") String username, @RequestParam("password") String password,
			HttpSession session, Model model) {
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("loggedInUser") != null) {
			mv.setViewName("redirect:/dashboard");
			return mv;
		}

		User authenticatedUser = userDAO.authenticateUser(username, password);

		if (authenticatedUser != null) {
			session.setAttribute("loggedInUser", authenticatedUser);
			mv.setViewName("redirect:/dashboard");
			return mv;
		} else {
			model.addAttribute("errorMessage", "Invalid username or password.");
			mv.setViewName("login");
			return mv;
		}
	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");

		session.invalidate();
		return "redirect:/login";
	}

	@PostMapping("register.do")
	public ModelAndView register(User user, Address address) {
		ModelAndView mv = new ModelAndView();

		user.setEnabled(true);
		user.setRole("standard");
		user.setAddress(addressDAO.addAddress(address));

		User registeredUser = userDAO.registerUser(user);

		if (registeredUser != null) {
			mv.addObject("successMessage", "Registration successful!");
			mv.setViewName("redirect:/login");
			return mv;
		} else {
			mv.addObject("errorMessage", "Registration failed. Please try again.");
			mv.setViewName("register");
			return mv;
		}
	}

	@GetMapping("profile")
	public String showProfile(HttpSession session, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:login";
		}
		model.addAttribute("user", loggedInUser);
		return "profile";
	}

	// Method to show the update profile form
	@GetMapping("updateProfile")
	public String updateProfileForm(HttpSession session, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:login";
		}

		// Populate the user object with existing password
		loggedInUser.setPassword(loggedInUser.getPassword());

		model.addAttribute("user", loggedInUser);
		return "updateProfile";
	}

	@PostMapping("updateProfile")
	public ModelAndView updateProfile(User user, Address address, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			mv.setViewName("redirect:login");
			return mv;
		}

		user.setId(loggedInUser.getId());
		address.setId(loggedInUser.getAddress().getId());

		userDAO.updateUserProfile(user);
		addressDAO.editAddress(address);

		mv.setViewName("redirect:profile");
		return mv;
	}

	@PostMapping("deleteUser")
	public String deleteUser(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:login";
		}
		int userId = loggedInUser.getId();
		boolean deleted = userDAO.deleteUser(userId);
		if (deleted) {
			session.invalidate(); // Log out user after deletion
			return "redirect:login";
		} else {
			return "redirect:profile"; // Redirect to profile if deletion fails
		}
	}

	// Exception handler for better debugging
	@ExceptionHandler(Exception.class)
	public ModelAndView handleError(Exception ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception", ex);
		mv.addObject("message", ex.getMessage());
		mv.setViewName("error");
		return mv;
	}
}
