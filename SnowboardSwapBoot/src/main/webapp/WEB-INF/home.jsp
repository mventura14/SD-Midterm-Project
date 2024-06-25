<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Powder Pals</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/home.css">

</head>
<style>
body {
	background-image:
		url('https://images.pexels.com/photos/3737419/pexels-photo-3737419.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
<body>
	<jsp:include page="nav.jsp" />

	<br>
	<br>
	<div class="shadow-lg p-3 mb-5 bg-white rounded">
		<h1 align="center">Welcome to Powder Pals</h1>
		<h6 align="center">A place for snowboarders to connect</h6>
	</div>

	<div class="div1">
		<blockquote>Powder Pals is a social media platform for
			hosting and organizing events, activities,</blockquote>
		<blockquote>gatherings and rides to and from mountain
			resorts for snowboarding enthusiasts across the US.</blockquote>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>