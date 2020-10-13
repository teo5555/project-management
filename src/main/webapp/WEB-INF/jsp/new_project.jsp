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
			<h2>Project Manager</h2>
		</div>
		<div>
			<h3>Save Project</h3>

			<form:form action="saveProject" modelAttribute="project"
				method="POST">

				<!--  need to associate this data with project id -->
				<form:hidden path="id" />

				<table>
					<tbody>
						<tr>
							<td><label>Title:</label></td>
							<td><form:input path="title" required="required" /></td>
						</tr>

						<tr>
							<td><label>Description:</label></td>
							<td><form:input path="description" required="required" /></td>
						<tr>
						<tr>
							<td><label>Start Date:</label></td>
							<td><form:input type="date" path="start_date"
									pattern="yyyy-MM-dd" required="required" /></td>
						<tr>

							<td><label>End Date:</label></td>
							<td><form:input type="date" path="end_date"
									pattern="yyyy-MM-dd" required="required" /></td>
						<tr>

						</tr>

						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Save" /></td>
						</tr>

					</tbody>
				</table>

			</form:form>
			<p>
				<a href="${pageContext.request.contextPath}
			/">Back</a>
			</p>

		</div>
	</div>
</body>

</html>