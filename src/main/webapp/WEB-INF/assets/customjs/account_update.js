var role, allExistingRoles=[];

$(document).ready(function() {
	
	$("#changepassword").click(function() {

		$("#password").prop("readOnly", !this.checked);
		$("#password_confirm").prop("readOnly", !this.checked);
	});
 
    	$.ajax({
            type: "GET",
            url: 'roles/all',
    	    contentType: "application/json",            
        success: function(response){        	
        	 allExistingRoles=JSON.parse(response);
        	 role =$('#rolesList').val();
			  for(var i=0;i<allExistingRoles.length;i++){
				  if (role!==allExistingRoles[i].name) {
					  $('#rolesList').append("<option value="+allExistingRoles[i].name+">"+allExistingRoles[i].name+"</option>");
				  }
			  }		
			  
            } //success
       });
    	
    	var validator = $("#accountForm").validate({
    		rules: {
    			login: "required",
    			name: "required",
    			password: {
    				required: true,
    				minlength: 8,
    				maxlength:40
    			},
    			password_confirm: {
    				required: true,
    				minlength: 8,
    				maxlength: 40,
    				equalTo: "#password"
    			},
    			email: {
    				required: true,
    				email: true    			
    			}
    		},
    		messages: {
    			login: {required : "Enter your login"},
    			name:  {required  : "Enter your fullname"},
    			password:  {
    				required: "Provide a password",
    				
    				minlength: jQuery.format("Enter at least {0} characters"),
    				maxlength: jQuery.format("Enter a maximum of {0} characters")
    			},
    			password_confirm: {
    				required: "Repeat your password",
    				equalTo: "Enter the same password as above"
    			},
    			email: {
    				required: "Please enter a valid email address",
    				minlength: "Please enter a valid email address"
    			}
    		},
    		errorPlacement: function(error, element) {
    			error.appendTo(element.next());
    		},
    		submitHandler: function() {
    			
    			var jsonData = {
    					login : $("#login").val(),
    				     name : $("#name").val(),
    				    email : $("#email").val(),
    				 password : $("#password").val(), 
    				     role : $('#rolesList').val()
    				 
    			};
    	      
    			$.ajax({  
    				  type: "POST",  
    				  url: "updateuser_"+$("#id").val(),  
    				  data: JSON.stringify(jsonData),
    				  contentType: "application/json; charset=utf-8",
    				  success: function(response) {
    					  document.location.href='users';
    				  }
    				});   

    			return false; 
    		},
    		success: function(label) {
    		}
    	});
    	
cancelButtonHandler();   
resetButtonHandler();

});

function cancelButtonHandler(){
	$("#cancelButton").click(function() {
		document.location.href='users';
	});	
}

function resetButtonHandler(){
	$("#resetButton").click(function() {
		$("input#login").val($("input#login").attr("data-reset"));
		$("input#name").val($("input#name").attr("data-reset"));
		$("input#email").val($("input#email").attr("data-reset"));
		$('#rolesList').empty();
		for(var i=0;i<allExistingRoles.length;i++){
			  if (role!==allExistingRoles[i].name) {
				  $('#rolesList').append("<option value="+allExistingRoles[i].name+">"+allExistingRoles[i].name+"</option>");
			  } else {
				  $('#rolesList').append("<option selected value="+allExistingRoles[i].name+">"+allExistingRoles[i].name+"</option>");  
			  }
		}
		$("#changepassword").prop("checked",false);
		$("#password").prop("readOnly", false);
		$("#password_confirm").prop("readOnly", false);
		$("input#password").val($("input#password").attr("data-reset"));
		$("input#password_confirm").val($("input#password").attr("data-reset"));
		  return false;
	});	
}


