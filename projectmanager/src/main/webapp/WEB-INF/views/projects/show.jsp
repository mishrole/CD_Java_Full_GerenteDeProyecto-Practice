<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- PUT -->
<%@ page isErrorPage="true" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Show</title>
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
					<div class="card-header">
						<div class="d-flex justify-content-between">
							<h3><c:out value="${project.title}"></c:out></h3>
							<c:if test="${user.id == project.owner.id}">
							<div class="d-flex justify-content-end align-items-center gap-2">
								<a href="/projects/${project.id}/edit" class="btn btn-outline-primary">Edit</a>
								<form action="/projects/${project.id}" method="post">
									<input type="hidden" name="_method" value="delete">
						      		<button type="submit" class="btn btn-outline-danger">Delete</button>
						      	</form>							
							</div>
							</c:if>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-12 col-md-4"><p class="fw-bold">Project:</p></div>
							<div class="col-12 col-md-8">
							<p><c:out value="${project.title}"></c:out></p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-12 col-md-4"><p class="fw-bold">Description:</p></div>
							<div class="col-12 col-md-8">
							<p><c:out value="${project.description}"></c:out></p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-12 col-md-4"><p class="fw-bold">Due Date:</p></div>
							<div class="col-12 col-md-8">
							<p><fmt:formatDate pattern = "dd/MM/yyyy" value = "${project.dueDate}" /></p>
							</div>
						</div>
					</div>
					
					<div class="card-footer">
						<div class="d-flex justify-content-end">
							<a href="/projects/${project.id}/tasks" class="btn btn-secondary">View Tasks</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>