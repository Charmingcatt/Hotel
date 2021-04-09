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
@RequestMapping("/apply")
public class ApplyController {
	@Resource
	ApplyService applyService;

	@RequestMapping("/apply/add")
	public String applyAdd() {
		return "admin/apply/add";
	}

	@RequestMapping(value = "/apply/save", method = RequestMethod.POST)
	public String applySave(String hid, String userid, String state,
			String type, String created, String attachfile, String stateid,
			String pid, String cid, String aid, String message, Model model) {
		Apply modelX = new Apply();
		modelX.setHid(hid);
		modelX.setUserid(userid);
		modelX.setState(state);
		modelX.setType(type);
		modelX.setCreated(created);
		modelX.setAttachfile(attachfile);
		modelX.setStateid(stateid);
		modelX.setPid(pid);
		modelX.setCid(cid);
		modelX.setAid(aid);
		modelX.setMessage(message);

		applyService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/apply/add";
	}

	@RequestMapping("/apply/delete")
	public String applyDelete(int id) {
		applyService.delete(id);
		return "redirect:list";
	}
	@Resource
	UsersService usersService;
	@Resource
	HouseService houseService;
	@RequestMapping("/apply/list")
	public ModelAndView applyList() {
		List<Apply> applyList = applyService.getAllApply();
		System.out.println(applyList.size());
		ModelAndView mav = new ModelAndView("admin/apply/list");
		for (Apply apply : applyList) {
			apply.setHs(houseService.getHouseById(Integer.parseInt(apply.getHid())));
			apply.setUser(usersService.getUsersById(Integer.parseInt(apply.getUserid())));
		}
		mav.addObject("list", applyList);
		return mav;
	}
	
	@RequestMapping("/apply/list1")
	public ModelAndView applyList1(HttpSession sess) {
		List<Apply> applyList = applyService.getApplyByUserid(sess.getAttribute("userid").toString());
		System.out.println(applyList.size());
		ModelAndView mav = new ModelAndView("admin/apply/list1");
		for (Apply apply : applyList) {
			apply.setHs(houseService.getHouseById(Integer.parseInt(apply.getHid())));
			apply.setUser(usersService.getUsersById(Integer.parseInt(apply.getUserid())));
		}
		mav.addObject("list", applyList);
		return mav;
	}

	@RequestMapping("/apply/edit")
	public String applyEdit(String id, Model model) {
		Apply apply = applyService.getApplyById(Integer.parseInt(id));
		model.addAttribute("model", apply);
		return "admin/apply/edit";
	}
	@Resource
	CatesService catesService;
	@Resource
	NewsService newsService;
	@Resource
	AdsService adsService;
	@RequestMapping("/report")
	public String applyEdit( Model model) {
		
		model.addAttribute("n1", usersService.getAllUsers().size());
		model.addAttribute("n2", catesService.getAllCates().size());
		model.addAttribute("n3", houseService.getAllHouse().size());
		model.addAttribute("n4", applyService.getAllApply().size());
		model.addAttribute("n5", adsService.getAllAds().size());
		model.addAttribute("n6", newsService.getAllNews().size());
		
		return "admin/apply/report";
	}

	@RequestMapping(value = "/apply/update", method = RequestMethod.POST)
	public String applyUpdate(String hid, String userid, String state,
			String type, String created, String attachfile, String stateid,
			String pid, String cid, String aid, String message, int id,
			Model model) {

		Apply modelX = applyService.getApplyById(id);
		modelX.setHid(hid);
		modelX.setUserid(userid);
		modelX.setState(state);
		modelX.setType(type);
		modelX.setCreated(created);
		modelX.setAttachfile(attachfile);
		modelX.setStateid(stateid);
		modelX.setPid(pid);
		modelX.setCid(cid);
		modelX.setAid(aid);
		modelX.setMessage(message);

		applyService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/apply/edit";
	}
	
	@RequestMapping(value = "/apply/state")
	public String state(String state, String ret, int id,
			Model model) {

		Apply modelX = applyService.getApplyById(id);
		
		modelX.setState(state);
		

		applyService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("state", "success");
		model.addAttribute("url", "apply/apply/"+ret);
		model.addAttribute("message", "更新成功!");
		return "admin/apply/"+ret;
	}
}
