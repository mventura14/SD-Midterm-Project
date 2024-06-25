<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Powder Pals</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ms-auto">

				<li class="nav-item ">
					<a class="nav-link" aria-current="page" href="home.do">Home</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="resorts">Resorts</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="rideshare">Ride Share</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="event">Event/Meetups</a>
				</li>
				
				<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" role="button"	data-bs-toggle="dropdown" aria-expanded="false"> 
						<i class="bi bi-person-circle"></i>
					</a>
						
					<ul class="dropdown-menu dropdown-menu-end" >	
						<c:if test="${sessionScope.loggedInUser ne null }">
							<a class="dropdown-item" href="profile">Account</a>
							<a class="dropdown-item" href="logout.do">Logout</a>
						</c:if>

						<c:if test="${sessionScope.loggedInUser eq null}">
							<a class="dropdown-item" href="register">Register</a>
							<a class="dropdown-item" href="login">Login</a>
						</c:if>

					</ul>
					</li>
			</ul>
		</div>
	</div>
</nav>



<!-- Check if a user is logged in -->

<%-- <c:choose> --%>
<%-- <c:when test="${empty sessionScope.loggedInUser}"></c:when> --%>
<%-- </c:choose>  --%>
