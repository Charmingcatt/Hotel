package com.app.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;

public interface RegionDAO {
	public List<Region> getRegionPager(@Param("skip") int skip,
			@Param("size") int size);

	public Region getRegionById(int id);

	public int getRegionCount();

	public int insert(Region entity);

	public int delete(int id);

	public int update(Region entity);

	public List<Region> getAllRegion();
}
