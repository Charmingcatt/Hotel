package com.app.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;

public interface ReportDAO {
	public List<Report> getReportPager(@Param("skip") int skip,
			@Param("size") int size);

	public Report getReportById(int id);

	public int getReportCount();

	public int insert(Report entity);

	public int delete(int id);

	public int update(Report entity);

	public List<Report> getAllReport();
}
