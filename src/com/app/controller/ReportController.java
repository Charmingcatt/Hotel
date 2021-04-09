package com.app.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;

@Controller
@RequestMapping("/report")
public class ReportController {
	@Resource
	ReportService reportService;

	@RequestMapping("/report/add")
	public String reportAdd() {
		return "admin/report/add";
	}

	@RequestMapping(value = "/report/save", method = RequestMethod.POST)
	public String reportSave(String content, String userid, String mid,
			String created, String state, Model model) {
		Report modelX = new Report();
		modelX.setContent(content);
		modelX.setUserid(userid);
		modelX.setMid(mid);
		modelX.setCreated(created);
		modelX.setState(state);

		reportService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/report/add";
	}

	@RequestMapping("/report/delete")
	public String reportDelete(int id) {
		reportService.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/report/list")
	public ModelAndView reportList() {
		List<Report> reportList = reportService.getAllReport();
		System.out.println(reportList.size());
		ModelAndView mav = new ModelAndView("admin/report/list");
		mav.addObject("list", reportList);
		return mav;
	}

	@RequestMapping("/report/edit")
	public String reportEdit(String id, Model model) {
		Report report = reportService.getReportById(Integer.parseInt(id));
		model.addAttribute("model", report);
		return "admin/report/edit";
	}

	@RequestMapping(value = "/report/update", method = RequestMethod.POST)
	public String reportUpdate(String content, String userid, String mid,
			String created, String state, int id, Model model) {

		Report modelX = reportService.getReportById(id);
		modelX.setContent(content);
		modelX.setUserid(userid);
		modelX.setMid(mid);
		modelX.setCreated(created);
		modelX.setState(state);

		reportService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/report/edit";
	}
}
