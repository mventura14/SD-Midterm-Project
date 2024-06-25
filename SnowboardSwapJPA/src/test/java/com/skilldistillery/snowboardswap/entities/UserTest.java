package com.skilldistillery.snowboardswap.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("Kim", user.getFirstName());
		assertEquals("Possible", user.getLastName());
	}
	@Test
	void test_User_ride_12M() {
		assertNotNull(user);
		assertNotNull(user.getRides());
		assertTrue(user.getRides().size() > 0);
	}
	@Test
	void test_User_event_12M() {
		assertNotNull(user);
		assertNotNull(user.getEvents());
		assertTrue(user.getEvents().size() > 0);
	}
	@Test
	void test_User_address_M21() {
		assertNotNull(user);
		assertNotNull(user.getAddress());
		assertEquals("Lakewood", user.getAddress().getCity());
	}
	@Test
	void test_User_event_M2M() {
		assertNotNull(user);
		assertNotNull(user.getGuestlist());
		assertEquals("Group get together", user.getGuestlist().get(0).getName());
	}
}
