<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Log In</title>
<!-- Bootstrap CSS -->


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/login.css">

</head>
<body>
	<header></header>

	<jsp:include page="nav.jsp" />
	<main>
		<div class="container">
			<form class="form-signin" action="login.do" method="post">
				<h2 class="form-signin-heading">Sign In</h2>

				<%-- Display error message if present --%>
				<c:if test="${not empty errorMessage}">
					<div class="alert alert-danger" role="alert">
						<c:out value="${errorMessage}" />
					</div>
				</c:if>

				<div class="form-floating mb-3">
					<input type="text" id="inputUsername" class="form-control"
						placeholder="Username" name="userName" required autofocus value="admin">

					<label for="inputUsername">Username</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" id="inputPassword" class="form-control"
						placeholder="Password" name="password" required value="sspass">
					<label for="inputPassword">Password</label>
				</div>

				<button class="btn btn-lg btn-primary btn-block col-12" type="submit">Sign
					in</button>
			</form>
		</div>
	</main>
	<footer></footer>
	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>