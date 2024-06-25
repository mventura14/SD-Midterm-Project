<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/dashboard.css">

</head>
<body>

	<header></header>
	<jsp:include page="nav.jsp" />
	<main>

		<aside class="sidebar">
			<div class="sidebar-header sidebar-menu-item ">
				<div class="sidebar-ico img-cont">
					<img alt="" src="${loggedInUser.imageUrl}">
				</div>
				<p>${loggedInUser.firstName}${loggedInUser.lastName}</p>
			</div>

			<hr>
			<a href="profile">
				<div class="sidebar-menu-item">
					<div class="sidebar-ico bi bi-person-fill"></div>
					<p>Profile</p>
				</div>
			</a>
			<a href="#">
				<div class="sidebar-menu-item">
					<div class="sidebar-ico bi bi-people-fill"></div>
					<p>Users</p>
				</div>
			</a>

			<a href="#">
				<div class="sidebar-menu-item">
					<div class="sidebar-ico bi bi-car-front-fill"></div>
					<p>Ride-share</p>
				</div>
			</a>
			<a href="#">
				<div class="sidebar-menu-item">
					<div class="sidebar-ico bi bi-calendar2-event"></div>
					<p>Events</p>
				</div>
			</a>

			<label for="sidebar-collapse" class="sidebar-menu-item">
				<div class="sidebar-ico bi bi-arrows-collapse-vertical"></div>
				<p>Collapse</p>
			</label>

			<input type="checkbox" id="sidebar-collapse">
		</aside>

		<section id="wrapper"></section>





	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<footer></footer>

</body>
</html>