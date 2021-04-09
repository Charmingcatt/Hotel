package com.app.service;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Region;
import com.app.mapper.RegionDAO;

@Service
public class RegionServiceImpl implements RegionService {
	@Resource
	RegionDAO regionDao;

	public List<Region> getRegionPager(@Param("skip") int skip,
			@Param("size") int size) {
		return regionDao.getRegionPager(skip, size);
	}

	public Region getRegionById(int id) {
		return regionDao.getRegionById(id);
	}

	public int getRegionCount() {
		return regionDao.getRegionCount();
	}

	public int insert(Region entity) {
		return regionDao.insert(entity);
	}

	public int delete(int id) {
		return regionDao.delete(id);
	}

	public int update(Region entity) {
		return regionDao.update(entity);
	}

	public List<Region> getAllRegion() {
		return regionDao.getAllRegion();
	}

}
