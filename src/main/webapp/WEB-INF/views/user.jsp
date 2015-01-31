<%@include file="includes.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="assets/ico/favicon.png" rel="icon" type="image/png" />
<link rel="stylesheet" href="assets/css/default.css" type="text/css"/>
</head>
<body>

<div class="main">
    <ul class="menu">
            <li><a href="home">Home</a></li>  
            <li><a href="myrides.htm">My rides</a></li>
            <li><a href="upcoming.htm">Upcoming</a></li> 
            <li><a href="users" class="active">Management</a></li>
            <li><a href="logout">Logout</a></li>                         
        </ul>
        <div class="user_info">
                ${username}
        </div>
</div>

    <h1 class="table_title">Users: </h1>
<div class="actions">
<a href="<c:url value="/adduser" />" > add</a>
<input type="submit" name="action" value="edit"/>&nbsp;
<input type="submit" name="action" value="delete"/>&nbsp;
<input type="submit" name="action" value="search"/>&nbsp;
</div>
	<table class="table table-hover">
<!-- 	<table class="table table-hover" border="1"> -->
		<tr>
			<th>#</th>
			<th>Login</th>
			<th>Name</th>
			<th>Email</th>
			<th>Role</th>
			<th>Password</th>
		</tr>
		<%!public int i = 1;%>
		<c:forEach var="user" items="${users}">
			<tr>
				<td><%=i%></td>
				<td>${ user.getLogin() }</td>
				<td>${ user.getName() }</td>
				<td>${ user.getEmail() }</td>
				<td>${ user.getRole() }</td>
				<td>*****</td>

				<%
					++i;
				%>
			</tr>
		</c:forEach>
		<%
			i = 1;
		%>
	</table>

</body>
</html>

