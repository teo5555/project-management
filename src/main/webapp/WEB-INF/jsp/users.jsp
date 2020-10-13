<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
<title>List Users</title>


</head>
<body>

	<div class="container">
		<div>
			<h2 class="text-center">User Manager</h2>
		</div>

		<input type="button" value="Add New User"
			onclick="window.location.href='new';return false;"
			class="btn btn-outline-primary" />


		<table class="table table-hover text-center">
			<thead class="thead-inverse">
				<tr>
					<th class="text-center">User name</th>
					<th class="text-center">Role</th>
					<th class="text-center">Actions</th>
				</tr>
			</thead>
			<tr>
				<!-- loop over print our customers -->
				<c:forEach var="tempUsers" items="${users}">

					<c:url var="updateLink" value="/showformForUpdate">
						<c:param name="userId" value="${tempUsers.id}" />
					</c:url>

					<c:url var="deleteLink" value="/delete">
						<c:param name="userId" value="${tempUsers.id}" />
					</c:url>

					<tr>
						<td>${tempUsers.userName}</td>
						<td>${tempUsers.roles}</td>
						<td>
							<!--  display update link --> <a href="${updateLink}"
							class="btn btn-warning">Update</a> <a href="${deleteLink}"
							class="btn btn-danger"
							onclick="if(!(confirm('are u sure want to delete this user?'))) return false">Delete</a>
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