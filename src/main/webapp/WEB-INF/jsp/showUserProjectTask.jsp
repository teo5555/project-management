<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
.green {
	color: green
}

.red {
	color: red
}

.blue {
	color: blue
}

#pending {
	margin: auto;
	width: 80% !important;
}
</style>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container">


		<div class="text-center">
			<h2>Assigned Tasks</h2>

			<table
				class="table table-hover table-striped text-center table-responsive col-md-6">

				<thead class="thead-inverse">
					<tr>
						<th class="text-center">User Id</th>
						<th class="text-center">User name</th>
						<th class="text-center">Project Id</th>
						<th class="text-center">Project Title</th>
						<th class="text-center">Task Id</th>
						<th class="text-center">Task Title</th>
						<th class="text-center">Task description</th>
						<th class="text-center">Task Deadline</th>
						<th class="text-center">Task State</th>


					</tr>
				</thead>
				<tr>

					<c:forEach var="tempTasks" items="${listUserProjectTasks}">
						<tr>
							<td>${tempTasks.user.id}</td>
							<td>${tempTasks.user.userName}</td>
							<td>${tempTasks.project.id}</td>
							<td>${tempTasks.project.title}</td>
							<td>${tempTasks.task.id}</td>
							<td>${tempTasks.task.title}</td>
							<td>${tempTasks.task.description}</td>
							<td>${tempTasks.task.deadline}</td>
							<td
								class="${tempTasks.task.state == 'DONE' ? 'green' : ''} 
							${tempTasks.task.state == 'WORKING ON IT' ? 'blue' : ''} 
							${tempTasks.task.state == 'STUCK' ? 'red' : ''}">${tempTasks.task.state}</td>
							<td>
						</tr>

					</c:forEach>
			</table>
		</div>


		<div class="row">
			<div class="col-xs-6 w-50">
				<h2 class="sub-header text-center">Completed Tasks On time</h2>
				<div class="table-responsive">
					<table class="table table-striped  ">

						<thead class="thead-inverse">
							<tr>

								<th class="text-center">User name</th>
								<th class="text-center">Project Title</th>
								<th class="text-center">Task Title</th>
								<th class="text-center">Task description</th>
								<th class="text-center">Task Deadline</th>
								<th class="text-center">Task State</th>


							</tr>
						</thead>


						<tr>
							<!-- loop over print our customers -->
							<c:forEach var="tempTasks" items="${completedTasksOnTime}">



								<tr>

									<td>${tempTasks.user.userName}</td>
									<td>${tempTasks.project.title}</td>
									<td>${tempTasks.task.title}</td>
									<td>${tempTasks.task.description}</td>
									<td>${tempTasks.task.deadline}</td>
									<td
										class="${tempTasks.task.state == 'DONE' ? 'green' : ''} 
							${tempTasks.task.state == 'WORKING ON IT' ? 'blue' : ''} 
							${tempTasks.task.state == 'STUCK' ? 'red' : ''}">${tempTasks.task.state}</td>
									<td>
								</tr>

							</c:forEach>
					</table>
				</div>
			</div>

			<div class="col-xs-6 w-50">
				<h2 class="sub-header text-center">Completed Tasks Out time</h2>
				<div class="table-responsive">

					<table class="table table-striped ">

						<thead class="thead-inverse">
							<tr>
								<th class="text-center">User name</th>
								<th class="text-center">Project Title</th>
								<th class="text-center">Task Title</th>
								<th class="text-center">Task description</th>
								<th class="text-center">Task Deadline</th>
								<th class="text-center">Task State</th>
							</tr>
						</thead>
						<tr>
							<!-- loop over print our customers -->
							<c:forEach var="tempTasks" items="${completedTasksOutTime}">



								<tr>
									<td>${tempTasks.user.userName}</td>
									<td>${tempTasks.project.title}</td>
									<td>${tempTasks.task.title}</td>
									<td>${tempTasks.task.description}</td>
									<td>${tempTasks.task.deadline}</td>
									<td
										class="${tempTasks.task.state == 'DONE' ? 'green' : ''} 
							${tempTasks.task.state == 'WORKING ON IT' ? 'blue' : ''} 
							${tempTasks.task.state == 'STUCK' ? 'red' : ''}">${tempTasks.task.state}</td>
									<td>
								</tr>

							</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

		<div class="text-center center">
			<h2>Pending Tasks</h2>

			<table id="pending"
				class="table table-hover table-striped text-center table-responsive ">

				<thead class="thead-inverse">
					<tr>

						<th class="text-center">User name</th>
						<th class="text-center">Project Title</th>
						<th class="text-center">Task Title</th>
						<th class="text-center">Task description</th>
						<th class="text-center">Task Deadline</th>
						<th class="text-center">Task State</th>


					</tr>
				</thead>
				<tr>

					<c:forEach var="tempTasks" items="${pendingState}">
						<tr>

							<td>${tempTasks.user.userName}</td>
							<td>${tempTasks.project.title}</td>
							<td>${tempTasks.task.title}</td>
							<td>${tempTasks.task.description}</td>
							<td>${tempTasks.task.deadline}</td>
							<td
								class="${tempTasks.task.state == 'DONE' ? 'green' : ''} 
							${tempTasks.task.state == 'WORKING ON IT' ? 'blue' : ''} 
							${tempTasks.task.state == 'STUCK' ? 'red' : ''}">${tempTasks.task.state}</td>
							<td>
						</tr>

					</c:forEach>
			</table>
			<p>
				<a href="${pageContext.request.contextPath}/listUsersForLeader"
					class="btn btn-outline-dark" role="button" aria-pressed="true">Back</a>
			</p>
		</div>

	</div>


</body>
</html>