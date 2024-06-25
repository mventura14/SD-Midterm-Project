package com.skilldistillery.snowboardswap.data;

import com.skilldistillery.snowboardswap.entities.Trail;

public interface TrailDAO {

	Trail findTrailByID(int id);

	Trail addTrail(Trail trail);

	Trail editTrail(Trail trail);

}
