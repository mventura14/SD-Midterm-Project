package com.skilldistillery.snowboardswap.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.snowboardswap.data.AddressDAO;
import com.skilldistillery.snowboardswap.data.EventDAO;
import com.skilldistillery.snowboardswap.data.EventTypeDAO;
import com.skilldistillery.snowboardswap.data.UserDAO;
import com.skilldistillery.snowboardswap.entities.Address;
import com.skilldistillery.snowboardswap.entities.Event;
import com.skilldistillery.snowboardswap.entities.EventType;
import com.skilldistillery.snowboardswap.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class EventController {

	private EventDAO eventDAO;
	private AddressDAO addressDAO;
	private EventTypeDAO eventTypeDAO;
	private UserDAO userDAO;

	public EventController(EventDAO eventDAO, AddressDAO addressDAO, EventTypeDAO eventTypeDAO, UserDAO userDAO) {
		this.eventDAO = eventDAO;
		this.addressDAO = addressDAO;
		this.eventTypeDAO = eventTypeDAO;
		this.userDAO = userDAO;
	}

	// Basic GetMapping to just show the webpage
//	@GetMapping("event")
//    public String showEvents() {
//        return "event";
//    }

//	Find an event by ID: This method will retrieve a single event by its ID.
	@GetMapping("eventDetail")
	public String getEvent(@RequestParam("eventId") int id, Model model) {
		Event event = eventDAO.findEventById(id);
		model.addAttribute("event", event);
		return "eventDetail";
	}

//	List all events: This GetMapping will retrieve all events from the database.
	@GetMapping("event")
	public String listEvents(Model model) {
		List<Event> events = eventDAO.findAllEvents();
		model.addAttribute("allEvents", events);
		return "event";
	}

//	Add an event: This method will persist a new event to the database.
	@GetMapping("addEvent")
	public String addEventForm(Model model, HttpSession session) {
	    // Retrieve userId from session
	    User loggedInUser = (User) session.getAttribute("loggedInUser");
	    if (loggedInUser != null) {
	        model.addAttribute("userId", loggedInUser.getId()); 
	    }

	    // Populate event types for dropdown
	    List<EventType> eventTypes = eventTypeDAO.findAllEventTypes();
	    model.addAttribute("eventTypes", eventTypes);

	    return "addEvent";
	}

	@PostMapping("addEvent")
	public String createEvent(@ModelAttribute("event") Event event, 
	                          BindingResult result, 
	                          @RequestParam("eventTypeId") int eventTypeId, 
	                          @RequestParam("userId") int userId, 
	                          @ModelAttribute("address") Address address, 
	                          Model model) {
	    
	    // Check if the event type ID or user ID is missing
	    if (eventTypeId == 0 || userId == 0) {
	        model.addAttribute("error", "Event type ID or user ID is missing.");
	        return "addEvent";
	    }
	    
	    // Retrieve the event type and user from the database
	    EventType eventType = eventTypeDAO.findEventTypeById(eventTypeId);
	    User user = userDAO.findById(userId);

	    if (eventType == null || user == null) {
	        model.addAttribute("error", "Event type or user ID is invalid.");
	        return "addEvent";
	    }
	    
	    // Set event's type and sponsor
	    event.setEventType(eventType);
	    event.setSponsor(user);
	    
	    // Add the event's address
	    Address savedAddress = addressDAO.addAddress(address);
	    if (savedAddress == null) {
	        model.addAttribute("error", "Failed to save the address.");
	        return "addEvent";
	    }
	    event.setAddress(savedAddress);
	    
	    // Try to create the event and handle any exceptions
	    try {
	        Event savedEvent = eventDAO.createEvent(event);
	        if (savedEvent == null) {
	            throw new RuntimeException("Failed to create event.");
	        }
	        return "redirect:/eventDetail?eventId=" + savedEvent.getId();
	    } catch (Exception e) {
	        model.addAttribute("error", e.getMessage());
	        return "addEvent";
	    }
	}
	
	@GetMapping("updateEvent")
	public String showUpdateEventForm(@RequestParam("eventId") int eventId, Model model) {
	    Event event = eventDAO.findEventById(eventId);

	    if (event != null) {
	        // Prepare necessary data for the update form
	        List<EventType> eventTypes = eventTypeDAO.findAllEventTypes();
	        model.addAttribute("event", event);
	        model.addAttribute("eventTypes", eventTypes);

	        return "updateEvent"; // Return the update form
	    } else {
	        // If event is not found, handle the error appropriately
	        throw new RuntimeException("Event not found with ID: " + eventId);
	    }
	}

	// POST for updateEvent:
	@PostMapping("updateEvent")
	public String updateEvent(@ModelAttribute("event") Event updatedEvent, 
	                          BindingResult result, 
	                          @RequestParam("eventTypeId") int eventTypeId, 
	                          @RequestParam("eventId") int eventId, // Added to capture the event ID from the form
	                          @ModelAttribute("address") Address address, 
	                          Model model) {
		
	    // Retrieve the event type from the database
	    EventType eventType = eventTypeDAO.findEventTypeById(eventTypeId);
	    if (eventType == null) {
	        model.addAttribute("error", "Invalid event type.");
	        return "updateEvent";
	    }
	    
	 // Retrieve the original event from the database using eventId
	    Event originalEvent = eventDAO.findEventById(eventId);
	    if (originalEvent == null) {
	        model.addAttribute("error", "Event not found.");
	        return "updateEvent";
	    }
	    
	    // Set the updated event's type
	    updatedEvent.setEventType(eventType);
	    
	    // Set the updated event's ID to the original event's ID
	    updatedEvent.setId(eventId); // this is what is need to update the correct one!!
	    
	    // Update the event's address
	    Address savedAddress = addressDAO.addAddress(address);
	    if (savedAddress == null) {
	        model.addAttribute("error", "Failed to save the address.");
	        return "updateEvent";
	    }
	    updatedEvent.setAddress(savedAddress);
	    
	    // try/catch to handle any exceptions
	    try {
	        Event updatedEventResult = eventDAO.updateEvent(eventId, updatedEvent);
	        if (updatedEventResult == null) {
	            throw new RuntimeException("Failed to update event.");
	        }
	        return "redirect:/eventDetail?eventId=" + updatedEventResult.getId();
	    } catch (Exception e) {
	        model.addAttribute("error", e.getMessage());
	        return "updateEvent";
	    }
	}

//	Delete an event: This method will remove an event from the database.
    @PostMapping("deleteEvent")
    public String deleteEvent(@RequestParam("eventId") int eventId, Model model) {
        boolean isDeleted = eventDAO.deleteEvent(eventId);
        if (!isDeleted) {
            model.addAttribute("message", "Event could not be deleted.");
        } else {
            model.addAttribute("message", "Event successfully deleted.");
        }
        return "deleteEvent";
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