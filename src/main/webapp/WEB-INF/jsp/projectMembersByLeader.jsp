<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
			<h2 class="text-center">Task Manager</h2>
		</div>

		<table class="table table-hover text-center table-striped">
			<thead class="thead-inverse">
				<tr>
					<th class="text-center">User Name</th>
					<th class="text-center">User Role</th>
					<th class="text-center">User Id</th>
					<th class="text-center">Project Id</th>
					<th class="text-center">Project Title</th>
					<th class="text-center">Action</th>

				</tr>
			<thead>

				<c:forEach var="tempUsers" items="${projectUserByLeader}">

					<c:url var="deleteLink" value="/deleteProjectUserByLeader">
						<c:param name="userId" value="${tempUsers.userId}" />
						<c:param name="projectId" value="${tempUsers.projectId}" />
					</c:url>

					<c:url var="assginTask" value="/showAddProjectTask">
						<c:param name="userId" value="${tempUsers.userId}" />
						<c:param name="projectId" value="${tempUsers.projectId}" />
					</c:url>


					<tr>

						<td>${tempUsers.userName}</td>
						<td>${tempUsers.roles}</td>
						<td>${tempUsers.userId}</td>
						<td>${tempUsers.projectId}</td>
						<td>${tempUsers.title}</td>

						<td>
						<a href="${deleteLink}" class="btn btn-danger"
				onclick="if(!(confirm('are u sure want to remove the User from Project?'))) return false">Remove User from Project</a> 
						
						<a href="${assginTask}"class="btn btn-success">Assign Task to Project</a>
							
						</td>


					</tr>
				</c:forEach>
		</table>
		<p>
			<a href="${pageContext.request.contextPath}
						/">Back</a>
		</p>
	</div>
</body>
</html>