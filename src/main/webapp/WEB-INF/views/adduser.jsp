<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id = "newUser">
<form action="<spring:url value='adduser' />" name="user" method="post">
    <fieldset>
        <legend>New user</legend>
        <div id="info" style="color: green;"></div>
        <ul>
            <li><input type="text" id = "login" class = "required" placeholder = "LOGIN" name = "login" /></li>
            <li><input type="text" id = "name" class = "required" placeholder = "NAME" name = "name" /></li>
            <li><input type="text" id = "email" class = "required validate-email" placeholder = "EMAIL" name = "email" /></li>
            <li><input type="text" id = "role" class = "required" placeholder = "ROLE" name = "role" /></li>
            <li><input type="text" id = "password" class = "required" placeholder = "PASSWORD" name = "password" /></li>
        </ul>
    </fieldset>
		<div id="newUserStatus">
			<input type="submit" id="submit" value="ADD" class="button"> <br />

		</div>
	</form>
</div>

