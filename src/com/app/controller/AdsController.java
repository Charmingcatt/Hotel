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
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/ads")
public class AdsController {
	@Resource
	AdsService adsService;

	@RequestMapping("/ads/add")
	public String adsAdd() {
		return "admin/ads/add";
	}

	@RequestMapping(value = "/ads/save", method = RequestMethod.POST)
	public String adsSave(String title, String url, String thumb,
			String created, String updated, String status, String intro,
			Model model) {
		Ads modelX = new Ads();
		modelX.setTitle(title);
		modelX.setUrl(url);
		modelX.setThumb(thumb);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setIntro(intro);

		adsService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("state", "success");
		model.addAttribute("url", "ads/ads/add");
		model.addAttribute("message", "添加成功!");
		return "admin/ads/add";
	}

	@RequestMapping("/ads/delete")
	public String adsDelete(int id, Model model) {
		adsService.delete(id);
		model.addAttribute("state", "success");
		model.addAttribute("url", "ads/ads/list");
		model.addAttribute("message", "删除成功!");
		return "admin/ads/list";
	}

	@RequestMapping("/ads/list")
	public ModelAndView adsList() {
		List<Ads> adsList = adsService.getAllAds();
		System.out.println(adsList.size());
		ModelAndView mav = new ModelAndView("admin/ads/list");
		mav.addObject("list", adsList);
		return mav;
	}

	@RequestMapping("/ads/edit")
	public String adsEdit(String id, Model model) {
		Ads ads = adsService.getAdsById(Integer.parseInt(id));
		model.addAttribute("model", ads);
		return "admin/ads/edit";
	}

	@RequestMapping(value = "/ads/update", method = RequestMethod.POST)
	public String adsUpdate(String title, String url, String thumb,
			String created, String updated, String status, String intro,
			int id, Model model) {

		Ads modelX = adsService.getAdsById(id);
		modelX.setTitle(title);
		modelX.setUrl(url);
		modelX.setThumb(thumb);

		adsService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("state", "success");
		model.addAttribute("url", "ads/ads/edit?id=" + id);
		model.addAttribute("message", "更新成功!");
		return "admin/ads/edit";
	}
}
