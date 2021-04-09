package com.app.controller;

import java.io.File;
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
import com.app.utils.MD5;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/manage")
public class ManageController {

	@Resource
	UsersService userService;

	@RequestMapping("/index")
	public String index(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:login";
		}

		return "admin/index";
	}

	@RequestMapping("/main")
	public String main(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:login";
		}

		return "admin/main";
	}

	@RequestMapping("/login")
	public String login() {
		return "admin/login";
	}

	@RequestMapping("/reg")
	public String reg() {
		return "admin/reg";
	}

	@RequestMapping("/findPwd")
	public String findPwd() {
		return "admin/findPwd";
	}

	@RequestMapping("/quit")
	public String quit(String retUrl, HttpSession session) {
		session.setAttribute("user", null);
		session.setAttribute("userid",null);
		session.setAttribute("username", null);
		session.setAttribute("usertype", null);
		session.setAttribute("thumb", null);
		session.invalidate();
		return "redirect:" + retUrl;
	}

	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	public String signin(@RequestParam("username") String username,
			@RequestParam("password") String password, Model model,
			HttpSession session) {
		System.out.println(username);
		System.out.println(password);
		Users user = userService.userLogin(username, MD5.MD51(password));

		model.addAttribute("inlogin", true);
		if (user != null) {

			model.addAttribute("user", user);

			session.setAttribute("user", user);
			session.setAttribute("userid", user.getId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("usertype", user.getType());
			session.setAttribute("thumb", user.getThumb());

			// Users us = userService.getUsersById(Integer.parseInt(session
			// .getAttribute("userid") + ""));
			// float oldMoney = Float.parseFloat(us.getMoney());
			// us.setMoney((oldMoney + MainUtils.LOGINVAL) + "");
			// userService.update(us);
			model.addAttribute("url", "manage/index");
			model.addAttribute("state", "success");
			model.addAttribute("message", "登录成功！");
		} else {
			model.addAttribute("url", "manage/login");
			model.addAttribute("state", "error");
			model.addAttribute("message", "密码或用户名错误！");
		}
		return "admin/login";
	}

	@RequestMapping(value = "/doreg", method = RequestMethod.POST)
	public String doreg(@RequestParam("username") String username,
			@RequestParam("password") String password, String realname,
			String email, String tel, String qq, String address, String thumb,
			String age, Model model, HttpSession session) {
		System.out.println(username);
		System.out.println(MD5.MD51(password));
		if (userService.getByName(username).size() > 0) {
			model.addAttribute("url", "manage/login");
			model.addAttribute("state", "error");
			model.addAttribute("message", "该账号已被注册！");
		} else {
			Users user = new Users();
			user.setEcard(MainUtils.getEcard());
			user.setMoney("100.00");
			user.setType(1 + "");
			user.setUsername(username);
			user.setPassword(MD5.MD51(password));
			user.setRealname(realname);
			user.setEmail(email);
			user.setTel(tel);
			user.setAddress(address);
			user.setThumb(thumb);
			user.setQq(qq);
			user.setAge(age);

			user.setCreated(MainUtils.getTime());
			userService.insert(user);

			model.addAttribute("url", "manage/login");
			model.addAttribute("state", "success");
			model.addAttribute("message", "注册成功！");
		}
		return "admin/reg";
	}

	@RequestMapping(value = "/getpwd", method = RequestMethod.GET)
	public String getpwd(@RequestParam("username") String username,
			Model model, HttpSession session) {
		List<Users> ucheck = userService.getByName(username);

		model.addAttribute("getpwdin", true);
		int res = 0;
		if (ucheck != null && ucheck.size() > 0) {

			Users u = ucheck.get(0);
			u.setPassword(MD5.MD51("123456"));
			userService.update(u);
			model.addAttribute("state", 1);
			res = 1;
		} else {
			model.addAttribute("state", 0);
		}

		return "redirect:login?result=" + res;
	}

	@RequestMapping(value = "/findPwdForm", method = RequestMethod.POST)
	public String signin(@RequestParam("email") String email, Model model,
			HttpSession session) {

		List<Users> list = userService.getAllUsers();
		Users getUser = new Users();
		boolean exist = false;
		if (list.size() > 0) {
			for (Users user : list) {
				if (user.getEmail().equals(email)) {
					getUser = user;
					exist = true;
					break;

				}
			}
		}

		model.addAttribute("inlogin", true);
		if (exist) {
			getUser.setPassword(MD5.MD51("123456"));
			userService.update(getUser);
			model.addAttribute("state", 1);
			model.addAttribute("message", "重置密码成功！！");
		} else {
			model.addAttribute("state", 2);
			model.addAttribute("message", "重置密码失败！");
		}
		return "admin/findPwd";
	}

}
