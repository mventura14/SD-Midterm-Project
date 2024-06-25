package com.skilldistillery.snowboardswap.data;

import com.skilldistillery.snowboardswap.entities.Address;

public interface AddressDAO {

	Address addAddress(Address address);

	Address editAddress(Address address);

	Address createAddress(String street, String city, String state);

}
