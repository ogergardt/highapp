<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div id="formsContent">
	<!-- Form container -->
	<form id="accountForm" class="form-horizontal" autocomplete="off" method="POST" action="">
	<fieldset>
	<legend><spring:message code="user.create.legend"/></legend>
		<div class="control-group">
			<label class="control-label" for="login"><spring:message code="user.column.login"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="login" name="login" value="" maxlength="20" placeholder="Login">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name"><spring:message code="user.column.name"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="name" name="name" value="" maxlength="20" placeholder="Name">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="email"><spring:message code="user.column.email"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="email" name="email" placeholder="Email" value="" maxlength="60">
				<span class="help-inline"></span>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label" for="roles"><spring:message code="user.column.roles"/><em>*</em></label>
			<div class="controls">
				 <select id="rolesList"></select>	                    
            </div>          
		</div>
		<div class="control-group">
			<label class="control-label" for="password"><spring:message code="user.column.password"/><em>*</em></label>
			<div class="controls">
				<input type="password" id="password" name="password" maxlength="40" value=""  placeholder="Password">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="password_confirm"><spring:message code="user.column.passwordConfirmation"/><em>*</em></label>
			<div class="controls">
				<input type="password" id="password_confirm" name="password_confirm" maxlength="40" value=""  placeholder="Confirm Password">
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