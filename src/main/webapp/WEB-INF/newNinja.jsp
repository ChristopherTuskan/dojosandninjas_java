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
<title>New Ninja</title>
</head>
<body>
	<div class="col-2 mx-auto">
		<h1 class="m-3">New Ninja</h1>
		<form:form action="/create/ninja" method="post" modelAttribute="ninja">
			<div class="form-group m-3">
				<form:label path="dojo">Dojo:</form:label>
				<form:select path="dojo">
			        <c:forEach var="dojo" items="${dojos}">
			            <!--- Each option VALUE is the id of the person --->
			            <form:option value="${dojo.getId()}" path="dojo">
			            <!--- This is what shows to the user as the option --->
			                <c:out value="${dojo.getName()}"/>
			            </form:option>
			        </c:forEach>
	    		</form:select>
    		</div>
			<div class="form-group m-3">
				<form:label path="firstname">First Name:</form:label>
				<form:errors path="firstname"/>
				<form:input path="firstname" class="form-control"/>
			</div>
			<div class="form-group m-3">
				<form:label path="lastname">Last Name:</form:label>
				<form:errors path="lastname"/>
				<form:input path="lastname" class="form-control"/>
			</div>
			<div class="form-group m-3">
				<form:label path="age">Age:</form:label>
				<form:errors path="age"/>
				<form:input path="age" class="form-control"/>
			</div>
			<input type="submit" value="Create" class="m-3"/>
		</form:form>
	</div>
</body>
</html>