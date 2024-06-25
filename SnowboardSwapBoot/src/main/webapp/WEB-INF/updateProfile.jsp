<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Update Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" type="text/css" href="css/updateProfile.css">



</head>
<body>
	<header></header>

	<jsp:include page="nav.jsp" />

	<main>
		<div class="form-cont mt-5">
			<h2>Update Profile</h2>
			<form action="updateProfile" method="post">

				<!-- Hidden field for user ID -->
				<input type="hidden" name="userId" value="${user.id}">
				<!-- Hidden field for address ID -->
				<input type="hidden" name="addressId" value="${user.address.id}">

				<div class="form-floating mb-3">

					<input type="text" class="form-control" id="username"
						placeholder="" name="username" value="${user.username}" required>
					<label for="username">Username</label>
				</div>

				<div class="form-floating">

					<input type="text" class="form-control" id="password"
						placeholder="" name="password" value="${user.password}">
					<label for="password">Password</label>
				</div>

				<div class="input-group">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="firstName"
							placeholder="" name="firstName" value="${user.firstName}"
							required>
						<label for="firstName">First Name</label>
					</div>
					<div class="form-floating mb-3">

						<input type="text" class="form-control" id="lastName"
							name="lastName" value="${user.lastName}" required placeholder="">
						<label for="lastName">Last Name</label>
					</div>
				</div>
				
				<div class="form-floating mb-3">

					<textarea class="form-control" id="bio" name="bio" rows="3" style="height: 150px;"
						placeholder="">${user.bio}</textarea>
					<label for="bio">Bio</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="imageUrl"
						placeholder="" name="imageUrl" value="${user.imageUrl}">
					<label for="imageUrl">Profile Image</label>
				</div>

				<!-- Address fields -->
				<div class="form-floating">

					<input type="text" class="form-control" id="street" name="street"
						placeholder="" value="${user.address.street}">
					<label for="street">Street</label>
				</div>

				<div class="input-group">
					<div class="form-floating">
						<input type="text" class="form-control" id="city" name="city"
							placeholder="" value="${user.address.city}">
						<label for="city">City</label>
					</div>

					<div class="form-floating">
						<input type="text" class="form-control" id="state" name="state"
							placeholder="" value="${user.address.state}">
						<label for="state">State</label>
					</div>

					<div class="form-floating">
						<input type="text" class="form-control" id="postalCode"
							placeholder="" name="postalCode"
							value="${user.address.postalCode}">
						<label for="postalCode">Postal Code</label>
					</div>
				</div>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="phoneNumber"
						placeholder="" name="phoneNumber"
						value="${user.address.phoneNumber}">
					<label for="phoneNumber">Phone Number</label>
				</div>
				<!-- Add more fields as needed -->

				<!-- Cancel/Update Button -->
				<div class="button-cont">
				
				<button type="submit" class="btn btn-primary" data-toggle="tooltip"
					title="Update Profile">Confirm Edit</button>
				
				<a href="profile" class="btn btn-secondary" data-toggle="tooltip"
					title="Cancel and return to the profile page">Cancel</a>
				
				</div>
				
				
			</form>
		</div>
	</main>
	<footer></footer>
	<!-- Bootstrap JS, Popper.js, and jQuery for tooltips -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
