<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="row-fluid">
       
<table class="table table-bordered" id="accountable">
	<thead>
		<tr>			
			<th><spring:message code="user.column.id"/></th>
			<th><spring:message code="user.column.login"/></th>
			<th><spring:message code="user.column.name"/></th>
			<th><spring:message code="user.column.email"/></th>
			<th><spring:message code="user.column.role"/></th>
			<th><spring:message code="user.column.password"/></th>

		</tr>
	</thead>
	<tbody>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${ user.getId() }</td>
				<td>${ user.getLogin() }</td>
				<td>${ user.getName() }</td>
				<td>${ user.getEmail() }</td>
				<td>${ user.getRole() }</td>
				<td>${ user.getPassword() }</td>
			</tr>			
		</c:forEach>
	</tbody>
</table>
</div>
