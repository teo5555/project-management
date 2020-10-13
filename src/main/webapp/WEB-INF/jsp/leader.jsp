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
<title>Leaders</title>
</head>
<body>
	<div class="container">
		<div>
			<h2 class="text-center">
				Welcome Leader<span><a
					href="${pageContext.request.contextPath}/logout"
					class="btn btn-danger float-right"> Logout</a></span>
			</h2>
		</div>


		<div class="list-group">
			<div class="row ">
				<div class="col-sm-6">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Task Manager</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">View Tasks</h5>
							<ul class="card-text">
								<li>Create Task</li>
								<li>Update Task</li>
								<li>Delete Task</li>
							</ul>
							<a href="${pageContext.request.contextPath}/tasks"
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
							<p class="card-text">Assign Member to Project</p>
							<a href="${pageContext.request.contextPath}/projectsByLeader"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>

				<hr>
				<div class="col-sm-6 mt-3">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Task Assigner And Remover</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">List of all Project Members</h5>
							<ul class="card-text">
								<li>Assign Task to a Member</li>
								<li>Remove Task from Member</li>
							</ul>
							<a
								href="${pageContext.request.contextPath}/projectUsersForLeader"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-sm-6 mt-3">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Member Statistics</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">List of all Members</h5>

							<ul class="card-text">
								<li>Assigned Tasks</li>
								<li>Completed Task (in time, out of time)</li>
								<li>Pending Tasks</li>
							</ul>
							<a href="${pageContext.request.contextPath}/listUsersForLeader"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
					<hr>
				<div class="col-sm-6 mt-3">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Tasks List</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">List of all Tasks</h5>

							<p class="card-text">List of all available tasks for a
								project</p>
							<a href="${pageContext.request.contextPath}/tasksList"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
					<hr>
				<div class="col-sm-6 mt-3">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Project Members</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">List of all project members</h5>

							<ul class="card-text">
								<li>User Details</li>
								<li>Project Details</li>
							</ul>
							<a href="${pageContext.request.contextPath}/projectsListMembers"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
			</div>
			<hr>


		</div>

	</div>
</body>
</html>