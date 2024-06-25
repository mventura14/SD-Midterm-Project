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

class RideTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Ride ride;

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
		ride = em.find(Ride.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		ride = null;
		em.close();
	}

	@Test
	void test_Ride_entity_mapping() {
		assertNotNull(ride);
		assertEquals(2024, ride.getDeparture().getYear());
		assertEquals("Kia", ride.getVehicleMake());
	}
	
	@Test
	void test_Ride_Resort_M21() {
		assertNotNull(ride);
		assertNotNull(ride.getResort());
		assertEquals(2024, ride.getDeparture().getYear());
	}
	@Test
	void test_Ride_Address_departure_M21() {
		assertNotNull(ride);
		assertNotNull(ride.getDepartureAddress());
		assertEquals("6701 W Alameda Ave", ride.getDepartureAddress().getStreet());
	}
	@Test
	void test_Ride_Address_arrival_M21() {
		assertNotNull(ride);
		assertNotNull(ride.getArrivalAddress());
		assertEquals("509 Copper Rd", ride.getArrivalAddress().getStreet());
	}
	@Test
	void test_Ride_User_M21() {
		assertNotNull(ride);
		assertNotNull(ride.getUser());
		assertEquals("Kim", ride.getUser().getFirstName());
	}
}
