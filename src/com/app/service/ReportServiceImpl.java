package com.app.service;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Report;
import com.app.mapper.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService {
	@Resource
	ReportDAO reportDao;

	public List<Report> getReportPager(@Param("skip") int skip,
			@Param("size") int size) {
		return reportDao.getReportPager(skip, size);
	}

	public Report getReportById(int id) {
		return reportDao.getReportById(id);
	}

	public int getReportCount() {
		return reportDao.getReportCount();
	}

	public int insert(Report entity) {
		return reportDao.insert(entity);
	}

	public int delete(int id) {
		return reportDao.delete(id);
	}

	public int update(Report entity) {
		return reportDao.update(entity);
	}

	public List<Report> getAllReport() {
		return reportDao.getAllReport();
	}

}
