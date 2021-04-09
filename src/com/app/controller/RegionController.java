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
@RequestMapping("/region")
public class RegionController {
	@Resource
	RegionService regionService;

	@RequestMapping("/region/add")
	public String regionAdd() {
		return "admin/region/add";
	}

	@RequestMapping(value = "/region/save", method = RequestMethod.POST)
	public String regionSave(String parent_id, String region_name,
			String region_type, String agency_id, Model model) {
		Region modelX = new Region();
		modelX.setParent_id(parent_id);
		modelX.setRegion_name(region_name);
		modelX.setRegion_type(region_type);
		modelX.setAgency_id(agency_id);

		regionService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/region/add";
	}

	@RequestMapping("/region/delete")
	public String regionDelete(int id) {
		regionService.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/region/list")
	public ModelAndView regionList() {
		List<Region> regionList = regionService.getAllRegion();
		System.out.println(regionList.size());
		ModelAndView mav = new ModelAndView("admin/region/list");
		mav.addObject("list", regionList);
		return mav;
	}

	@RequestMapping("/region/edit")
	public String regionEdit(String id, Model model) {
		Region region = regionService.getRegionById(Integer.parseInt(id));
		model.addAttribute("model", region);
		return "admin/region/edit";
	}

	@RequestMapping(value = "/region/update", method = RequestMethod.POST)
	public String regionUpdate(String parent_id, String region_name,
			String region_type, String agency_id, int id, Model model) {

		Region modelX = regionService.getRegionById(id);
		modelX.setParent_id(parent_id);
		modelX.setRegion_name(region_name);
		modelX.setRegion_type(region_type);
		modelX.setAgency_id(agency_id);

		regionService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/region/edit";
	}
}
