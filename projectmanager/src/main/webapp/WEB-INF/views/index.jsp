<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Project Manager</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				
				<div class="d-flex flex-column justify-content-between align-items-center pb-4">
					<h3 class="text-primary">Project Manager</h3>
					<p>A place for teams to manage projects</p>
				</div>
				
				<div class="row">
				<!-- Register -->
					<div class="col-12 col-lg-6">
						<div class="card mb-4">
							<div class="card-body">
								<h3 class="pt-2 pb-3">Register</h3>
								<form:form action="/register" method="POST" id="validateRegister" modelAttribute="newUser">
									<div class="row mx-auto">

										<div class="col-12">
											<div class="form-floating mb-3">
												<form:input path="firstname" type="text" class="form-control requires-validation validate-save" name="firstname" id="firstname" />
												<div class="invalid-feedback"></div>
												<form:errors path="firstname" class="text-danger backend-validation" />
												<form:label for="firstname" path="firstname">First Name</form:label>
											</div>
										</div>
										
										<div class="col-12">
											<div class="form-floating mb-3">
												<form:input path="lastname" type="text" class="form-control requires-validation validate-save" name="lastname" id="lastname" />
												<div class="invalid-feedback"></div>
												<form:errors path="lastname" class="text-danger backend-validation" />
												<form:label for="lastname" path="lastname">Last Name</form:label>
											</div>
										</div>
										
										<div class="col-12">
											<div class="form-floating mb-3">
												<form:input path="email" type="email" class="form-control requires-validation validate-save" name="email" id="email" />
												<div class="invalid-feedback"></div>
												<form:errors path="email" class="text-danger backend-validation" />
												<form:label for="email" path="email">Email</form:label>
											</div>
										</div>
										
										<div class="col-12">
											<div class="form-floating mb-3">
												<form:input path="password" type="password" class="form-control requires-validation validate-save" name="password" id="password" />
												<div class="invalid-feedback"></div>
												<form:errors path="password" class="text-danger backend-validation" />
												<form:label for="password" path="password">Password</form:label>
											</div>
										</div>
										
										<div class="col-12">
											<div class="form-floating mb-3">
												<form:input path="confirm" type="password" class="form-control requires-validation validate-save" name="confirm" id="confirm" />
												<div class="invalid-feedback"></div>
												<form:errors path="confirm" class="text-danger backend-validation" />
												<form:label for="confirm" path="confirm">Confirm Password</form:label>
											</div>
										</div>
										
										<div class="col-12">
											<div class="d-flex align-items-center justify-content-end">
												<button class="btn btn-primary" type="submit" value="Submit">Sign Up</button>
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
					
					<!-- Login -->
					<div class="col-12 col-lg-6">
						<div class="card mb-4">
							<div class="card-body">
								<h3 class="pt-2 pb-3">Login</h3>
								<form:form action="/login" method="POST" id="validateLogin" modelAttribute="newLogin">
									<div class="row mx-auto">
									
										<div class="col-12">
											<div class="form-floating mb-3">
												<form:input path="email" type="email" class="form-control requires-validation validate-login" name="email" id="email" />
												<div class="invalid-feedback"></div>
												<form:errors path="email" class="text-danger backend-validation" />
												<form:label for="email" path="email">Email</form:label>
											</div>
										</div>
										
										<div class="col-12">
											<div class="form-floating mb-3">
												<form:input path="password" type="password" class="form-control requires-validation validate-login" name="password" id="password" />
												<div class="invalid-feedback"></div>
												<form:errors path="password" class="text-danger backend-validation" />
												<form:label for="password" path="password">Password</form:label>
											</div>
										</div>
										
										<div class="col-12">
											<div class="d-flex align-items-center justify-content-end">
												<button class="btn btn-primary" type="submit" value="Submit">Sign in</button>
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateIndex.js"></script>
</body>
</html>