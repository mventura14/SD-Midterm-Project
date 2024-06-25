package com.skilldistillery.snowboardswap.data;

import java.util.List;

import com.skilldistillery.snowboardswap.entities.Resort;

public interface ResortDAO {

	List<Resort> getResorts();

	Resort getResortByID(int id);

	Resort addResort(Resort resort);

	Resort editResort(Resort resort);

}
