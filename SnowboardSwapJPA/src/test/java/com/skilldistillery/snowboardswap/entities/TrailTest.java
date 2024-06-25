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

class TrailTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Trail trail;

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
		trail = em.find(Trail.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		trail = null;
		em.close();
	}

	@Test
	void test_Trail_entity_mapping() {
		assertNotNull(trail);
		assertEquals("17 Glade", trail.getName());
		assertEquals("Most Difficult", trail.getDifficulty());
	}
	@Test
	void test_Trail_status_12M() {
		assertNotNull(trail);
		assertNotNull(trail.getStatuses());
		assertEquals("Open", trail.getStatuses().get(0).getStatus());
	}
	@Test
	void test_Trail_resort_M21() {
		assertNotNull(trail);
		assertNotNull(trail.getResort());
		assertEquals("Copper Mountain", trail.getResort().getName());
	}
}
