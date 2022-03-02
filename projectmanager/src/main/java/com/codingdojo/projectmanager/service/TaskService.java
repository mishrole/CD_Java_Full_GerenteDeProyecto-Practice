package com.codingdojo.projectmanager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.projectmanager.entity.Task;
import com.codingdojo.projectmanager.repository.TaskRepository;

@Service
public class TaskService implements ITaskService {

	@Autowired
	private TaskRepository taskRepository;
	
	@Override
	public Task save(Task task) {
		return taskRepository.save(task);
	}

}
