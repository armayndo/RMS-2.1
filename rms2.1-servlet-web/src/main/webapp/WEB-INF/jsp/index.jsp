<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ page language="java" pageEncoding="UTF-8" session="false"%> --%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>RMS</title>
<meta name="description" content="Index">
<meta name="author" content="Mitrais">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet" href="resources/static/css/styles.css?v=1.0">

<!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">
		<header class="mdl-layout__header mdl-layout__header--transparent">
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">RMS</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation -->
				<nav class="mdl-navigation">
					<a class="mdl-navigation__link" href="users/list">Users</a> 
					<a class="mdl-navigation__link" href="">Link</a> 
					<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/profile/updateProfile?id=${user.userName}">Update Profile</a>
					<security:authorize access="hasRole('ADMIN')">
					<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/systems/userList">User List</a>
				</security:authorize>
				</nav>
			</div>
		</header>
		<div class="mdl-layout__drawer">
			<span class="mdl-layout-title">RMS</span>
			<nav class="mdl-navigation">
				<a class="mdl-navigation__link" href="users/list">Users</a> 
				<a class="mdl-navigation__link" href="">Link</a> 
				<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/profile/updateProfile?id=${user.userName}">Update Profile</a> 
				<security:authorize access="hasRole('ADMIN')">
					<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/systems/userList">User List</a>
				</security:authorize>
			</nav>
		</div>
		<main class="mdl-layout__content">
		<p>Welcome to the luv2code company home page!</p>

		<hr>
		<!-- display user name and role -->

		<p>
			User:
			<security:authentication property="principal.username" />
			<br>
			<br> Role(s):
			<security:authentication property="principal.authorities" />
			<br>
			<br> First name: ${user.firstName}, Last name: ${user.lastName},
			Email: ${user.email}
		</p>

		<security:authorize access="hasRole('MANAGER')">

			<!-- Add a link to point to /leaders ... this is for the managers -->

			<p>
				<a href="${pageContext.request.contextPath}/leaders">Leadership
					Meeting</a> (Only for Manager peeps)
			</p>

		</security:authorize> 
		<security:authorize access="hasRole('ADMIN')">

			<!-- Add a link to point to /systems ... this is for the admins -->

			<p>
				<a href="${pageContext.request.contextPath}/systems">IT Systems
					Meeting</a> (Only for Admin peeps)
			</p>

		</security:authorize>

		<hr>
		<!-- Add a logout button --> <form:form
			action="${pageContext.request.contextPath}/logout" method="POST">

			<input type="submit" value="Logout" />

		</form:form> </main>
	</div>






	<script src="js/scripts.js"></script>
</body>
</html>
