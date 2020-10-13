<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" ></script>

<meta charset="ISO-8859-1">
<title>Add User for 'Project User' table</title>
</head>
<body>
<div class="container">

	<form:form action="saveUserProject" modelAttribute= "projectUser" method="POST">
		
		 	<form:hidden path = "projectId"/>
		 	<table class="table">
			 	<tbody>
			 		<tr>
			 			<td><label>Project id:</label></td>
			 			<td><form:input path="project.id" readonly="true"/></td>
			 			<td><label>Project title:</label></td>
			 			<td><form:input path="project.title" readonly="true"/></td>
			 		</tr>
			 		
			 		<tr>
			 			<td><label>User id:</label></td>
			 			<td><form:input path="user.id" required="required"/></td>
			 		</tr>
			 		
			 			<tr>
			 				<td><label></label></td>
			 				<td><input type="submit" value="Assign User"/></td>
			 		</tr>
			 		
			 	</tbody>
		 	</table>
		 
		 </form:form>
		 
		 <table class="table table-hover text-center table-striped">
				<thead class="thead-inverse">
				<tr>
					<th class="text-center">User id</th>
					<th class="text-center">User name</th>
					<th class="text-center">Role</th>
				</tr>
				</thead>
				
				<c:forEach var = "tempUsers" items="${users}">	
					<tr>
						<td>${tempUsers.id}</td>
						<td>${tempUsers.userName}</td>
						<td>${tempUsers.roles}</td>
					</tr>					
				</c:forEach>				
			</table>
		  <p>
			<a href=
			"${pageContext.request.contextPath}
			/">Back</a>
		 </p>
</div>
</body>
</html>