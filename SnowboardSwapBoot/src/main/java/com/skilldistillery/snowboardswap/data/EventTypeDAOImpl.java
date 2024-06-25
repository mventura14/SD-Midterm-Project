package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.EventType;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class EventTypeDAOImpl implements EventTypeDAO {
	
	@PersistenceContext
    private EntityManager em;

    @Override
    public EventType findEventTypeById(int id) {
        return em.find(EventType.class, id);
    }
    
    @Override
    public List<EventType> findAllEventTypes() {
        return em.createQuery("SELECT eventType FROM EventType eventType", EventType.class).getResultList();
    }

}
