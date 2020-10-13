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
			<h2 class="text-center">
				Welcome Member<span><a
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
								<span class="text-primary">Task Manager</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">View Tasks And Update Task State</h5>
							<p class="card-text">A page to modify a task's state</p>
							<a href="${pageContext.request.contextPath}/memberTasksView"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>

				<hr>
				<div class="col-sm-6">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">List Tasks</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">List of all tasks assigned</h5>
							<p class="card-text">
								<span class="text-success"></span>
							</p>
							<a href="${pageContext.request.contextPath}/memberTasksList"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>

				<hr>
				<div class="col-sm-6">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Members List</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">List of all Members in our System</h5>
							<p class="card-text"></p>
							<a href="${pageContext.request.contextPath}/memberListByUser"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-sm-6">
					<div class="card">
						<div class="card-header">
							<h4>
								<span class="text-primary">Member Statistics</span>
							</h4>
						</div>
						<div class="card-body">
							<h5 class="card-title">See own statistics</h5>

							<ul class="card-text">
								<li>Assigned Tasks</li>
								<li>Completed Task (in time, out of time)</li>
								<li>Pending Tasks</li>
							</ul>
							<a href="${pageContext.request.contextPath}/memberOwnStatistics"
								class="btn btn-primary">Go</a>
						</div>
					</div>
				</div>
			</div>

		</div>


	</div>
</body>
</html>