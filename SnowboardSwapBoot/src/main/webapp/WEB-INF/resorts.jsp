<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resorts</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/resorts.css">

</head>
<body>

	<header> </header>
	<jsp:include page="nav.jsp" />

	<main>
		<c:if test="${sessionScope.loggedInUser ne null && sessionScope.loggedInUser.role eq 'standard'}">

			<i class="bi bi-plus-circle btn btn-primary btn-i" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#addResortForm"
				aria-controls="offcanvasWithBothOptions"></i>

			<jsp:include page="resort/resortAddForm.jsp" />

		</c:if>

		<div class="section">
			<div class="resortsContainer">
				<c:forEach var="resort" items="${resorts}">

					<div class="card resort-card" style="width: 18rem;">
						<div class="imgCont">
							<img src="${resort.imageUrl}" class="card-img-top" alt="...">
						</div>
						<div class="card-body">
							<h5 class="card-title">${resort.name}</h5>
							<p class="card-text limit-text">${resort.description}</p>
							<a href="resort?id=${resort.id}" class="btn btn-primary col-12">More
								Info</a>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>