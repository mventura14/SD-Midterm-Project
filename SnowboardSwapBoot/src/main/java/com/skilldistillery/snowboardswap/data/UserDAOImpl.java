package com.skilldistillery.snowboardswap.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String jpql = "SELECT user FROM User user WHERE user.username = :username AND user.password = :password AND user.enabled = true";

		List<User> queryResult = em.createQuery(jpql, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList();

		return queryResult.isEmpty() ? null : queryResult.get(0);
	}

	@Override
	public User registerUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User updateUserProfile(User user) {
		System.out.println("makes it  here" + user);

		User existingUser = em.find(User.class, user.getId());
		if (existingUser != null && user != null) {

			existingUser.setFirstName(user.getFirstName());
			existingUser.setLastName(user.getLastName());
			existingUser.setBio(user.getBio());
			existingUser.setImageUrl(user.getImageUrl());
			existingUser.setPassword(user.getPassword());

		}
		return existingUser;
	}

	@Override
	public User findById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public boolean deleteUser(int userId) {
		User user = em.find(User.class, userId);
		if (user != null) {
			em.remove(user);
			return true;
		}
		return false;
	}
}
