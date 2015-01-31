var allExistingRoles=[];

$(document).ready(function() {
	

    	$.ajax({
            type: "GET",
            url: 'roles/all',
    	    contentType: "application/json",            
        success: function(response){        	
        	 allExistingRoles=JSON.parse(response);
			  for(var i=0;i<allExistingRoles.length;i++){
				  $('#rolesList').append("<option value="+allExistingRoles[i].name+">"+allExistingRoles[i].name+"</option>");
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
    				email: true,
    					remote: {
    				        url: "validator/email",
    				        type: "POST",
    				        contentType: "application/json"
    				      }		
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
    				minlength: "Please enter a valid email address",
    				remote: jQuery.format("{0} is already in use")
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
    				  url: "adduser",  
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

});

function cancelButtonHandler(){
	$("#cancelButton").click(function() {
		document.location.href='users';
	});	
}


