<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	
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
						<h3 class="text-center py-2">New entry</h3>
						<form:form action="/projects" method="POST" id="validate" modelAttribute="project">
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
										<button class="btn btn-primary" type="submit" value="Submit">Create</button>
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