<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/resortInf.css">

</head>


<body>

	<header></header>
	<jsp:include page="nav.jsp" />
	<main>

		<c:if test="${sessionScope.loggedInUser ne null && sessionScope.loggedInUser.role eq 'standard'}">
			
				
				
				<i class="bi bi-pencil btn btn-primary btn-i"
				data-bs-toggle="offcanvas" data-bs-target="#addResortForm"
				aria-controls="offcanvasWithBothOptions"></i>
		</c:if>

		<div class="wrapper">
			<div class="info mb-2">
				<div>
					<div class="img-container">
						<img alt="${resort.name}" src="${resort.imageUrl}">
					</div>
				</div>
				<div>
					<h3>${resort.name}</h3>
					<p class="description mb-auto">${resort.description}</p>
					<a href="${resort.website}" class="btn btn-primary col-12"
						target="_blank">Visit Website</a>
				</div>
			</div>
			<div class="contact ms-auto">
				<div class="mb-2">
					<p class="heding-minor mb-2">Address:</p>
					<p class="mb-1">${resort.address.street}</p>
					<p>${resort.address.city},${resort.address.state}
						${resort.address.postalCode}</p>
					<a
						href="https://www.google.com/maps/search/?api=1&query=${resort.getMapURL()}"
						class="btn btn-primary col-12" target="_blank">Map</a>
				</div>
				<div class="row">
					<p class="col-auto">
						<strong>Phone: </strong>${resort.address.phoneNumber}</p>
				</div>

			</div>

			<div class="trail-lift">
				<div class="trail-cont">
					<h4>
						Trails
						<c:if test="${sessionScope.loggedInUser ne null && sessionScope.loggedInUser.role eq 'standard'}">
							<i class="bi bi-plus-circle btn btn-primary btn-i"
								data-bs-toggle="offcanvas" data-bs-target="#addTrailForm"
								aria-controls="addTrailForm"></i>
						</c:if>
					</h4>

					<c:forEach var="trail" items="${resort.trails}">

						<div class="trail">
							<h6>${trail.name}</h5>
							<p>${trail.difficulty}</p>


							<c:if test="${sessionScope.loggedInUser ne null && sessionScope.loggedInUser.role eq 'standard'}">
								<i class="bi bi-pencil btn btn-primary btn-i"
									data-bs-toggle="offcanvas"
									data-bs-target="#editTrailForm${trail.id}" aria-controls=""></i>


								<div class="offcanvas offcanvas-start" data-bs-scroll="true"
									tabindex="-1" id="editTrailForm${trail.id}" aria-labelledby="">

									<div class="offcanvas-header">
										<h5 class="offcanvas-title" id="">Edit</h5>

										<button type="button" class="btn-close"
											data-bs-dismiss="offcanvas" aria-label="Close"></button>
									</div>

									<div class="offcanvas-body">
										<form action="editTrail" method="post">
											<%-- <input type="hidden" name="resortId" value="${resort.id}"> --%>
											<input type="hidden" name="id" value="${trail.id}">

											<div class="form-floating mb-3">
												<input type="text" class="form-control" id="trailName"
													placeholder="Name" name="name" value="${trail.name}">
												<label for="trailName">Trail Name</label>
											</div>

											<div class="form-floating">
												<select class="form-select" id="difficulty"
													aria-label="Trail difficulty" name="difficulty">

													<option
														<c:if test="${trail.difficulty eq Easiest }">
											 selected 
										</c:if>
														value="Easiest">Easiest</option>

													<option
														<c:if test="${trail.difficulty eq 'More Difficult'}">
											selected 
										</c:if>
														value="More Difficult">More Difficult</option>



													<option
														<c:if test="${trail.difficulty eq 'Most Difficult'}">
											selected 
										</c:if>
														value="Most Difficult">Most Difficult</option>



													<option
														<c:if test="${trail.difficulty eq 'Extreme'}">
											selected 
										</c:if>
														value="Extreme">Extreme</option>


													<option
														<c:if test="${trail.name eq 'Extreme Terrain'}">
											selected 
										</c:if>
														value="Extreme Terrain">Extreme Terrain</option>

												</select>
												<label for="floatingSelect">Difficulty</label>
											</div>
									</div>

									<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>

							</c:if>
						</div>
					</c:forEach>




				</div>
				<div class="lift-cont">
					<h4>
						Lifts
						<c:if test="${sessionScope.loggedInUser ne null && sessionScope.loggedInUser.role eq 'standard'}">
							<i class="bi bi-plus-circle btn btn-primary btn-i"
								data-bs-toggle="offcanvas" data-bs-target="#addLiftForm"
								aria-controls="addLiftForm"></i>
						</c:if>
					</h4>

					<c:forEach var="lift" items="${resort.lifts}">

						<div class="lift">
							<h6>${lift.name}</h5>
							<p>${lift.liftType.type}</p>

							<c:if test="${sessionScope.loggedInUser ne null && sessionScope.loggedInUser.role eq 'standard'}">
								<i class="bi bi-pencil btn btn-primary btn-i" data-bs-toggle="offcanvas"
									data-bs-target="#editLiftForm${lift.id}" aria-controls=""></i>
							</c:if>
						</div>
						<c:if test="${sessionScope.loggedInUser ne null }">
							<div class="offcanvas offcanvas-start" data-bs-scroll="true"
								tabindex="-1" id="editLiftForm${lift.id}" aria-labelledby="">

								<div class="offcanvas-header">
									<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">

										Edit Lift</h5>

									<button type="button" class="btn-close"
										data-bs-dismiss="offcanvas" aria-label="Close"></button>
								</div>

								<div class="offcanvas-body">

									<form action="editLift" method="post">
										<input type="hidden" name="id" value="${lift.id}">

										<div class="form-floating mb-3">
											<input type="text" class="form-control" id="liftName"
												placeholder="Name" name="name" value="${lift.name}">
											<label for="liftName">Lift Name</label>
										</div>

										<div class="form-floating">
											<select class="form-select" id="liftType" aria-label=""
												name="liftTypeId">
												<c:forEach var="type" items="${liftTypes}">
													<option
														<c:if test="${lift.liftType.type eq type.type}">selected</c:if>
														value="${type.id}">${type.type}</option>
												</c:forEach>
											</select>
											<label for="liftType">Type</label>
										</div>

										<button type="submit" class="btn btn-primary">Submit</button>
									</form>


								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>

		<c:if test="${sessionScope.loggedInUser ne null && sessionScope.loggedInUser.role eq 'standard'}">
			<jsp:include page="trail/trailsAddForm.jsp" />
			<jsp:include page="lift/addLiftForm.jsp" />
			<jsp:include page="resort/resortEditForm.jsp" />
		</c:if>


	</main>
	<footer></footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>