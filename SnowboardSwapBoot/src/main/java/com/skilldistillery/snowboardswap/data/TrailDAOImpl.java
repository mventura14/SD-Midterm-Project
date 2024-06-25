package com.skilldistillery.snowboardswap.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Trail;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class TrailDAOImpl implements TrailDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Trail findTrailByID(int id) {

		return em.find(Trail.class, id);
	}

	@Override
	public Trail addTrail(Trail trail) {

		em.persist(trail);

		return trail;
	}

	@Override
	public Trail editTrail(Trail trail) {

		Trail editTrail = findTrailByID(trail.getId());

		editTrail.setName(trail.getName());
		editTrail.setDifficulty(trail.getDifficulty());

		return editTrail;
	}
}
