<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div id="formsContent">
	<!-- Form container -->
	<form id="accountForm" class="form-horizontal" autocomplete="off" method="POST" action="">
	<fieldset>
	<legend><spring:message code="user.create.legend"/></legend>
		<div class="control-group">
			<label class="control-label" for="id"><spring:message code="user.column.id"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="id" name="id" readOnly="true" value="${user.getId()}" maxlength="100" data-reset="${user.getId()}">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="login"><spring:message code="user.column.login"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="login" name="login" value="${user.getLogin() }" maxlength="20" placeholder="Login" data-reset="${user.getLogin()}">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name"><spring:message code="user.column.name"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="name" name="name" value="${user.getName() }" maxlength="20" placeholder="Name" data-reset="${user.getName()}">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="email"><spring:message code="user.column.email"/><em>*</em></label>
			<div class="controls">
				<input type="text" id="email" name="email" placeholder="Email" value="${user.getEmail() }" maxlength="60" data-reset="${user.getEmail()}">
				<span class="help-inline"></span>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label" for="roles"><spring:message code="user.column.roles"/><em>*</em></label>
			<div class="controls">
				 <select id="rolesList">
				 <option selected value="${user.getRole() }">${user.getRole() }</option> 
				 </select>	                    
            </div>          
		</div>
		<div class="control-group">
			<label class="control-label" for="changepassword">Would you like to change the password?</label>
			<div class="controls">
				<input type="checkbox" id="changepassword" name="changepassword"/>
				<span class="help-inline"></span>
			</div>
		</div>				
		<div class="control-group">
			<label class="control-label" for="password"><spring:message code="user.column.password"/><em>*</em></label>
			<div class="controls">
				<input type="password" id="password" name="password" readOnly="true" maxlength="40" value="${user.getPassword() }"  placeholder="Password" data-reset="${user.getPassword()}">
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="password_confirm"><spring:message code="user.column.passwordConfirmation"/><em>*</em></label>
			<div class="controls">
				<input type="password" id="password_confirm" name="password_confirm" readOnly="true" maxlength="40" value="${user.getPassword() }"  placeholder="Confirm Password">
				<span class="help-inline"></span>
			</div>
		</div> 	
		</fieldset>	
		<div class="form-actions">
			<button id="saveButton" type="submit" class="btn btn-primary"><spring:message code="button.operation.save"/></button>
			<button id="resetButton" type="button" class="btn"><spring:message code="button.operation.reset"/></button>
			<button id="cancelButton" type="button" class="btn"><spring:message code="button.operation.cancel"/></button>
		</div>		
	</form>
</div>