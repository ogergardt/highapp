<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div id="formsContent">
	<!-- Form container -->
	<form id="accountForm" class="form-horizontal" autocomplete="off" method="POST" action="">
	<fieldset>
	<legend><spring:message code="user.availability.legend"/></legend>
		<div class="control-group">
			<label class="control-label" for="sunday"><spring:message code="user.availability.sunday"/></label>
			<div class="controls" id="sunday">
  					<input type="checkbox" id="sunday_h8"  /><label for="sunday_h8">8 AM</label>
					<input type="checkbox" id="sunday_h11" /><label for="sunday_h11">11 AM</label>
					<input type="checkbox" id="sunday_h14" /><label for="sunday_h14">2 PM</label>
					<input type="checkbox" id="sunday_h17" /><label for="sunday_h17">5 PM</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="monday"><spring:message code="user.availability.monday"/></label>
			<div class="controls" id="monday">
  					<input type="checkbox" id="monday_h8"  /><label for="monday_h8">8 AM</label>
					<input type="checkbox" id="monday_h11" /><label for="monday_h11">11 AM</label>
					<input type="checkbox" id="monday_h14" /><label for="monday_h14">2 PM</label>
					<input type="checkbox" id="monday_h17" /><label for="monday_h17">5 PM</label>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label" for="tuesday"><spring:message code="user.availability.tuesday"/></label>
			<div class="controls" id="tuesday">
  					<input type="checkbox" id="tuesday_h8"  /><label for="tuesday_h8">8 AM</label>
					<input type="checkbox" id="tuesday_h11" /><label for="tuesday_h11">11 AM</label>
					<input type="checkbox" id="tuesday_h14" /><label for="tuesday_h14">2 PM</label>
					<input type="checkbox" id="tuesday_h17" /><label for="tuesday_h17">5 PM</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="wednesday"><spring:message code="user.availability.wednesday"/></label>
			<div class="controls" id="wednesday">
  					<input type="checkbox" id="wednesday_h8"  /><label for="wednesday_h8">8 AM</label>
					<input type="checkbox" id="wednesday_h11" /><label for="wednesday_h11">11 AM</label>
					<input type="checkbox" id="wednesday_h14" /><label for="wednesday_h14">2 PM</label>
					<input type="checkbox" id="wednesday_h17" /><label for="wednesday_h17">5 PM</label>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label" for="thursday"><spring:message code="user.availability.thursday"/></label>
			<div class="controls" id="thursday">
  					<input type="checkbox" id="thursday_h8"  /><label for="thursday_h8">8 AM</label>
					<input type="checkbox" id="thursday_h11" /><label for="thursday_h11">11 AM</label>
					<input type="checkbox" id="thursday_h14" /><label for="thursday_h14">2 PM</label>
					<input type="checkbox" id="thursday_h17" /><label for="thursday_h17">5 PM</label>
			</div>
		</div>			
		<div class="control-group">
			<label class="control-label" for="friday"><spring:message code="user.availability.friday"/></label>
			<div class="controls" id="friday">
  					<input type="checkbox" id="friday_h8"  /><label for="friday_h8">8 AM</label>
					<input type="checkbox" id="friday_h11" /><label for="friday_h11">11 AM</label>
					<input type="checkbox" id="friday_h14" /><label for="friday_h14">2 PM</label>
					<input type="checkbox" id="friday_h17" /><label for="friday_h17">5 PM</label>
			</div>
		</div>		
		<div class="control-group">
			<label class="control-label" for="saturday"><spring:message code="user.availability.saturday"/></label>
			<div class="controls" id="saturday">
  					<input type="checkbox" id="saturday_h8"  /><label for="saturday_h8">8 AM</label>
					<input type="checkbox" id="saturday_h11" /><label for="saturday_h11">11 AM</label>
					<input type="checkbox" id="saturday_h14" /><label for="saturday_h14">2 PM</label>
					<input type="checkbox" id="saturday_h17" /><label for="saturday_h17">5 PM</label>
			</div>
		</div>												
		</fieldset>	
		<div class="form-actions">
			<button id="updateButton" type="submit" class="btn btn-primary"><spring:message code="button.operation.update"/></button>
		</div>		
	</form>
</div>