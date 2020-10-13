<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<body>
    <h1>Home page</h1>      
			<p>
				<a href="${pageContext.request.contextPath}/member">
				Members</a>
			</p>

			<p>
				<a href="${pageContext.request.contextPath}/leader">
				Leaders</a>	
			</p>

			<p>
				<a href="${pageContext.request.contextPath}/admin">
				Admin</a>			
			</p>
			
			<p>
				<a href="${pageContext.request.contextPath}/logout">
				Logout</a>			
			</p>
			
</body>

</html>