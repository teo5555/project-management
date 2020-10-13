<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

<title>List Projects</title>


</head>
<body>

	<div class="container">
		<div>
			<h2 class="text-center">Project Manager</h2>
		</div>

		<div>
			<h3 class="text-center">Project List</h3>
		</div>
		<input type="button" value="Add New Project"
			onclick="window.location.href='newProject';return false;"
			class="btn btn-outline-primary" />

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

				<c:url var="updateLink" value="/showProjectUpdate">
					<c:param name="projectId" value="${tempProjects.id}" />
				</c:url>

				<c:url var="deleteLink" value="/deleteProject">
					<c:param name="projectId" value="${tempProjects.id}" />
				</c:url>

				<c:url var="addUserLink" value="/showAddProjectUser">
					<c:param name="projectId" value="${tempProjects.id}" />
				</c:url>

				<tr>
					<td>${tempProjects.title}</td>
					<td>${tempProjects.description}</td>
					<td>${tempProjects.start_date}</td>
					<td>${tempProjects.end_date}</td>
					<td><a href="${updateLink}" class="btn btn-warning">Update
							Project</a> <a href="${deleteLink}" class="btn btn-danger"
						onclick="if(!(confirm('are u sure want to delete this project?'))) return false">Delete
							Project</a> <a href="${addUserLink}" class="btn btn-primary">Assign
							User To Project</a></td>
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