<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/eventDetail.css">
</head>

<body
	style="background-image: url('https://images.pexels.com/photos/3737419/pexels-photo-3737419.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">

	<jsp:include page="nav.jsp" />

	<main class="mt-5">
		<div class="container">
			<c:if test="${not empty event}">
				<div class="card">

					<c:if test="${not empty event.imageUrl}">
						<img src="${event.imageUrl}" class="card-img-top"
							alt="${event.name} Image">
					</c:if>

					<div class="card-body">
						<h1 class="card-title text-center">${event.name}Details</h1>
						<p>
							<strong>Event ID:</strong> ${event.id}
						</p>

						<div>
							<c:if test="${not empty event.description}">
								<strong>Description:</strong> ${event.description}
          </c:if>
						</div>

						<div>
							<c:if test="${not empty event.eventType}">
								<p>
									<strong>Event Type:</strong> ${event.eventType.type}
								</p>
							</c:if>
						</div>

						<!-- Display formatted event start and end dates, using parse and format -->
						<c:if test="${not empty event.eventStart}">
							<fmt:parseDate value="${event.eventStart}"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both" />
							<div>
								<strong>Start:</strong>
								<fmt:formatDate value="${parsedStart}"
									pattern="MMMM d, yyyy 'at' h:mm a" />
							</div>
						</c:if>

						<c:if test="${not empty event.eventEnd}">
							<fmt:parseDate value="${event.eventEnd}"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedEnd" type="both" />
							<div>
								<strong>End:</strong>
								<fmt:formatDate value="${parsedEnd}"
									pattern="MMMM d, yyyy 'at' h:mm a" />
							</div>
							<br>
						</c:if>

						<div>
							<c:if test="${sessionScope.loggedInUser ne null}">
								<c:if test="${not empty event.locationDescription}">
									<strong>Location Description:</strong> ${event.locationDescription}
  					</c:if>

								<c:if test="${not empty event.address}">
									<p>
										<strong>Address:</strong>
										<c:out value="${event.address.street}" />
										,
										<c:out value="${event.address.city}" />
										,
										<c:out value="${event.address.state}" />
										<c:out value="${event.address.postalCode}" />
									</p>
								</c:if>
							</c:if>
						</div>

						<!-- Display formatted event create and update dates, using parse and format -->
						<c:if test="${sessionScope.loggedInUser ne null}">
							<c:if test="${not empty event.createdAt}">
								<fmt:parseDate value="${event.createdAt}"
									pattern="yyyy-MM-dd'T'HH:mm" var="parsedCreate" type="both" />
								<div>
									<strong>Created at:</strong>
									<fmt:formatDate value="${parsedCreate}"
										pattern="MMMM d, yyyy 'at' h:mm a" />
								</div>
							</c:if>

							<!-- Display formatted update date, using parse and format -->
							<c:if test="${not empty event.updatedAt}">
								<fmt:parseDate value="${event.updatedAt}"
									pattern="yyyy-MM-dd'T'HH:mm" var="parsedUpdated" type="both" />
								<div>
									<strong>Updated at:</strong>
									<fmt:formatDate value="${parsedUpdated}"
										pattern="MMMM d, yyyy 'at' h:mm a" />
								</div>
							</c:if>
						</c:if>

<!-- 						<div> -->
<%-- 							<strong>Active:</strong> ${event.active ? 'Yes' : 'No'} --%>
<!-- 						</div> -->

						<!-- only logged in user should be able to view list of attendees -->

						<c:if test="${sessionScope.loggedInUser ne null}">
   						 <c:if test="${not empty event.eventAttendees}">
        						<strong>Attendees:</strong>
        						<ul>
            						<c:forEach items="${event.eventAttendees}" var="attendee">
               						 <li>${attendee.firstName} ${attendee.lastName}</li>
           						 </c:forEach>
        						</ul>
    						</c:if>
						</c:if>

					</div>
				</div>

				<!-- Update, Delete, and Return Links -->

				<div class="text-center mt-4">
					<c:if
						test="${sessionScope.loggedInUser ne null && loggedInUser.id eq event.sponsor.id}">

						<a href="updateEvent?eventId=${event.id}" class="btn btn-primary">Update
							Event</a>
					</c:if>

					<a href="event" class="btn btn-secondary">Return to List</a>

					<c:if
						test="${sessionScope.loggedInUser ne null && loggedInUser.id eq event.sponsor.id}">
						<form action="deleteEvent" method="post"
							onsubmit="return confirm('Are you sure you want to delete this event?');"
							style="display: inline-block;">
							<input type="hidden" name="eventId" value="${event.id}">
							<input type="submit" value="Delete Event" class="btn btn-danger">
						</form>
					</c:if>
				</div>
			</c:if>


		</div>
	</main>

	<footer></footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>