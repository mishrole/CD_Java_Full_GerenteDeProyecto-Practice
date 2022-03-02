<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dashboard</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	
	<jsp:include page="header.jsp" />
	
	<div class="pt-5">
		<div class="container pt-5">
			<div class="row">
				<div class="col-8">
					<h3>Welcome <c:out value="${user.firstname}"></c:out>!</h3>
				</div>
				<div class="col-4">
					<div class="d-flex justify-content-end">
						<a href="/projects/new" class="btn btn-primary">
							<span class="d-flex gap-1">
								New <span class="d-none d-sm-flex">Project</span>
							</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<h3 class="text-primary">All Projects</h3>
				<c:choose>
					<c:when test="${fn:length(projects_available) > 0}">
						<div class="table-responsive">
							<table class="table table-hover text-center">
								<thead>
									<tr>
										<th scope="col">Project</th>
										<th scope="col">Team Lead</th>
										<th scope="col">Due Date</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="project" items="${projects_available}">
									<tr>
								      <td><a href="/projects/${project.id}">${project.title}</a></td>
								      <td>${project.owner.firstname}</td>
								      <td><fmt:formatDate pattern = "dd/MM/yyyy" value = "${project.dueDate}" /></td>
								      <td>
								      <div class="d-flex justify-content-center gap-1 align-items-center">
								      	<form action="/projects/${project.id}/add/${user.id}" method="post">
								      		<button type="submit" class="btn btn-default link">Join team</button>
								      	</form>
								      </div>
								      </td>
								    </tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					
					<c:otherwise>
					<div class="card">
						<div class="card-body">
							<p class="text-center">Oh no, no data yet 😢</p>
						</div>
					</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<h3 class="text-primary">Your Projects</h3>
				<c:choose>
					<c:when test="${fn:length(projects_involved) > 0}">
						<div class="table-responsive">
							<table class="table table-hover text-center">
								<thead>
									<tr>
										<th scope="col">Project</th>
										<th scope="col">Team Lead</th>
										<th scope="col">Due Date</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="project" items="${projects_involved}">
									<tr>
								      <td><a href="/projects/${project.id}">${project.title}</a></td>
								      <td>${project.owner.firstname}</td>
								      <td><fmt:formatDate pattern = "dd/MM/yyyy" value = "${project.dueDate}" /></td>
								      <td>
								      <div class="d-flex justify-content-center gap-1 align-items-center">
								      <c:choose>
								      	<c:when test="${user.id == project.owner.id}">
								      	<a href="/projects/${project.id}/edit">Edit</a>
								      	</c:when>
								      	<c:otherwise>
								      	<form action="/projects/${project.id}/remove/${user.id}" method="post">
								      		<button type="submit" class="btn btn-default link">Leave team</button>
								      	</form>
								      	</c:otherwise>
								      </c:choose>
								      </div>
								      </td>
								    </tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					
					<c:otherwise>
					<div class="card">
						<div class="card-body">
							<p class="text-center">Oh no, no data yet 😢</p>
						</div>
					</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<!-- <script src="/js/validateHelper.js"></script> -->
	<!-- <script src="/js/validateForm.js"></script> -->
</body>
</html>