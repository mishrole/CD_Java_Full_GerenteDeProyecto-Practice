package com.codingdojo.projectmanager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.projectmanager.entity.Project;
import com.codingdojo.projectmanager.entity.User;
import com.codingdojo.projectmanager.entity.request.LoginUser;
import com.codingdojo.projectmanager.service.ProjectService;
import com.codingdojo.projectmanager.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value = "/",  method = RequestMethod.GET)
	public String index(HttpSession session, Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
		if (session.getAttribute("user") != null) {
			return "redirect:/dashboard";
		}
		
		return "index";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index";
		}
		
		User savedUser = userService.register(newUser, result);
		if (savedUser == null) {
			model.addAttribute("newLogin", new LoginUser());
			return "index";
		}
		
		session.setAttribute("user", savedUser);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index";
		}
		
		User userFound = userService.login(newLogin, result);
		
		if (userFound == null) {
			model.addAttribute("newUser", new User());
			return "index";
		}
		
		session.setAttribute("user", userFound);
		
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		
		User loggedUser = (User) session.getAttribute("user");
		
		List<Project> projects_available = projectService.findByUsersNotContainsAndOwnerIdNotLike(loggedUser, loggedUser.getId());
		List<Project> projects_involved = projectService.findAllByUsersOrOwnerIdLike(loggedUser, loggedUser.getId());
		
		model.addAttribute("projects_available", projects_available);
		model.addAttribute("projects_involved", projects_involved);
		
		return "dashboard";
	}
}
