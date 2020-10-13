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
<title>New Task</title>
</head>
<body>
	<div class="container">
		<div>
			<h2>Task Manager</h2>
		</div>
		<div>
			<form:form action="saveTask" modelAttribute="task" method="POST">
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
						</tr>

						<tr>
							<td><label>State:</label></td>
							<td><form:select path="state" required="required">
									<form:option value="NONE" label="--- Select ---" />
									<form:option value="WORKING ON IT" label="WORKING ON IT" />
									<form:option value="STUCK" label="STUCK" />
									<form:option value="DONE" label="DONE" />
								</form:select></td>
						<tr>
							<td><label>Deadline:</label></td>
							<td><form:input type="date" path="deadline"
									pattern="yyyy-MM-dd" required="required" /></td>
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Save" /></td>
						</tr>

					</tbody>
				</table>

			</form:form>

			<div></div>

			<p>
				<a href="${pageContext.request.contextPath}
			/">Back</a>
			</p>



		</div>
	</div>
</body>
</html>