<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Events/Meetups List</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/event.css">

<!-- Favicon -->
<link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>"
	type="image/x-icon">

</head>

<style>
body {
 background-image:
  url('https://images.pexels.com/photos/3737419/pexels-photo-3737419.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
 background-repeat: no-repeat;
 background-attachment: fixed;
 background-size: cover;
}</style>

<jsp:include page="nav.jsp" />

<body>

	<main>

		<div class="container my-5">
			<h1 class="display-4 text-center mb-4">Events and Meet Ups</h1>

			<!-- List of Events -->
			<div class="row">
				<div class="col-md-12">
					<ul class="list-group">
						<c:forEach items="${allEvents}" var="event">
							<li class="list-group-item">
								
								<!-- 	not sure if we want displayed, but at least for testing -->
								<div>
									<strong>Event ID:</strong> ${event.id}
								</div>
								
								<c:if test="${not empty event.name}">
				                 	<div><strong>Name:</strong> <c:out value="${event.name}" /></div>
				                </c:if>
								
								<c:if test="${not empty event.eventType}">
                  					<div><strong>Type:</strong> <c:out value="${event.eventType.type}" /></div>
                				</c:if>	
                					
									
								<c:if test="${not empty event.description}">
					            	<div><strong>Description:</strong> <c:out value="${event.description}" /></div>
					            </c:if>				
									
								<!-- Display formatted event start and end dates, using parse and format -->
								<c:if test="${not empty event.eventStart}">
									<fmt:parseDate value="${event.eventStart}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStart" type="both" />
									<div>
										<strong>Start:</strong>
										<fmt:formatDate value="${parsedStart}" pattern="MMMM d, yyyy 'at' h:mm a" />
									</div>
								</c:if>

								<c:if test="${not empty event.eventEnd}">
									<fmt:parseDate value="${event.eventEnd}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEnd" type="both" />
									<div>
										<strong>End:</strong>
										<fmt:formatDate value="${parsedEnd}" pattern="MMMM d, yyyy 'at' h:mm a" />
									</div>
								</c:if>
								
								<div>
								<c:if test="${sessionScope.loggedInUser ne null}">
  								<c:if test="${not empty event.locationDescription}">
    								<strong>Location Description:</strong> ${event.locationDescription}
  								</c:if>
  								
  								<br>

  								<c:if test="${not empty event.address}">
   				 				<strong>Address:</strong> 
    								<c:out value="${event.address.street}" />, 
    								<c:out value="${event.address.city}" />, 
    								<c:out value="${event.address.state}" /> 
    								<c:out value="${event.address.postalCode}" />
  								</c:if>
								</c:if>
  								</div>

<%-- 								<c:if test="${not empty event.active}"> --%>
<%--                   					<div><strong>Active:</strong> ${event.active ? 'Yes' : 'No'} </div> --%>
<%--                 				</c:if> --%>

                				<c:if test="${not empty event.imageUrl}">
  									<div><img class="event-image" src="<c:out value="${event.imageUrl}"/>" alt="Event Image"></div>
								</c:if>

								<!-- Update and View Details buttons for each record -->
								
								

								<div class="mt-2">
								
<!-- 								old add event button -->
<%-- 									<c:if --%>
<%-- 										test="${sessionScope.loggedInUser ne null && loggedInUser.id eq event.sponsor.id}"> --%>
<%-- 										<a href="updateEvent?eventId=${event.id}" class="btn btn-primary btn-sm">Update</a> --%>
<%-- 									</c:if> --%>

									<a href="eventDetail?eventId=${event.id}" class="btn btn-secondary btn-sm">View Details</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<!-- Navigation Button to Add New Event -->
			<div class="text-center mt-4">
			<c:choose>
				<c:when test="${not empty sessionScope.loggedInUser}">
				<!-- User is logged in, show the button -->
				<a href="addEvent" class="btn btn-dark">Add New Event</a>
				</c:when>
				<c:otherwise>
				<!-- User is not logged in, show a button with a tooltip -->
			 	<a href="#" class="btn btn-outline-dark" data-toggle="tooltip" data-placement="top" title="You must be logged in to add an event">Add New Event</a>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
	</main>
	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip(); // Initialize tooltips
        });
    </script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>