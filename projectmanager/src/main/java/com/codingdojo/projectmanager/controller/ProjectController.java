package com.codingdojo.projectmanager.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.projectmanager.entity.Project;
import com.codingdojo.projectmanager.entity.Task;
import com.codingdojo.projectmanager.entity.User;
import com.codingdojo.projectmanager.service.ProjectService;
import com.codingdojo.projectmanager.service.TaskService;

@Controller
@RequestMapping("/projects")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private TaskService taskService;
	
	
	/* JSP */
	
	@RequestMapping("/new")
	public String newView(HttpSession session, @ModelAttribute("project") Project project, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		
		return "projects/new";
	}
	
	@RequestMapping("/{id}")
	public String showView(HttpSession session, @PathVariable("id") Long id, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		
		Project result = projectService.find(id);
		model.addAttribute("project", result);
		
		return "projects/show";
	}
	
	@RequestMapping("/{id}/edit")
	public String editView(HttpSession session, @PathVariable("id") Long id, Model model) {
		Project result = projectService.find(id);
		model.addAttribute("project", result);
		
		User loggedUser = (User) session.getAttribute("user");
		User projectOwner = (User) Hibernate.unproxy(result.getOwner());

		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		Long loggedId = loggedUser.getId();
		Long ownerId = projectOwner.getId();
		
		if(projectOwner == null || !(loggedId.equals(ownerId))) {
			return "redirect:/dashboard";
		}
		
		return "projects/edit";
	}
	
	@RequestMapping("/{id}/tasks")
	public String taskView(HttpSession session, @PathVariable("id") Long id, Model model, @ModelAttribute("newTask") Task task) {
		Project result = projectService.find(id);
		model.addAttribute("project", result);
		
		User loggedUser = (User) session.getAttribute("user");
		
		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		return "tasks/tasks";
	}
	
	/* Actions */
	
	@RequestMapping(value = "/{projectId}/tasks", method = RequestMethod.POST)
	public String createTask(HttpSession session, @Valid @ModelAttribute("newTask") Task task, @PathVariable("projectId") Long projectId, BindingResult result, Model model) {
		Project project = projectService.find(projectId);
		
		if (result.hasErrors()) {
			model.addAttribute("project", project);
			return "tasks/tasks";
		}
		
		User loggedUser = (User) session.getAttribute("user");
		
		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		//task.setId(null); // Task llega con id, si pathvariable se llama como uno de sus atributos va a intentar mapear
		task.setProject(project);
		task.setAuthor(loggedUser);
		
		taskService.save(task);
		
		model.addAttribute("newTask", new Task());
		
		return "redirect:/projects/" + projectId +"/tasks";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String create(HttpSession session, @Valid @ModelAttribute("project") Project project, BindingResult result) {
		if (result.hasErrors()) {
			return "projects/new";
		}
		
		User loggedUser = (User) session.getAttribute("user");
		
		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		project.setOwner(loggedUser);
		
		projectService.save(project, result);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public String update(HttpSession session, @PathVariable("id") Long id, @Valid @ModelAttribute("project") Project project, BindingResult result) {
		if (result.hasErrors()) {
			return "projects/edit";
		}
		
		User loggedUser = (User) session.getAttribute("user");
		
		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		Project updatedProject = projectService.update(id, project, result);
		
		if (updatedProject == null) {
			return "projects/edit";
		}
		
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value = "/{projectId}/add/{userId}", method = RequestMethod.POST)
	public String addUser(@PathVariable("projectId") Long projectId, @PathVariable("userId") Long userId) {
		projectService.addUser(projectId, userId);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value = "/{projectId}/remove/{userId}", method = RequestMethod.POST)
	public String removeUser(@PathVariable("projectId") Long projectId, @PathVariable("userId") Long userId) {
		projectService.removeUser(projectId, userId);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		projectService.delete(id);
		return "redirect:/dashboard";
	}
}
