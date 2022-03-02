package com.codingdojo.projectmanager.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.projectmanager.entity.Project;
import com.codingdojo.projectmanager.entity.User;
import com.codingdojo.projectmanager.repository.ProjectRepository;
import com.codingdojo.projectmanager.repository.UserRepository;

@Service
public class ProjectService implements IProjectService {
	
	@Autowired
	private ProjectRepository projectRepository;
	@Autowired
	private UserRepository userRepository;

	@Override
	public Project save(Project project, BindingResult result) {
		try {		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = sdf.parse(sdf.format(new Date()));
			
	        Date dueDate = project.getDueDate();
	        
	        if (!(dueDate.equals(today))) {
	            if (dueDate.before(today)) {
	            	result.rejectValue("dueDate", "Matches", "Due Date must be in the future");
	            	return null;
	            }
	        }
			
		} catch (ParseException e) {
			e.printStackTrace();
		}  

		return projectRepository.save(project);
	}

	@Override
	public Project update(Long id, Project project, BindingResult result) {
		try {		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = sdf.parse(sdf.format(new Date()));
			
	        Date dueDate = project.getDueDate();
	        
	        if (!(dueDate.equals(today))) {
	            if (dueDate.before(today)) {
	            	result.rejectValue("dueDate", "Matches", "Due Date must be in the future");
	            	return null;
	            }
	        }
			
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		
		Optional<Project> saved = projectRepository.findById(id);
		
		if (saved.isPresent()) {
			Project data = saved.get();
			data.setTitle(project.getTitle());
			data.setDescription(project.getDescription());
			data.setDueDate(project.getDueDate());
			
			return projectRepository.save(data);
		}
		
		return null;
	}

	@Override
	public Project addUser(Long projectId, Long userId) {
		Project project = projectRepository.findProjectById(projectId);
		User user = userRepository.findUserById(userId);
		
		project.getUsers().add(user);
		return projectRepository.save(project);
	}
	
	@Override
	public void removeUser(Long projectId, Long userId) {
		Project project = projectRepository.findProjectById(projectId);
		User user = userRepository.findUserById(userId);
		
		project.getUsers().remove(user);
		projectRepository.save(project);
	}

	@Override
	public List<Project> findAllByUsers(User user) {
		return projectRepository.findAllByUsers(user);
	}

	@Override
	public List<Project> findByUsersNotContains(User user) {
		return projectRepository.findByUsersNotContains(user);
	}

	@Override
	public void delete(Long id) {
		projectRepository.deleteById(id);
	}

	@Override
	public Project find(Long id) {
		Optional<Project> saved = projectRepository.findById(id);
		
		if (saved.isPresent()) {
			return saved.get();
		}
		
		return null;
	}

	@Override
	public List<Project> getAll() {
		return projectRepository.findAll();
	}

	@Override
	public List<Project> findByUsersNotContainsAndOwnerIdNotLike(User user, Long owner_id) {
		return projectRepository.findByUsersNotContainsAndOwnerIdNotLike(user, owner_id);
	}

	@Override
	public List<Project> findAllByUsersOrOwnerIdLike(User user, Long owner_id) {
		return projectRepository.findAllByUsersOrOwnerIdLike(user, owner_id);
	}

}
