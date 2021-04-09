package com.app.service;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.House;
import com.app.mapper.HouseDAO;

@Service
public class HouseServiceImpl implements HouseService {
	@Resource
	HouseDAO houseDao;

	public List<House> getHousePager(@Param("skip") int skip,
			@Param("size") int size) {
		return houseDao.getHousePager(skip, size);
	}

	public House getHouseById(int id) {
		return houseDao.getHouseById(id);
	}

	public int getHouseCount() {
		return houseDao.getHouseCount();
	}

	public int insert(House entity) {
		return houseDao.insert(entity);
	}

	public int delete(int id) {
		return houseDao.delete(id);
	}

	public int update(House entity) {
		return houseDao.update(entity);
	}

	public List<House> getAllHouse() {
		return houseDao.getAllHouse();
	}

	public List<House> houseSerch(String message){
		return houseDao.houseSerch(message);
	}
}
