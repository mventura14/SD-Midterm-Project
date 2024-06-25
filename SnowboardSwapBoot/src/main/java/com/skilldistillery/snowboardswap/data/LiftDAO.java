package com.skilldistillery.snowboardswap.data;

import com.skilldistillery.snowboardswap.entities.Lift;

public interface LiftDAO {

	Lift findLiftByID(int id);

	Lift addLift(Lift lift);

	Lift editLift(Lift lift);

}
