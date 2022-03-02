package com.codingdojo.projectmanager.service;

import org.springframework.validation.BindingResult;

import com.codingdojo.projectmanager.entity.User;
import com.codingdojo.projectmanager.entity.request.LoginUser;

/* Patrón DAO, acceso a datos agnóstico de BD */
public interface IUserService {
	public abstract User find(Long id);
	public abstract User register(User newUser, BindingResult result);
	public abstract User login (LoginUser newLogin, BindingResult result);
}
