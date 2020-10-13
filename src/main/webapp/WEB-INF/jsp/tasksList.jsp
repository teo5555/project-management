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
			<h2 class="text-center">Tasks</h2>
		</div>

		<table class="table table-hover text-center table-striped">
			<thead class="thead-inverse">
				<tr>
					<th class="text-center">Task Title</th>
					<th class="text-center">Description</th>
					<th class="text-center">Deadline</th>
					<th class="text-center">State</th>	
				</tr>
			</thead>
			<tr>
				<!-- loop over print our customers -->
				<c:forEach var="tempTasks" items="${tasks}">

					<tr>
						<td>${tempTasks.title}</td>
						<td>${tempTasks.description}</td>
						<td>${tempTasks.deadline}</td>
						<td class="${tempTasks.state == 'DONE' ? 'green' : ''} 
							${tempTasks.state == 'WORKING ON IT' ? 'blue' : ''} 
							${tempTasks.state == 'STUCK' ? 'red' : ''}">${tempTasks.state}</td>
						<td>
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