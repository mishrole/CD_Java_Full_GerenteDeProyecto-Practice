package com.codingdojo.projectmanager.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Firstname is required")
	@Size(min = 3, max = 30, message = "Firstname must have 3-30 characters long")
	private String firstname;
	
	@NotEmpty(message = "Lastname is required")
	@Size(min = 3, max = 30, message = "Lastname must have 3-30 characters long")
	private String lastname;
	
	@NotEmpty(message="Email is required")
    @Email(message="Please enter a valid email")
    private String email;
    
    @NotEmpty(message="Password is required")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    @Transient
    @NotEmpty(message="Confirm Password is required")
    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
    private String confirm;
    
    /* Merge to avoid persisted data */
    @OneToMany(mappedBy="owner", cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    private List<Project> ownedProjects;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    	name = "projects_users",
    	joinColumns = @JoinColumn(name = "user_id"),
    	inverseJoinColumns = @JoinColumn(name = "project_id")
	)
    private List<Project> projects;
    
    /* Merge to avoid persisted data */
    @OneToMany(mappedBy="author", cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    private List<Task> authoredTasks;
    
    // Getters & Setters
  
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
	public List<Project> getOwnedProjects() {
		return ownedProjects;
	}

	public void setOwnedProjects(List<Project> ownedProjects) {
		this.ownedProjects = ownedProjects;
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	
	public List<Task> getAuthoredTasks() {
		return authoredTasks;
	}

	public void setAuthoredTasks(List<Task> authoredTasks) {
		this.authoredTasks = authoredTasks;
	}

	// Constructor
	public User() {}
}
