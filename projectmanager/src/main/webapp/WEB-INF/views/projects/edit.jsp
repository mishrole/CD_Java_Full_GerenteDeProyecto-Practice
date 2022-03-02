<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- PUT -->
<%@ page isErrorPage="true" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>

	<!--
	Al retornar error, no se incluye el jsp cuando se hace PUT
	<jsp:include page="/WEB-INF/views/header.jsp" />-->
	
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		  <div class="container-fluid">
		    <a class="navbar-brand fw-bold" href="/dashboard">Project Manager</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbar">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		        <c:choose>
		        	<c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/dashboard'}">
		        		<a class="nav-link active" aria-current="page" href="/dashboard">All Projects</a>
		        	</c:when>
		        	
		        	<c:otherwise>
		        		<a class="nav-link" aria-current="page" href="/dashboard">All Projects</a>
		        	</c:otherwise>
		        </c:choose>
		        </li>
		        <li class="nav-item">
		        <c:choose>
		        	<c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/projects/new'}">
		        		<a class="nav-link active" aria-current="page" href="/projects/new">New Project</a>
		        	</c:when>
		        	
		        	<c:otherwise>
		        		<a class="nav-link" aria-current="page" href="/projects/new">New Project</a>
		        	</c:otherwise>
		        </c:choose>
		        </li>
		      </ul>
			  <div class="d-flex">
			  	<a class="btn btn-danger" href="/logout">Logout</a>
			  </div>
		    </div>
		  </div>
		</nav>
	</div>
	
	<div class="pt-5">
		<div class="container pt-5">
			<div class="d-flex justify-content-end">
				<a href="/">Go back</a>
			</div>
		</div>
	</div>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center py-2">Change your entry</h3>
						<form:form action="/projects/${project.id}" method="POST" id="validate" modelAttribute="project">
						<input type="hidden" name="_method" value="PUT">
							<div class="row mx-auto">
							
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:input path="title" type="text" class="form-control requires-validation validate-save" name="title" id="title" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="title" class="text-danger backend-validation" />
									  <form:label for="title" path="title">Title</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:textarea path="description" class="form-control requires-validation validate-save" style="height: 200px" name="description" id="description" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="description" class="text-danger backend-validation" />
									  <form:label for="description" path="description">Description</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:input path="dueDate" type="date" class="form-control requires-validation validate-save date-control" name="dueDate" id="dueDate" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="dueDate" class="text-danger backend-validation" />
									  <form:label for="dueDate" path="dueDate">Due Date</form:label>
									</div>
								</div>

								<div class="col-12">
									<div class="d-flex align-items-center justify-content-end">
										<button class="btn btn-primary" type="submit" value="Submit">Save</button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- jQuery (No necesario en Bootstrap 5) -->
	<!-- <script src="/webjars/jquery/jquery.min.js"></script> -->
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateNewProject.js"></script>
</body>
</html>