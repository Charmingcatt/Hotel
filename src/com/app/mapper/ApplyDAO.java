package com.app.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;

public interface ApplyDAO {
	public List<Apply> getApplyPager(@Param("skip") int skip,
			@Param("size") int size);

	public Apply getApplyById(int id);

	public int getApplyCount();

	public int insert(Apply entity);

	public int delete(int id);

	public int update(Apply entity);

	public List<Apply> getAllApply();
	public List<Apply> getApplyBy(String hid);
	public List<Apply> getApplyByUserid(String userid);
}
