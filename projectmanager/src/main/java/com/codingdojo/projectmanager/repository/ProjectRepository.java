package com.codingdojo.projectmanager.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.projectmanager.entity.Project;
import com.codingdojo.projectmanager.entity.User;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {
	List<Project> findAll();
	Optional<Project> findById(Long id);
	List<Project> findAllByUsers(User user);
	List<Project> findAllByUsersOrOwnerIdLike(User user, Long owner_id);
	
	List<Project> findByUsersNotContains(User user);
	List<Project> findByUsersNotContainsAndOwnerIdNotLike(User user, Long owner_id);
	Project findProjectById(Long id);
}
