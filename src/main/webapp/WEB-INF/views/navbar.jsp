<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    
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
              <li><a href="book"><spring:message code="navbar.menu.book" /></a></li>          
              <sec:authorize access="hasRole('ROLE_USER')">
              <li><a href="accountavailable"><spring:message code="navbar.menu.accountavailable" /></a></li>
              </sec:authorize>
              
              <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="dropdown">
                <a href="users" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="navbar.menu.management" /><b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="users"><spring:message code="navbar.menu.accounts" /></a></li>
                  <li><a href="usersavailability"><spring:message code="navbar.menu.usersavailability" /></a></li>
                  <li><a href="schedule"><spring:message code="navbar.menu.schedule" /></a></li>
                </ul>
              </li>
              </sec:authorize>                                                  
            </ul>            
            <sec:authorize access="isAnonymous()"> 
            <form class="navbar-form pull-right" action="<spring:url value='j_spring_security_check' />" method='POST'>
              <input class="span2" type="text" placeholder="Email" name='j_username'>
              <input class="span2" type="password" placeholder="Password" name='j_password'>
              <button type="submit" class="btn" >Sign in</button>
            </form>
            </sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<div class="btn-group pull-right">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-user"></i> ${username} <span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="<spring:url value="/j_spring_security_logout" />" ><spring:message code="navbar.menu.logout" /></a>
								</li>
							</ul>
						</div>
					</sec:authorize>

				</div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
