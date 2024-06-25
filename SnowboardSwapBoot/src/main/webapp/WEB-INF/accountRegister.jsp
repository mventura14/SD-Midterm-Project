<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Registration</title>

<!--     Bootstrap CSS -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/register.css">

</head>

<body style="background-image: url('https://images.pexels.com/photos/3737419/pexels-photo-3737419.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
<body>
	<header></header>
	<jsp:include page="nav.jsp" />
	<main>


		<div class="container">

			<div class="form-container">
				<h2>New Account Registration</h2>
				<form class="form-register" action="register.do" method="post">

					<div class="input-group mb-3">
						<div class="form-floating">
							<input type="text" class="form-control" id="firstName" name="firstName" placeholder="" required autofocus
							data-bs-toggle="tooltip" data-bs-placement="top" title="This field is required.">
							<label for="firstName">First Name</label>
						</div>

						<div class="form-floating">
							<input type="text" class="form-control" id="lastName"
								name="lastName" placeholder="" required autofocus data-bs-toggle="tooltip" data-bs-placement="top" title="This field is required.">
							<label for="lastName">Last Name</label>
						</div>
					</div>


					<div class="form-floating">
						<input type="text" class="form-control" id="username"
							name="username" placeholder="" required autofocus data-bs-toggle="tooltip" data-bs-placement="top" title="Choose a username. This field is required.">
						<label for="username">Username</label>
					</div>

					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="" required autofocus data-bs-toggle="tooltip" data-bs-placement="top" title="This field is required.">
						<label for="password">Password</label>
					</div>
					
					<div class="form-floating">
						<textarea class="form-control" id="bio" name="bio" placeholder="About Me" style="height: 100px;"></textarea>
						<label for="bio">About Me</label>
					</div>
					
					<div class="form-floating mb-3">
						<input type="text" placeholder="" class="form-control" id="imageUrl" name="imageUrl" autofocus>
						<label for="imageUrl">Profile Image URL</label>
					</div>


					<div class="form-floating">
						<input type="text" placeholder="" class="form-control" id="street" name="street" autofocus>
						<label for="street">Street</label>
					</div>
					
					<div class="form-floating mb-3">
						<input type="text" placeholder="" class="form-control" id="city" name="city" autofocus>
						<label for="city">City</label>
					</div>
					
					<div class="form-floating">
						<input type="text" placeholder="" class="form-control" id="state" name="state" autofocus>
						<label for="state">State</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" placeholder="" class="form-control" id="postalCode" name="postalCode" autofocus>
						<label for="postalCode">Postal Code</label>
					</div>

					<button type="submit" class="btn btn-primary col-12">Register/Submit</button>
				</form>
			</div>
		</div>

	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		
<script>
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
</script>
</body>
</html>