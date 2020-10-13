<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

<title>Save Customer</title>
</head>
<body>

	<div class="container">
		<div>
			<h2>User Relationship Manager</h2>
		</div>
		<div>
			<div>
				<h3>Save User</h3>

				<form:form action="save" modelAttribute="user" method="POST">

					<!--  need to associate this data with customer id -->
					<form:hidden path="id" />

					<table>
						<tbody>
							<tr>
								<td><label>User name:</label></td>
								<td><form:input path="userName" required="required" /></td>

							</tr>

							<tr>
								<td><label>Password:</label></td>
								<td><form:input path="password" required="required" /></td>
							<tr>
								<td><label>Role:</label></td>
								<td><form:select path="roles" required="required">
										<form:option value="ROLE_MEMBER" label="ROLE_MEMBER" />
										<form:option value="ROLE_ADMIN" label="ROLE_ADMIN" />
										<form:option value="ROLE_LEADER" label="ROLE_LEADER" />
									</form:select></td>
							</tr>

							<tr>
								<td><label></label></td>
								<td><input type="submit" value="Save"
									class="btn btn-primary" /></td>
							</tr>
							<tr>
								<td><a href="${pageContext.request.contextPath}/"
									class="btn btn-outline-dark" role="button" aria-pressed="true">Back</a></td>
							</tr>
						</tbody>
					</table>
				</form:form>
			</div>
		</div>
	</div>
</body>

</html>