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
span {
	white-space: pre-wrap;
}
</style>

<meta charset="ISO-8859-1">
<title>Administrator Page</title>
</head>
<body>
	<div class="container">
		<div>
			<h2 class="text-center">
				System Administrator<span><a
					href="${pageContext.request.contextPath}/logout"
					class="btn btn-danger float-right"> Logout</a></span>
			</h2>
		</div>

		<div class="list-group">
			<div class="row">
				<div class="col-sm-6">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Users Manager</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">View Users</h5>
							<ul class="card-text">
								<li>Create User</li>
								<li>Update User</li>
								<li>Delete User</li>
							</ul>
							<a href="${pageContext.request.contextPath}/users"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-sm-6">
					<div class="card">

						<div class="card-header">
							<h4>
								<span class="text-primary">Project Manager</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">View Projects</h5>
							<ul class="card-text">
								<li>Create Project</li>
								<li>Update Project</li>
								<li>Delete Project</li>
								<li>Assign User or Leader to Project</li>
							</ul>

							<a href="${pageContext.request.contextPath}/projects"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="col-sm-6 mx-auto">
				<div class="card">
					<div class="card-header">
						<h4>
							<span class="text-primary">Projects List</span>
						</h4>
					</div>
					<div class="card-body">
						<h5 class="card-title">Project Members And Leaders List</h5>

						<ul class="card-text">
							<li>Remove User from the Project</li>
						</ul>

						<a href="${pageContext.request.contextPath}/projectUsers"
							class="btn btn-primary">Go</a>
					</div>
				</div>
			</div>


		</div>

	</div>
</body>
</html>