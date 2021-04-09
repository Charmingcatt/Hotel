package com.app.service;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Apply;
import com.app.mapper.ApplyDAO;

@Service
public class ApplyServiceImpl implements ApplyService {
	@Resource
	ApplyDAO applyDao;

	public List<Apply> getApplyPager(@Param("skip") int skip,
			@Param("size") int size) {
		return applyDao.getApplyPager(skip, size);
	}

	public Apply getApplyById(int id) {
		return applyDao.getApplyById(id);
	}

	public int getApplyCount() {
		return applyDao.getApplyCount();
	}

	public int insert(Apply entity) {
		return applyDao.insert(entity);
	}

	public int delete(int id) {
		return applyDao.delete(id);
	}

	public int update(Apply entity) {
		return applyDao.update(entity);
	}

	public List<Apply> getAllApply() {
		return applyDao.getAllApply();
	}

	public List<Apply> getApplyBy(String hid) {
		// TODO Auto-generated method stub
		return applyDao.getApplyBy(hid);
	}

	public List<Apply> getApplyByUserid(String userid) {
		// TODO Auto-generated method stub
		return applyDao.getApplyByUserid(userid);
	}

}
