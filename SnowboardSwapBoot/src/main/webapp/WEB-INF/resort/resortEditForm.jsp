<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>



<div class="offcanvas offcanvas-start" data-bs-scroll="true"
	tabindex="-1" id="addResortForm"
	aria-labelledby="offcanvasWithBothOptionsLabel">

	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">

			Edit Resort</h5>

		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>

	<div class="offcanvas-body">
		<form action="editResort" method="post">
			<input type="hidden" name="id" value="${resort.id}">
			<input type="hidden" name="addressId" value="${resort.address.id}">

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="resortName"
					placeholder="Name" name="name" value="${resort.name}">
				<label for="resortName">Resort Name</label>
			</div>
			
			<div class="form-floating mb-3">
				<input type="url" class="form-control" id="resortimg"
					placeholder="Name" name="imageUrl" value="${resort.imageUrl}">
				<label for="resortimg">Image URL</label>
			</div>

			<div class="form-floating mb-3">
				<input type="url" class="form-control" id="website"
					placeholder="Website" name="website" value="${resort.website}">
				<label for="website">Website</label>
			</div>
			
			<div class="form-floating mb-3">
				<textarea rows="50" cols="30" class="form-control" style="height: 200px;"
					id="resortDescription" placeholder="" name="description">${resort.description}</textarea>
				<label for="resortDescription">Description</label>
			</div>


			<div class="form-floating">
				<input type="text" class="form-control" id="resortStreet"
					placeholder="Street" name="street" value="${resort.address.street}">
				<label for="resortStreet">Street Address</label>
			</div>
			
			<div class="input-group">
			
				<div class="form-floating">
					<input type="text" class="form-control" id="resortCity"
						placeholder="City" name="city" value="${resort.address.city}">
					<label for="resortCity">City</label>
				</div>
				
				<div class="form-floating">
					<input type="text" class="form-control" id="resortState"
						placeholder="State" name="state" value="${resort.address.state}">
					<label for="resortState">State</label>
				</div>
				
				<div class="form-floating">
					<input type="number" class="form-control" id="resortPostal"
						placeholder="Postal Code" name="postalCode"
						value="${resort.address.postalCode}">
					<label for="resortPostal">Postal Code</label>
					
				</div>
				
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="resortPhone"
					placeholder="Phone Number" name="phoneNumber"
					value="${resort.address.phoneNumber}">
				<label for="resortPhone">Phone Number</label>
			</div>
	</div>


	<button type="submit" class="btn btn-primary">Submit</button>

	</form>
</div>