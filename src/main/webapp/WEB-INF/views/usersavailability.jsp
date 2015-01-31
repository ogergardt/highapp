<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="row-fluid">
       
<table class="table table-bordered" id="scheduletable">
	<thead>
		<tr>			
			<th><spring:message code="schedule.column.id"/></th>
			<th><spring:message code="schedule.column.name"/></th>
			<th><spring:message code="schedule.column.login"/></th>
			<th><spring:message code="schedule.column.email"/></th>
			<th><spring:message code="schedule.column.begin"/></th>
			<th><spring:message code="schedule.column.comment"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="schedule" items="${schedule}">
			<tr>
				<td>${ schedule.getId() }</td>
				<td>${ schedule.getUserName() }</td>
				<td>${ schedule.getUserLogin() }</td>
				<td>${ schedule.getUserEmail() }</td>				
				<td>${ schedule.getBegin() }</td>
				<td>${ schedule.getComment() }</td>
			</tr>			
		</c:forEach>
	</tbody>
</table>
</div>