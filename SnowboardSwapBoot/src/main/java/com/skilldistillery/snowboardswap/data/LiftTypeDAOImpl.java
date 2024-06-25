package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.LiftType;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class LiftTypeDAOImpl implements LiftTypeDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public LiftType findLiftTypeByID(int id) {

		return em.find(LiftType.class, id);
	}

	@Override
	public List<LiftType> getLiftTypeList(int id) {

		String jpql = "SELECT type FROM LiftType type";

		return em.createQuery(jpql, LiftType.class).getResultList();

	}
}
