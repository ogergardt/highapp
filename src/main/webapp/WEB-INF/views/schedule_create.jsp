<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div id="formsContent">
	<!-- Form container -->
	<form id="scheduleForm" class="form-horizontal" autocomplete="off" method="POST" action="">
	<fieldset>
	<legend><spring:message code="schedule.create.legend"/></legend>
		<div class="control-group">
			<label class="control-label" for="login"><spring:message code="schedule.column.login"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="login" name="login" value="" maxlength="20" placeholder="Login">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name"><spring:message code="schedule.column.name"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="name" name="name" value="" maxlength="20" placeholder="Name">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="email"><spring:message code="schedule.column.email"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="email" name="email" placeholder="Email" value="" maxlength="60">
				<span class="help-inline"></span>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label" for="begin"><spring:message code="schedule.column.begin"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="begin" name="begin" placeholder="Begin" value="" maxlength="60">
				<span class="help-inline"></span>                    
            </div>          
		</div>
		<div class="control-group">
			<label class="control-label" for="comment"><spring:message code="schedule.column.comment"/><em>*</em></label>
			<div class="controls">
						<textarea id="ccomment" name="comment" required></textarea>
				<span class="help-inline"></span>
			</div>
		</div>
		</fieldset>	
		<div class="form-actions">
			<button id="saveButton" type="submit" class="btn btn-primary"><spring:message code="button.operation.create"/></button>
			<button id="cancelButton" type="button" class="btn"><spring:message code="button.operation.cancel"/></button>
		</div>		
	</form>
</div>