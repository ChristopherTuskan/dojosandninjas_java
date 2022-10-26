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
<title>New Dojo</title>
</head>
<body>
	<div class="col-2 mx-auto">
		<h1 class="m-3">New Dojo</h1>
		<form:form action="/create/dojo" method="post" modelAttribute="dojo">
			<div class="form-group m-3">
				<form:label path="name">Name:</form:label>
				<form:errors path="name"/>
				<form:input path="name" class="form-control"/>
			</div>
			<input type="submit" value="Create" class="m-3"/>
		</form:form>
	</div>
</body>
</html>