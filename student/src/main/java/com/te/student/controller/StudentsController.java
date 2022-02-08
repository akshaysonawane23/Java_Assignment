package com.te.student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sun.tools.xjc.model.Model;
import com.te.student.bean.StudentsDetail;
import com.te.student.service.StudentServiceImpl;

@Controller
public class StudentsController {
	@Autowired
	StudentServiceImpl service;

	@GetMapping("/login")
	public String login() {
		return "loginform";

	}

	@PostMapping("/login")
	public String login(HttpServletRequest request, ModelMap map, int id, String password) {
		StudentsDetail detail = service.authenticate(id, password);
		HttpSession session = request.getSession();
		session.setAttribute("loggedin", detail);
		if (detail != null) {
			map.addAttribute("msg", detail.getName());
			return "home";
		} else {
			map.addAttribute("errMsg", "Invalid Credential");
			return "loginform";
		}

	}

	@GetMapping("/home")
	public String home(@SessionAttribute(name = "loggedin", required = false) StudentsDetail detail, ModelMap map) {

		map.addAttribute("msg", detail.getName());
		return "home";
	}

	@GetMapping("/addStudent")
	public String add(ModelMap map, @SessionAttribute(name = "loggedin", required = false) StudentsDetail detail) {
		if (detail != null) {
			return "addStudent";
		} else {
			map.addAttribute("errMsg", "Please login first");
			return "loginform";
		}
	}

	@PostMapping("/addStudent")
	public String addStudent(StudentsDetail detail,
			@SessionAttribute(name = "loggedin", required = false) StudentsDetail detail2, ModelMap map) {
		if (detail2 != null) {
			if (service.addStudent(detail)) {
				map.addAttribute("msg", "Data added successfully!!!!");
			} else {
				map.addAttribute("errMsg", "Something went wrong!!!!");
			}

			return "addStudent";
		} else {
			map.addAttribute("errMsg", "Please login first");
			return "loginform";
		}

	}

	@GetMapping("/updateStudent")
	public String updateStudent(@SessionAttribute(name = "loggedin", required = false) StudentsDetail detail,
			ModelMap map) {
		if (detail != null) {
//			map.addAttribute("data", detail);
			return "update";
		} else {
			map.addAttribute("errMsg", "Please login first");
			return "loginform";
		}

	}

	@PostMapping("/updateStudent")
	public String update(StudentsDetail detail, ModelMap map,
			@SessionAttribute(name = "loggedin", required = false) StudentsDetail detail2) {
		if (detail2 != null) {
			if (service.update(detail, detail2.getId())) {
				map.addAttribute("data", detail2.getId());
				map.addAttribute("msg", "Data Updated successfully!!");

			} else {
				map.addAttribute("errmsg", "Something went wrong");
			}
			return "update";
		} else {
			map.addAttribute("errMsg", "Please login first");
			return "loginform";
		}
	}

	@GetMapping("/delete")
	public String deleteData() {
		return "delete";
	}

	@PostMapping("/delete")
	public String delete(@SessionAttribute(name = "loggedin", required = false) StudentsDetail detail, ModelMap map,
			int id) {
		if (detail != null) {
			if (service.delete(id)) {
				map.addAttribute("msg", "Data deleted successfully!!!");
			} else {
				map.addAttribute("errMsg", "No data found for id :" + id);
			}
			return "delete";
		} else {
			map.addAttribute("errMsg", "Please login first");
			return "loginform";
		}
	}

	@GetMapping("/allStudent")
	public String allStudent(ModelMap map) {
		List<StudentsDetail> details = service.getAllDetails();
		map.addAttribute("details", details);
		return "allStudent";
	}

	@GetMapping("/details")
	public String details(@SessionAttribute(name = "loggedin", required = false) StudentsDetail detail, ModelMap map) {
		if (detail != null) {
			return "details";
		} else {
			map.addAttribute("errMsg", "Please login first!!!");
			return "loginform";
		}
	}

	@PostMapping("/details")
	public String getDetails(int id, ModelMap map,
			@SessionAttribute(name = "loggedin", required = false) StudentsDetail detail) {
		if (detail != null) {
			StudentsDetail detail2 = service.getDetails(id);
			if (detail2 != null) {
				map.addAttribute("details", detail2);

			} else {
				map.addAttribute("msg", "No data found for id: " + id);
			}
			return "details";
		} else {
			map.addAttribute("errMsg", "Please login first!!!");
			return "loginform";
		}
	}

	@GetMapping("/logout")
	public String logOut(ModelMap map, HttpSession session) {
		map.addAttribute("errMsg", "Loged out successfully");
		session.invalidate();
		return "loginform";

	}

}
