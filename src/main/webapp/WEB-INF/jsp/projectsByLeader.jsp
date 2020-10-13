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

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div>
			<h2 class="text-center">Project Manager</h2>
		</div>

		<table class="table table-hover text-center table-striped">
			<thead class="thead-inverse">
				<tr>
					<th class="text-center">Title</th>
					<th class="text-center">Description</th>
					<th class="text-center">Start Date</th>
					<th class="text-center">End Date</th>
					<th class="text-center">Actions</th>
				</tr>
			</thead>

			<c:forEach var="tempProjects" items="${projects}">


				<c:url var="addUserLink" value="/showAddProjectUserByLeader">
					<c:param name="userId" value="${tempUsers.userId}" />
					<c:param name="projectId" value="${tempProjects.id}" />
				</c:url>

				<tr>
					<td>${tempProjects.title}</td>
					<td>${tempProjects.description}</td>
					<td>${tempProjects.start_date}</td>
					<td>${tempProjects.end_date}</td>
					<td><a href="${addUserLink}" class="btn btn-primary">Add
							Member To Project</a></td>


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