package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Ride;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;


	@Service
	@Transactional
	public class RideShareDAOImpl implements RideShareDAO {

		
		@PersistenceContext
		private EntityManager em;
		
		@Override
		public Ride findRideById(int id) {
			Ride ride = em.find(Ride.class, id);
			return ride;
		}
		
		@Override
		public List<Ride> findByUserName(String username) {
		String jpql =  "SELECT r FROM Ride r WHERE r.username = :username";
		TypedQuery<Ride> query = em.createQuery(jpql,  Ride.class);
		query.setParameter("username", username);
	   
	   return query.getResultList();
	   

	}

		@Override
		public List<Ride> displayAllRides() {
			return em.createQuery("SELECT ride FROM Ride ride", Ride.class).getResultList();
		}

		@Override
		public Ride createRideShare(Ride ride) {
			em.persist(ride);
			return ride;
		}

		@Override
		public boolean deleteRideShare(Ride ride) {
			ride = em.find(Ride.class, ride.getId());
			if (ride != null) {
				em.remove(ride);
				return true;
			}
			return false;
		}

		@Override
		public Ride updateRideShare(Ride ride) {
			Ride updateRide = em.find(Ride.class, ride.getId());
			updateRide.setDeparture(ride.getDeparture());
			updateRide.setDetail(ride.getDetail());
			updateRide.setVehicleCapacity(ride.getVehicleCapacity());
			updateRide.setVehicleMake(ride.getVehicleMake());
			updateRide.setVehicleModel(ride.getVehicleModel());
			
			
			
			
			return updateRide;
		}

		@Override
		public Ride joinRideShare(Ride ride) {
			// TODO Auto-generated method stub
			return null;
		}

	

}
