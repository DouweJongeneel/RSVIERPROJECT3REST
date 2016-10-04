<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Opdracht 3</title>

<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
<script>
    var ctxPath = "<%=request.getContextPath() %>";
	$(function() {
		$("#postActivity").on("click", function() {
			$.ajax({
				url : ctxPath+"/resources/activity/postActivity",
				type : "POST",
				data : '{"name":"Beach volleyball", "price":"31.50"}',
				contentType : "application/json",
				cache : false,
				dataType : "json"
			});
		});
	});
</script>

</head>

<body>
	<h1>Test</h1>
	<ul>
		<li><a
			href="<%=request.getContextPath() %>/resources/activity/getAll"><%=request.getContextPath() %>/resources/activity/getAll</a></li>
		<li><button id="postActivity">Post Activity</button></li>
	</ul>

</body>

</html>