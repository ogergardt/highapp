var allExistingRoles=[];

$(document).ready(function() {
	
    	
    	var validator = $("#accountForm").validate({
    		rules: {
    			begin: "required",
    			comment: {
    				required: false,
    				maxlength:600
    			}
    		},
    		messages: {
    		   begin: {required : "Enter begin date"},
    		 comment: {
    				maxlength: jQuery.format("Enter a maximum of {0} characters")
    			}
    		},
    		errorPlacement: function(error, element) {
    			error.appendTo(element.next());
    		},
    		submitHandler: function() {
    			
    			var jsonData = {
     			   email : $("#email").val(),
    			   begin : $("#begin").val(), 
    			 comment : $('#comment').val()
    				 
    			};
    	      
    			$.ajax({  
    				  type: "POST",  
    				  url: "addschedule",  
    				  data: JSON.stringify(jsonData),
    				  contentType: "application/json; charset=utf-8",
    				  success: function(response) {
    					  document.location.href='schedule';
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
		document.location.href='schedule';
	});	
}


