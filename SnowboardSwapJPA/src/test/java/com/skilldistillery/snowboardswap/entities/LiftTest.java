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

class LiftTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Lift lift;

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
		lift = em.find(Lift.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		lift = null;
		em.close();
	}

	@Test
	void test_Lift_entity_mapping() {
		assertNotNull(lift);
	}

	@Test
	void test_Lift_has_name() {
		assertNotNull(lift);
		assertEquals("American Eagle", lift.getName());
	}
	
	@Test
	void test_Lift_has_status_M21() {
		assertNotNull(lift);
		assertEquals("Telemix", lift.getLiftType().getType());
	}
	@Test
	void test_Lift_status_12M() {
		assertNotNull(lift);
		assertNotNull(lift.getStatuses());
		assertEquals(1, lift.getStatuses().size());
	}
}
