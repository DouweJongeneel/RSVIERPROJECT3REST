<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Opdracht 3</title>

</head>

<body>
	<form>
		<input id="geocomplete" type="text" placeholder="Type in an address" size="90" />
		<input id="find" type="button" value="find" />
	</form>

	<fieldset class="addressDetails">
		<h3> Address Gegevens </h3>

		<label>Straat</label>
		<input name="route" type="text" value="">

		<label>Huisnummer</label>
		<input name="street_number" type="text" value="">

		<label>Postcode</label>
		<input name="postal_code" type="text" value="">

		<label>Plaats</label>
		<input name="locality" type="text" value="">

		<label>Land</label>
		<input name="country" type="text" value="">
	</fieldset>

	<div class="googleMap"></div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB84u4zTerVZY0WpOBy9sHOyjeabakljhM&libraries=places"></script>

	<script src="${pageContext.request.contextPath}/js/geocomplete/jquery.geocomplete.js"></script>

	<script>
		$(function(){

			$("#geocomplete").geocomplete({
				map: ".googleMap",
				location: "Groningen",
				details: ".addressDetails",
				types: ["geocode", "establishment"],
			});


			$("#find").click(function(){
				$("#geocomplete").trigger("geocode");
			});

		});
	</script>
</body>

</html>