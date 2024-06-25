package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Event;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Event findEventById(int eventId) {
		Event event = em.find(Event.class, eventId);
		return event;
	}

	@Override
	public List<Event> findAllEvents() {
		return em.createQuery("SELECT event FROM Event event", Event.class).getResultList();
	}

	@Override
	public Event createEvent(Event event) {
		em.persist(event); // Persist the event entity to the database
		return event; // The persisted event will now have a generated ID
	}

	@Override
	public Event updateEvent(int eventId, Event updatedEvent) {
		Event existingEvent = em.find(Event.class, eventId);
		if (existingEvent != null && updatedEvent != null) {
			existingEvent.setName(updatedEvent.getName());
			existingEvent.setDescription(updatedEvent.getDescription());
			existingEvent.setEventStart(updatedEvent.getEventStart());
			existingEvent.setEventEnd(updatedEvent.getEventEnd());
			existingEvent.setEventType(updatedEvent.getEventType());
			existingEvent.setAddress(updatedEvent.getAddress());
			existingEvent.setActive(updatedEvent.isActive());
			existingEvent.setImageUrl(updatedEvent.getImageUrl());
			existingEvent.setLocationDescription(updatedEvent.getLocationDescription());
			
			// Explicitly merge the updated entity
			em.merge(existingEvent);
		}
		return existingEvent;
	}

	@Override
	public boolean deleteEvent(int id) {
		Event event = em.find(Event.class, id);
		if (event != null) {
			em.remove(event);
			return true;
		}
		return false;
	}
}
