package com.skilldistillery.snowboardswap.data;

import java.util.List;

import com.skilldistillery.snowboardswap.entities.Event;

public interface EventDAO {
	
//	Find an event by ID: This method will retrieve a single event by its ID.
	Event findEventById(int eventId);

//	List all events: This method will retrieve all events from the database.
	List<Event> findAllEvents();
	
//	Add an event: This method will persist a new event to the database.
	Event createEvent(Event event);
	
//	Update an event: This method will update an existing event in the database.
	Event updateEvent(int eventId, Event event);
	
//	Delete an event: This method will remove an event from the database.
	boolean deleteEvent(int eventId);
}
