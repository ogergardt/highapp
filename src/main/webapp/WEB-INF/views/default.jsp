<%-- <%@include file="includes.jsp" %> --%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title-content" /></title>
<link rel="shortcut icon" href="assets/ico/favicon.png"> 

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/commons.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .ui-draggable, .ui-droppable {
	  background-position: top;
	  }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<tiles:insertAttribute name="custom-css" />                           
</head>
<body id="${pageName}" data-search-url='<spring:url value='/search'/>'>
	<tiles:insertAttribute name="navbar-content" />	
	<div class="container">
		<tiles:insertAttribute name="main-content" />
		<tiles:insertAttribute name="modal-content" />		
	</div>

    <hr>
    <footer>
        <p>&copy; SAN JOSE, CA 2013</p>
    </footer>	
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <tiles:insertAttribute name="custom-js" /> 
</body>
</html>