<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Details</title>
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
						<div class="py-2">
							<h2 class="text-primary">Project: <c:out value="${project.title}"></c:out></h2>
							<p>Project Lead: <c:out value="${project.owner.firstname}"></c:out></p>
						</div>
					</div>
					<div class="card-body">
						<h5 class="py-3">Add a Task ticket for this team</h5>
						<form:form action="/projects/${project.id}/tasks" method="POST" id="validate" modelAttribute="newTask">
							<div class="row mx-auto">
							
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:textarea path="description" class="form-control requires-validation validate-save" style="height: 200px" name="description" id="description" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="description" class="text-danger backend-validation" />
									  <form:label for="description" path="description">Description</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="d-flex align-items-center justify-content-end">
										<button class="btn btn-primary" type="submit" value="Submit">Send</button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
				
				<div class="py-5">
					<ul class="list-group">
					  <c:forEach var="task" items="${project.tasks}">
						<li class="list-group-item list-group-item-actione" aria-current="true">
					    <div class="d-flex w-100 justify-content-between">
					      <h5 class="mb-1">Added by <c:out value="${task.author.firstname}"></c:out></h5>
					      <small><fmt:formatDate type="both" dateStyle="long" timeStyle="long" pattern = "hh:mm a MMMM dd" value = "${task.createdAt}" /></small>
					    </div>
					    <p class="mb-1"><c:out value="${task.description}"></c:out></p>
					  </li>
					</c:forEach>
					</ul>
				</div>
				
				
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateNewTask.js"></script>
</body>
</html>