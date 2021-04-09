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
@RequestMapping("/news")
public class NewsController {
	@Resource
	NewsService newsService;
	@Resource
	CatesService catesService;

	public String toOption(List<Cates> list, int step) {
		String html = "";
		String str = "|";

		for (int i = 0; i < step; i++) {
			str += "--";
		}
		if (list.size() > 0) {
			for (Cates Cates : list) {
				if (Cates.getPid().equals("0"))
					step = 0;
				System.out.println(str + Cates.getTitle());
				html += "<option value='" + Cates.getId() + "'>";
				html += str + Cates.getTitle();
				html += "</option>";
				html += toOption(catesService.getByPid(Cates.getId() + ""),
						step += 5);
			}
		}

		return html;
	}

	@RequestMapping("/news/add")
	public String newsAdd(Model model) {
		model.addAttribute("html", this.toOption(catesService.getByPid("0"), 0));
		return "admin/news/add";
	}

	@RequestMapping(value = "/news/save", method = RequestMethod.POST)
	public String newsSave(String title, String description, String contents,
			String thumb, String cateid, String created, String click,
			String province, String city, String area, String userid,
			String address, String zan, String fav, String attachfile,
			HttpSession se, Model model) {
		News modelX = new News();
		modelX.setTitle(title);
		modelX.setDescription(description);
		modelX.setContents(contents);
		modelX.setThumb(thumb);
		modelX.setCateid(cateid);
		modelX.setCreated(MainUtils.getTime());
		modelX.setClick("1");
		modelX.setUserid(se.getAttribute("userid").toString());
		modelX.setAddress(address);
		modelX.setZan("1");
		modelX.setFav("1");
		// modelX.setAttachfile(attachfile);

		newsService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("state", "success");
		model.addAttribute("url", "news/news/add");
		model.addAttribute("message", "添加成功!");
		return "admin/news/add";
	}

	@RequestMapping("/news/delete")
	public String newsDelete(int id, Model model) {
		newsService.delete(id);
		model.addAttribute("state", "success");
		model.addAttribute("url", "news/news/list");
		model.addAttribute("message", "删除成功!");
		return "admin/news/list";
	}

	@Resource
	UsersService usersService;

	@RequestMapping("/news/list")
	public ModelAndView newsList() {
		List<News> newsList = newsService.getAllNews();
		System.out.println(newsList.size());
		ModelAndView mav = new ModelAndView("admin/news/list");
		for (News news : newsList) {
			news.setAuthor(usersService.getUsersById(Integer.parseInt(news
					.getUserid())));
			news.setCateName(catesService.getCatesById(
					Integer.parseInt(news.getCateid())).getTitle());
		}
		mav.addObject("list", newsList);

		return mav;
	}

	@RequestMapping("/news/edit")
	public String newsEdit(String id, Model model) {
		News news = newsService.getNewsById(Integer.parseInt(id));
		model.addAttribute("model", news);
		return "admin/news/edit";
	}

	@RequestMapping(value = "/news/update", method = RequestMethod.POST)
	public String newsUpdate(String title, String description, String contents,
			String thumb, String cateid, String created, String click,
			String province, String city, String area, String userid,
			String address, String zan, String fav, String attachfile, int id,
			Model model) {

		News modelX = newsService.getNewsById(id);
		modelX.setTitle(title);
		modelX.setDescription(description);
		modelX.setContents(contents);

		modelX.setThumb(thumb);
		// modelX.setAttachfile(attachfile);

		newsService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("state", "success");
		model.addAttribute("url", "news/news/edit?id=" + id);
		model.addAttribute("message", "修改成功!");
		return "admin/news/edit";
	}
}
