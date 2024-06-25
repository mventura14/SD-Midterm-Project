package com.skilldistillery.snowboardswap.data;

import java.util.List;

import com.skilldistillery.snowboardswap.entities.LiftType;

public interface LiftTypeDAO {

	LiftType findLiftTypeByID(int id);

	List<LiftType> getLiftTypeList(int id);

}
