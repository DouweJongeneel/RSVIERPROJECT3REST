<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Opdracht 3</title>
	<!-- jQuery -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/js/myJqueryFunctions.js"></script>

	<!-- DataTables-->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/jq-2.2.3/dt-1.10.12/r-2.1.0/datatables.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs/jq-2.2.3/dt-1.10.12/r-2.1.0/datatables.js"></script>

	<!-- BOOTSTRAP CSS -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- /BOOTSTRAP -->

	<!-- CSS aanpassingen -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css">


</head>

<body>

	<table id="userTable" class="display" width="100%" cellspacing="0">
		<thead>
		<tr>
			<th>voornaam</th>
			<th>tussenvoegsel</th>
			<th>achternaam</th>
			<th>telefoon</th>
			<th>email</th>
		</tr>
		</thead>
		<tbody>

		</tbody>
		<tfoot>
		<tr>
			<th>voornaam</th>
			<th>tussenvoegsel</th>
			<th>achternaam</th>
			<th>telefoon</th>
			<th>email</th>
		</tr>
		</tfoot>
	</table>

	<script>
		$(document).ready(function() {
			$('#userTable').DataTable();
		});
	</script>

</body>

</html>