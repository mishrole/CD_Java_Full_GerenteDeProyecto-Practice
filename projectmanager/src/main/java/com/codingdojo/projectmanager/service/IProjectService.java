package com.codingdojo.projectmanager.service;

import java.util.List;

import org.springframework.validation.BindingResult;

import com.codingdojo.projectmanager.entity.Project;
import com.codingdojo.projectmanager.entity.User;

/* Patrón DAO, acceso a datos agnóstico de BD */
public interface IProjectService {
	public abstract List<Project> getAll();
	public abstract Project find(Long id);
	public abstract Project save(Project project, BindingResult result);
	public abstract Project update(Long id, Project project, BindingResult result);
	public abstract Project addUser(Long projectId, Long userId);
	public abstract void removeUser(Long projectId, Long userId);
	public abstract List<Project> findAllByUsers(User user);
	public abstract List<Project> findByUsersNotContains(User user);
	public abstract void delete(Long id);
	public abstract List<Project> findByUsersNotContainsAndOwnerIdNotLike(User user, Long owner_id);
	public abstract List<Project> findAllByUsersOrOwnerIdLike(User user, Long owner_id);
}
