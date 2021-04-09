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
import com.app.utils.MD5;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/users")
public class UsersController {
	@Resource
	UsersService usersService;

	@RequestMapping("/users/add")
	public String usersAdd() {
		return "admin/users/add";
	}

	@RequestMapping(value = "/users/save", method = RequestMethod.POST)
	public String usersSave(String username, String password, String sex,
			String birthday, String address, String email, String qq,
			String tel, String money, String thumb, String grade, String type,
			String created, String updated, String status, String age,
			String ecard, String company, String realname, String position,
			String signature, String pid, String cid, String aid, String vip,
			Model model) {
		Users modelX = new Users();
		modelX.setUsername(username);
		modelX.setPassword(MD5.MD51(password));
		modelX.setSex(sex);
		modelX.setBirthday(birthday);
		modelX.setAddress(address);
		modelX.setEmail(email);
		modelX.setQq(qq);
		modelX.setTel(tel);
		modelX.setMoney("100");
		modelX.setThumb(thumb);
		
		modelX.setType(type);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setAge(age);
		modelX.setEcard(ecard);
		modelX.setCompany(company);
		modelX.setRealname(realname);
		modelX.setPosition(position);
		modelX.setSignature(signature);
		modelX.setPid(pid);
		modelX.setCid(cid);
		modelX.setAid(aid);
		modelX.setVip(vip);

		usersService.insert(modelX);
		model.addAttribute("inpost", true);model.addAttribute("message", "修改成功");
		model.addAttribute("state", "success");
		model.addAttribute("url", "users/users/add");
		return "admin/users/add";
	}

	@RequestMapping("/users/delete")
	public String usersDelete(int id) {
		usersService.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/profile")
	public String userprofile(String id, HttpSession session, Model model) {
		int userId;
		if (id == null) {
			userId = Integer.parseInt(session.getAttribute("userid") + "");
		} else {
			userId = Integer.parseInt(id);
		}

		Users user = usersService.getUsersById(userId);
		model.addAttribute("user", user);
		return "admin/users/profile";
	}
	
	@RequestMapping("/charge")
	public String charge(String id, HttpSession session, Model model) {
		int userId;
		if (id == null) {
			userId = Integer.parseInt(session.getAttribute("userid") + "");
		} else {
			userId = Integer.parseInt(id);
		}

		Users user = usersService.getUsersById(userId);
		model.addAttribute("user", user);
		return "admin/users/charge";
	}

	@RequestMapping("/password")
	public String userpassword(String id, HttpSession session, Model model) {
		int userId;
		if (id == null) {
			userId = Integer.parseInt(session.getAttribute("userid") + "");
		} else {
			userId = Integer.parseInt(id);
		}

		Users user = usersService.getUsersById(userId);
		model.addAttribute("user", user);
		return "admin/users/password";
	}

	@RequestMapping("/users/list")
	public ModelAndView usersList() {
		List<Users> usersList = usersService.getAllUsers();
		System.out.println(usersList.size());
		ModelAndView mav = new ModelAndView("admin/users/list");
		mav.addObject("list", usersList);
		return mav;
	}

	@RequestMapping("/users/edit")
	public String usersEdit(String id, Model model) {
		Users users = usersService.getUsersById(Integer.parseInt(id));
		model.addAttribute("model", users);
		return "admin/users/edit";
	}

	@RequestMapping(value = "/users/update", method = RequestMethod.POST)
	public String usersUpdate(String id, String username, String password,
			String sex, String birthday, String address, String email,
			String qq, String tel, String money, String thumb, String grade,
			String type, String created, String updated, String status,
			String realname, String age, String ecard, String position,

			Model model) {

		Users modelX = usersService.getUsersById(Integer.parseInt(id));

		modelX.setAddress(address);
		modelX.setEmail(email);
		modelX.setQq(qq);
		modelX.setTel(tel);
		modelX.setThumb(thumb);
		modelX.setEcard(ecard);
		modelX.setAge(age);
		modelX.setRealname(realname);
		modelX.setSex(sex);
		modelX.setPosition(position);
		usersService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "修改成功");
		model.addAttribute("state", "success");
		model.addAttribute("url", "users/profile?id=" + id);
		model.addAttribute("user", modelX);
		return "admin/users/profile";
	}
	
	@RequestMapping(value = "/users/updatecharge", method = RequestMethod.POST)
	public String usersUpdate(String id, Integer money1,
			Integer jf1, 
			Model model) {

		Users modelX = usersService.getUsersById(Integer.parseInt(id));
		modelX.setMoney((money1+Integer.parseInt(modelX.getMoney()))+"");
		if(modelX.getType().equals("2")) modelX.setJf((jf1+Integer.parseInt(modelX.getJf()))+"");
		usersService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "修改成功");
		model.addAttribute("state", "success");
		model.addAttribute("url", "users/charge?id=" + id);
		model.addAttribute("user", modelX);
		return "admin/users/charge";
	}
	
	@RequestMapping(value = "/pass")
	public String usersUpdate(String id, String grade,
			Model model) {

		Users modelX = usersService.getUsersById(Integer.parseInt(id));
		modelX.setType("2");
		modelX.setGrade(grade);
		usersService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "修改成功");
		model.addAttribute("state", "success");
		model.addAttribute("url", "users/users/list");
		model.addAttribute("user", modelX);
		return "admin/users/list";
	}

	@RequestMapping(value = "/users/updatepassword", method = RequestMethod.POST)
	public String updatepassword(int id, String password, String password2,
			Model model) {
		model.addAttribute("url", "users/password?id=" + id);
		if (!password.equals(password2)) {
			model.addAttribute("message", "修改失败");
			model.addAttribute("state", "error");
		} else {
			Users user = usersService.getUsersById(id);
			user.setPassword(MD5.MD51(password));
			usersService.update(user);
			model.addAttribute("user", user);
			model.addAttribute("message", "修改成功");
			model.addAttribute("state", "success");

		}
		return "admin/users/password";
		// return "redirect:profile?id="+id;
	}
	

	@RequestMapping(value = "/sq")
	public String sq(HttpSession sess,
			Model model) {
		int id = Integer.parseInt(sess.getAttribute("userid").toString());
		//model.addAttribute("url", "users/password?id=" + id);
		
			Users user = usersService.getUsersById(id);
			user.setGrade("0");
			usersService.update(user);
			model.addAttribute("user", user);
			model.addAttribute("message", "申请成功！");
			model.addAttribute("state", "success");
			model.addAttribute("url", "manage/index");
			
		return "admin/index";
		// return "redirect:profile?id="+id;
	}
}
