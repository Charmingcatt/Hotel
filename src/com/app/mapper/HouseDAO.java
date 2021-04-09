package com.app.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;

public interface HouseDAO {
	public List<House> getHousePager(@Param("skip") int skip,
			@Param("size") int size);

	public House getHouseById(int id);

	public int getHouseCount();

	public int insert(House entity);

	public int delete(int id);

	public int update(House entity);

	public List<House> getAllHouse();
	
	public List<House> houseSerch(String message);
}
