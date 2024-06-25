package com.skilldistillery.snowboardswap.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class TrailStatusTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TrailStatus trailStatus;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("SnowboardSwapJPA");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		trailStatus = em.find(TrailStatus.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		trailStatus = null;
		em.close();
	}

	@Test
	void test_TrailStatus_entity_mapping() {
		assertNotNull(trailStatus);
		assertEquals("Open", trailStatus.getStatus());
	}
	@Test
	void test_TrailStatus_M21_trail() {
		assertNotNull(trailStatus);
		assertNotNull(trailStatus.getTrail());
		assertEquals("17 Glade", trailStatus.getTrail().getName() );
	}
}
