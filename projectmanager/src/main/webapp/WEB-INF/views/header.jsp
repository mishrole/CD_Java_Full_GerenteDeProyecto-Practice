<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

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