<%@include file="includes.jsp" %>
<%@ page session="false" %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="assets/css/default.css" type="text/css"/>

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">


<link rel="shortcut icon" href="assets/ico/favicon.png"> 

      
                           
</head>
<body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">  
        <div class="container">
         <a class="brand" href="${pageContext.request.contextPath}"> <img src="assets/ico/favicon32x32.ico"></a>    
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="${pageContext.request.contextPath}">DRIBBLE</a>
				<div class="nav-collapse collapse">
            <ul class="nav">
              <li class="dropdown">
                <a href="home" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="navbar.menu.deals" /><b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="home">Action</a></li>
                  <li><a href="home">Another action</a></li>
                  <li><a href="home">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="home">Separated link</a></li>
                  <li><a href="home">One more separated link</a></li>
                </ul>
              </li>
              <li><a href="home"><spring:message code="navbar.menu.home" /></a></li>
              <li><a href="about"><spring:message code="navbar.menu.about" /></a></li>   
              <li><a href="about"><spring:message code="navbar.menu.help" /></a></li>           
              <sec:authorize access="isAuthenticated()">
              <%-- <sec:authorize access="hasRole('ROLE_ADMIN')> --%>
              <li><a href="users"><spring:message code="navbar.menu.accounts" /></a></li>    
              </sec:authorize>                                                  
            </ul>            
            <sec:authorize access="isAnonymous()"> 
            <form class="navbar-form pull-right" action="<c:url value='j_spring_security_check' />" method='POST'>
              <input class="span2" type="text" placeholder="Email" name='j_username'>
              <input class="span2" type="password" placeholder="Password" name='j_password'>
              <button type="submit" class="btn" >Sign in</button>
            </form>
            </sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<div class="btn-group pull-right">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-user"></i>${username} <span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/j_spring_security_logout" />" ><spring:message code="navbar.menu.logout" /></a>
								</li>
							</ul>
						</div>
					</sec:authorize>

				</div><!--/.nav-collapse -->
        </div>
      </div>
    </div>


	<h3>Message : ${message}</h3>	
	<h3>Username : ${username}</h3>	
	<h3>Server time: ${serverTime}</h3>
	<h3>Language: ${locale}</h3>
	<a href="<c:url value="/j_spring_security_logout" />" > Logout</a>


    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>

</body>
</html>
