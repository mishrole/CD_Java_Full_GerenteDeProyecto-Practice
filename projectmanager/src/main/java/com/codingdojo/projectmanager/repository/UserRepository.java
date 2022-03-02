package com.codingdojo.projectmanager.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.projectmanager.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	Optional<User> findById(Long id);
	Optional<User> findByEmail(String email);
	List<User> findByEmailAndPassword(String email, String password);
	User findUserById(Long id);
}
