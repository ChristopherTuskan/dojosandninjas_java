<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Show Dojo</title>
</head>
<body>
	<div class="col-3 mx-auto">
		<h1 class="m-3">${dojo.getName()} Ninjas</h1>
		<table class="table table-bordered">
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Age</th>
			</tr>
			<c:forEach var="ninja" items="${dojo.getNinjas()}">
				<tr>
					<td><c:out value="${ninja.getFirstname()}"></c:out></td>
					<td><c:out value="${ninja.getLastname()}"></c:out></td>
					<td><c:out value="${ninja.getAge()}"></c:out></td>
				</tr>
    		</c:forEach>
		</table>
	</div>
</body>
</html>