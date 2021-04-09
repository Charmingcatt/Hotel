package com.app.controller;

import java.io.File;
import java.text.ParseException;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.entity.*;
import com.app.service.*;
import com.app.utils.DateKit;
import com.app.utils.MD5;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/app")
public class HomeController {

	@Resource
	UsersService userService;

	@Resource
	CatesService caService;

	@Resource
	NewsService articleService;

	@Resource
	HouseService hService;

	public List<Cates> getChild(List<Cates> list) {

		if (list.size() > 0) {
			for (Cates category : list) {

				List<Cates> subList = caService.getByPid(category.getId() + "");
				category.setSubs(getChild(subList));
			}
		}

		return list;
	}

	@Resource
	AdsService adsService;

	@RequestMapping("/index")
	public String index(HttpSession session, Model model) {
		List<Cates> cates = caService.getByPid("0");//caidan
		List<News> ls = articleService.getAllNews();
		model.addAttribute("cates", getChild(cates));
		model.addAttribute("ads", adsService.getAllAds());
		model.addAttribute("list", ls);
		model.addAttribute("hs", hService.getAllHouse());
		return "app/index";
	}

	@RequestMapping("/cates")
	public String cates(String id, HttpSession session, Model model) {
		List<Cates> cates = caService.getByPid("0");
		model.addAttribute("cates", getChild(cates));
		model.addAttribute("cs", caService.getAllCates());
		model.addAttribute("list", articleService.getNewsByCate(id));
		model.addAttribute("hs", hService.getAllHouse());
		return "app/cates";
	}

	@RequestMapping("/house")
	public String house(String id, HttpSession session, Model model) {
		List<Cates> cates = caService.getByPid("0");
		model.addAttribute("cates", getChild(cates));
		model.addAttribute("cs", caService.getAllCates());
		model.addAttribute("list", hService.getAllHouse());
		model.addAttribute("hs", hService.getAllHouse());
		return "app/house";
	}

	@RequestMapping("/view")
	public String view(String id, HttpSession session, Model model) {
		List<Cates> cates = caService.getByPid("0");
		model.addAttribute("cates", getChild(cates));
		model.addAttribute("cs", caService.getAllCates());
		model.addAttribute("model",
				articleService.getNewsById(Integer.parseInt(id)));
		model.addAttribute("hs", hService.getAllHouse());
		return "app/view";
	}

	@RequestMapping("/ordering")
	public String ordering(String id, HttpSession session, Model model) {
		List<Cates> cates = caService.getByPid("0");
		model.addAttribute("cates", getChild(cates));
		model.addAttribute("cs", caService.getAllCates());
		model.addAttribute("model", hService.getHouseById(Integer.parseInt(id)));
		model.addAttribute("hs", hService.getAllHouse());
		return "app/ordering";
	}

	@RequestMapping("/detail")
	public String detail(String id, HttpSession session, Model model) {
		List<Cates> cates = caService.getByPid("0");
		model.addAttribute("cates", getChild(cates));
		model.addAttribute("cs", caService.getAllCates());
		model.addAttribute("model", hService.getHouseById(Integer.parseInt(id)));
		model.addAttribute("hs", hService.getAllHouse());
		return "app/detail";
	}

	@Resource
	ApplyService applyService;

	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String post(HttpSession sess, String id, String userid,
			String state, String type, String created, String attachfile,
			String indate, String outdate, String stateid, String pid,
			String cid, String aid, String message, String username,
			String tel, String idcard, String sex, Model model)
			throws Exception, Throwable {
		System.out.println("INpost");
		if (this.checkTimeUsed(Integer.parseInt(id), indate, outdate)) {
			model.addAttribute("state", "error");
			model.addAttribute("url", "app/house");
			model.addAttribute("message", "已经被使用！");

		} else {
			Apply modelX = new Apply();
			modelX.setHid(id);
			modelX.setUserid(sess.getAttribute("userid").toString());
			modelX.setState("1");
			modelX.setType("1");
			modelX.setCreated(MainUtils.getTime());
			modelX.setUsername(username);
			modelX.setTel(tel);
			modelX.setSex(sex);
			modelX.setIdcard(idcard);
			modelX.setMessage(message);
			modelX.setIndate(indate);
			modelX.setOutdate(outdate);

			applyService.insert(modelX);
			House hs = hService.getHouseById(Integer.parseInt(id));
			hs.setState("2");
			hService.update(hs);
			model.addAttribute("inpost", true);
			model.addAttribute("state", "success");
			model.addAttribute("url", "app/house");
			model.addAttribute("message", "发布成功！");

		}
		return "app/detail";
	}

	public boolean checkTimeUsed(int id, String indate, String outdate)
			throws Throwable {
		Date date1 = MainUtils.convertTime(indate);
		Date date2 = MainUtils.convertTime(outdate);
		List<Apply> list = applyService.getApplyBy(id + "");
		if (list.size() > 0) {
			boolean ex = false;
			for (Apply apply : list) {
				if (DateKit.isContain(indate, outdate, apply.getIndate(),
						apply.getOutdate()))
					ex = true;
			}
			return ex;
		} else {
			return false;
		}

	}
}
