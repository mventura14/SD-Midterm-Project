package com.skilldistillery.snowboardswap.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Lift;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class LiftDAOImpl implements LiftDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Lift findLiftByID(int id) {

		return em.find(Lift.class, id);
	}

	@Override
	public Lift addLift(Lift lift) {

		em.persist(lift);

		return lift;
	}

	@Override
	public Lift editLift(Lift lift) {

		Lift editLift = findLiftByID(lift.getId());

		editLift.setName(lift.getName());
		editLift.setLiftType(lift.getLiftType());
		;

		return editLift;

	}
}
