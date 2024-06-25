<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Add New Event</title>
<!-- Bootstrap CSS for consistency with other pages -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/addevent.css">

</head>
<body>

	<jsp:include page="nav.jsp" />
	<main>
		<div class="container mt-5">
			<h2 class="display-4 text-center mb-4">Add New Event</h2>

			<!-- Display error messages if present -->
			<c:if test="${not empty error}">
				<div class="alert alert-danger">
					<strong>Error:</strong> ${error}
				</div>
			</c:if>

			<form action="addEvent" method="post">

				<!-- User id -->
				<input type="hidden" name="userId" value="${userId}">


				<!-- Event Name -->
				<div class="form-group">
					<label for="name">Event Name</label>
					<input type="text" class="form-control" id="name" name="name"
						placeholder="Enter event name" required>
				</div>

				<!-- Description -->
				<div class="form-group">
					<label for="description">Description</label>
					<textarea class="form-control" id="description" name="description"
						placeholder="Describe the event" required></textarea>
				</div>

				<!-- Dropdown for selecting event type -->
				<!-- Event Type -->
				<div class="form-group">
					<label for="eventTypeId">Event Type</label>
					<select name="eventTypeId" class="form-control" required>
						<c:forEach items="${eventTypes}" var="type">
							<option value="${type.id}">${type.type}</option>
						</c:forEach>
					</select>
				</div>

				<!-- Event Start Date/Time -->
				<div class="form-group">
					<label for="eventStart">Event Start Date and Time:</label>
					<input type="datetime-local" class="form-control" id="eventStart"
						name="eventStart" required>
				</div>

				<!-- Event End Date/Time -->
				<div class="form-group">
					<label for="eventEnd">Event End Date and Time:</label>
					<input type="datetime-local" class="form-control" id="eventEnd"
						name="eventEnd" required>
				</div>

				<!-- Address Details -->
				<div class="form-group">
					<label for="street">Street</label>
					<input type="text" class="form-control" id="street" name="street"
						placeholder="Street address" required>
				</div>
				<div class="form-group">
					<label for="city">City</label>
					<input type="text" class="form-control" id="city" name="city"
						placeholder="City" required>
				</div>
				<div class="form-group">
					<label for="state">State</label>
					<input type="text" class="form-control" id="state" name="state"
						placeholder="State" required>
				</div>
				<div class="form-group">
					<label for="postalCode">Postal Code</label>
					<input type="text" class="form-control" id="postalCode"
						name="postalCode" placeholder="Postal code">
				</div>
				<div class="form-group">
					<label for="phoneNumber">Phone Number</label>
					<input type="text" class="form-control" id="phoneNumber"
						name="phoneNumber" placeholder="Phone number">
				</div>
				<!--   Submit button -->
				<button type="submit" class="btn btn-primary" data-toggle="tooltip"
					title="Click to add the Event">Add Event</button>
			</form>
		</div>

		<!--         Cancel/Add Button -->
		<!--         <div class="text-center"> -->
		<!--         <a href="home.do" class="btn btn-secondary" data-toggle="tooltip" title="Cancel and return to the homepage">Cancel</a> -->

	</main>


	<!-- Bootstrap JS, Popper.js, and jQuery for tooltips -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script> $(function () {$('[data-toggle="tooltip"]').tooltip(); // Initialize tooltips});</script>
	
	
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</body>
</html>