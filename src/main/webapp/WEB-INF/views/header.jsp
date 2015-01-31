<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

 <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
        <a class="brand" href="home"> <img src="assets/ico/favicon32x32.ico"></a>
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="home">DRIBBLE</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="dropdown">
                <a href="home" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
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
              <li class="active"><a href="home">Home</a></li>
              <sec:authorize access="isAuthenticated()">
              <li><a href="users">Management</a></li> 
              <li><a href="logout">Logout</a></li>    
              </sec:authorize>                       
              <li><a href="about">About</a></li>
            </ul>
            <form class="navbar-form pull-right" action="<c:url value='j_spring_security_check' />" method='POST'>
              <input class="span2" type="text" placeholder="Email" name='j_username'>
              <input class="span2" type="password" placeholder="Password" name='j_password'>
              <button type="submit" class="btn" >Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
