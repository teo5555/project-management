<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
	
	<style>
	 .green{color: green}
	 .red{color: red}
	 .blue{color: blue}
	</style>

<meta charset="ISO-8859-1">
<title>List of Tasks</title>
</head>
<body>
	<div class="container">
		<div>
			<h2 class="text-center">Tasks List For Member</h2>
		</div>

		<table class="table table-hover text-center table-striped">
			<thead class="thead-inverse">
				<tr>
					<th class="text-center">User Id</th>
					<th class="text-center">User Name</th>
					<th class="text-center">Task Title</th>
				</tr>
			</thead>
			<tr>
				<!-- loop over print our customers -->
				<c:forEach var="tempTasks" items="${tasks}">

					<tr>
						<td>${tempTasks.user.id}</td>
						<td>${tempTasks.user.userName}</td>
						<td>${tempTasks.task.title}</td>
					</tr>
				</c:forEach>
			<tr>
				<td><a href="${pageContext.request.contextPath}/"
					class="btn btn-outline-dark" role="button" aria-pressed="true">Back</a></td>
			</tr>
		</table>
	</div>
</body>
</html>