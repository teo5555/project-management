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
.green {
	color: green
}

.red {
	color: red
}

.blue {
	color: blue
}
</style>


<meta charset="ISO-8859-1">
<title>List of Tasks</title>
</head>
<body>

	<div class="container">
		<div class="text-center">
			<h2>Task Manager</h2>
		</div>

		<input type="button" value="Add New Task"
			onclick="window.location.href='newTask';return false;"
			class="btn btn-outline-primary" />


		<table class="table table-hover text-center table-striped">
			<thead class="thead-inverse">
				<tr>
					<th class="text-center">Task Title</th>
					<th class="text-center">Description</th>
					<th class="text-center">Deadline</th>
					<th class="text-center">State</th>
					<th class="text-center">Actions</th>
				</tr>
			</thead>
			<tr>
				<!-- loop over print our customers -->
				<c:forEach var="tempTasks" items="${tasks}">

					<c:url var="updateLink" value="/showformForUpdateTask">
						<c:param name="taskId" value="${tempTasks.id}" />
					</c:url>

					<c:url var="deleteLink" value="/deleteTask">
						<c:param name="taskId" value="${tempTasks.id}" />
					</c:url>

					<tr>
						<td>${tempTasks.title}</td>
						<td>${tempTasks.description}</td>
						<td>${tempTasks.deadline}</td>
						<td
							class="${tempTasks.state == 'DONE' ? 'green' : ''} 
							${tempTasks.state == 'WORKING ON IT' ? 'blue' : ''} 
							${tempTasks.state == 'STUCK' ? 'red' : ''}">${tempTasks.state}</td>
						<td>
							<!--  display update link --> <a href="${updateLink}"
							class="btn btn-warning">Update</a> <a href="${deleteLink}"
							class="btn btn-danger"
							onclick="if(!(confirm('are u sure want to delete this task?'))) return false">Delete</a>
						</td>

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