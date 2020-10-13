<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" ></script>

<style>
#tablecenter {
	margin: auto;
	width: 80% !important;
}

</style>


<meta charset="ISO-8859-1">
<title>Add User for 'Project User' table</title>
</head>
<body>

<div class="container">
	
	<form:form action="saveTaskProject" modelAttribute= "taskUser" method="POST">
			 	<form:hidden path = "projectId"/>
			 	<form:hidden path = "userId"/>
		 	<table class="table table-hover text-center table-responsive col-md-6">
			 	<tbody>
			 		<tr>
			 		
			 			<td><label>Project id:</label></td>
			 			<td><form:input path="project.id" readonly="true"/></td>
			 			<td><label>Project title:</label></td>
			 			<td><form:input path="project.title" readonly="true"/></td>
			 			
			 			<td><label>User id:</label></td>
			 			<td><form:input path="user.id" readonly="true"/></td>
			 		</tr>
			 		
			 		<tr>
			 			<td><label>Task id:</label></td>
			 			<td><form:input path="task.id" required="required" type="number"/></td>
			 		</tr>
			 		
			 			<tr>
			 				<td><label></label></td>
			 				<td><input type="submit" value="Assign User"/></td>
			 		</tr>
			 		
			 	</tbody>
		 	</table>
		 
		 </form:form>

		<div class="row">
			<div>
			<table class="table table-hover text-center table-responsive col-md-6 table-striped">
				<thead class="thead-inverse">
					<tr>
						<th class="text-center">Task Id</th>
						<th class="text-center">Task Title</th>
						<th class="text-center">Description</th>
						<th class="text-center">Deadline</th>
	
					</tr>
				</thead>
				<tr>
					<!-- loop over print our customers -->
					<c:forEach var="tempTasks" items="${tasks}">
					
						<tr>
							<td>${tempTasks.id}</td>
							<td>${tempTasks.title}</td>
							<td>${tempTasks.description}</td>
							<td>${tempTasks.deadline}</td>
	
					
						</tr>
					</c:forEach>
	
			</table>
		</div>


			<table id="tablecenter" class="table table-hover text-center table-responsive col-md-6 table-striped">
			<thead class="thead-inverse">
				<tr>
					<th class="text-center">User Id</th>
					<th class="text-center">User Name</th>
					<th class="text-center">User Role</th>
					<th class="text-center">Project Id</th>
					<th class="text-center">Project Title</th>

				</tr>
			<thead>					
				<c:forEach var = "tempUsers" items="${projectUserByLeader}">			
					<tr>
							<td>${tempUsers.userId}</td>
							<td>${tempUsers.userName}</td>
							<td>${tempUsers.roles}</td>
							<td>${tempUsers.projectId}</td>
							<td>${tempUsers.title}</td>
				
					</tr>			
				</c:forEach>
								
			</table>		

		</div>		
					<p>
						<a href=
						"${pageContext.request.contextPath}
						/">Back</a>
					 </p>	 
	</div>
</body>
</html>