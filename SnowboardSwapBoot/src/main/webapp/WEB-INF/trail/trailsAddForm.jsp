<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<div class="offcanvas offcanvas-start" data-bs-scroll="true"
	tabindex="-1" id="addTrailForm"
	aria-labelledby="offcanvasWithBothOptionsLabel">

	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">

			Add Trail</h5>

		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>

	<div class="offcanvas-body">
		<form action="addTrail" method="post">
			<input type="hidden" name="resortId" value="${resort.id}">

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="trailName"
					placeholder="Name" name="name">
				<label for="trailName">Trail Name</label>
			</div>

			<div class="form-floating">
				<select class="form-select" id="difficulty"
					aria-label="Trail difficulty" name="difficulty">
					<option selected value="Easiest">Easiest</option>
					<option value="More Difficult">More Difficult</option>
					<option value="Most Difficult">Most Difficult</option>
					<option value="Extreme">Extreme</option>
					<option value="Extreme Terrain">Most Difficult</option>
				</select>
				<label for="floatingSelect">Difficulty</label>
			</div>
	</div>

	<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>