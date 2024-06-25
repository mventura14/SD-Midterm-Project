package com.skilldistillery.snowboardswap.data;

import java.util.List;

import com.skilldistillery.snowboardswap.entities.EventType;

public interface EventTypeDAO {
	
	EventType findEventTypeById(int id);

	List<EventType> findAllEventTypes();

}
