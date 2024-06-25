package com.skilldistillery.snowboardswap.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.snowboardswap.entities.Address;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	public Address searchAddressByID(int id) {

		return em.find(Address.class, id);
	}

	@Override
	public Address addAddress(Address address) {

		em.persist(address);

		return address;
	}

	@Override
	public Address editAddress(Address address) {

		Address editAddress = searchAddressByID(address.getId());

		editAddress.setStreet(address.getStreet());
		editAddress.setState(address.getState());
		editAddress.setCity(address.getCity());
		editAddress.setPostalCode(address.getPostalCode());
		editAddress.setPhoneNumber(address.getPhoneNumber());

		return editAddress;
	}

	@Override
	public Address createAddress(String street, String city, String state) {
		Address address = new Address();
		address.setStreet(street);
		address.setCity(city);
		address.setState(state);
		addAddress(address);

		return address;
	}

}
