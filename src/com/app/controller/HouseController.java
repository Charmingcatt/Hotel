package com.app.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/house")
public class HouseController {
	@Resource
	HouseService houseService;

	@RequestMapping("/house/add")
	public String houseAdd() {
		return "admin/house/add";
	}

	@RequestMapping(value="/house/houseSerch",method = RequestMethod.POST)
	public ModelAndView houseSerch(String message) {
		List<House> serchhouseList = houseService.houseSerch(message);
		//System.out.println(serchhouseList.size()+"-----"+message);
		ModelAndView mav = new ModelAndView("app/house");
		mav.addObject("list", serchhouseList);
		return mav;
	}

	@RequestMapping(value = "/house/save", method = RequestMethod.POST)
	public String houseSave(String rooname, String size, String thunb,
			String price2, String price, String description, String created,
			String content, String lat, String lng, String userid,
			String username, String pid, String cid, String aid, String state,
			String address, String cate, Model model, HttpSession se) {
		House modelX = new House();
		modelX.setRooname(rooname);
		modelX.setSize(size);
		modelX.setThunb(thunb);
		modelX.setPrice(price);
		modelX.setPrice2(price2);
		modelX.setDescription(description);
		modelX.setCreated(MainUtils.getTime());
		modelX.setContent(content);
		modelX.setLat(lat);
		modelX.setLng(lng);
		modelX.setUserid(se.getAttribute("userid").toString());
		modelX.setUsername(se.getAttribute("username").toString());
		modelX.setPid(pid);
		modelX.setCid(cid);
		modelX.setAid(aid);
		modelX.setState("1");
		modelX.setAddress(address);
		modelX.setCate(cate);

		houseService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("state", "success");
		model.addAttribute("url", "house/house/add");
		model.addAttribute("message", "添加成功！");
		return "admin/house/add";
	}

	@RequestMapping("/house/delete")
	public String houseDelete(int id, Model model) {
		houseService.delete(id);
		model.addAttribute("state", "success");
		model.addAttribute("url", "house/house/list");
		model.addAttribute("message", "删除成功！");
		return "admin/house/list";
	}

	@RequestMapping("/house/list")
	public ModelAndView houseList() {
		List<House> houseList = houseService.getAllHouse();
		System.out.println(houseList.size());
		ModelAndView mav = new ModelAndView("admin/house/list");
		mav.addObject("list", houseList);
		return mav;
	}

	@RequestMapping("/house/edit")
	public String houseEdit(String id, Model model) {
		House house = houseService.getHouseById(Integer.parseInt(id));
		model.addAttribute("model", house);
		return "admin/house/edit";
	}

	@RequestMapping(value = "/house/update", method = RequestMethod.POST)
	public String houseUpdate(String rooname, String size, String thunb,
			String price2, String price, String description, String created,
			String content, String lat, String lng, String userid,
			String username, String pid, String cid, String aid, String state,
			String address, String cate, int id, Model model) {

		House modelX = houseService.getHouseById(id);
		modelX.setRooname(rooname);
		modelX.setSize(size);
		modelX.setThunb(thunb);
		modelX.setPrice(price);
		modelX.setPrice2(price2);
		modelX.setDescription(description);

		modelX.setContent(content);

		modelX.setAddress(address);
		modelX.setCate(cate);

		houseService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("state", "success");
		model.addAttribute("url", "house/house/edit?id=" + id);
		model.addAttribute("message", "修改成功！!");
		return "admin/house/edit";
	}
}
