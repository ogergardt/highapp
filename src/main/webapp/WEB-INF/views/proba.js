$(document).ready(function() {
    /* Add/remove class to a row when clicked on */
    $('#accountable tbody tr').click( function() {
        $(this).toggleClass('row_selected');
    } );

    function initCrudButtons(){
    	$("div.toolbar").html('<a href="/app/adduser" id="bt_add" class="btn btn-primary">Create</a> <a href="#" id="bt_update" class="btn btn-success">Edit</a> <button id="bt_delete" type="button" class="btn btn-danger">Delete</button>');

    	$("#bt_delete").click(function() {     
    		var selected_id = oTable.$('tr.row_selected');            
    		if (selected_id.length == 0) { 
    	    	  $('#errorModalLabel').html('Warning:');
    	    	  $('#errorModalMsg').html('Please select a record first.');
    	    	  $('#errorModelBody').attr('class', 'modal-body alert alert-warning');
    	    	  $('#errorModal').modal();
    		} else {
    			if(confirm('Are you sure you want to delete the selected account?')){
    				//deleteAccount(selected_id);*/	
    				
    				
    				alert("length: "+selected_id.length+" id: "+selected_id);
    			}
    		}
    	});
    	  	
    }

    function deleteAccount(id){
    	$.ajax({
            type: "DELETE",
            url: '/users/'+id,
            success: function(response,status,xhr){
                	oTable.$('tr.row_selected').remove();
                	selected_id = null;
            },
    	    error: function (xhr, ajaxOptions, thrownError) {
    	  	  $('#errorModalLabel').html("Error Server "+xhr.status+":");
    	  	  $('#errorModalMsg').html(xhr.responseText);
    	  	  $('#errorModelBody').attr('class', 'modal-body error alert-error');
    	  	  $('#errorModal').modal();
    	    }
       });
    }
	
oTable =$('#accountable').dataTable({
	  "sDom": 'l<"toolbar">frtip',
	  "sPaginationType" : "bootstrap",
	  "aoColumns" : [ 
	     			/* id */ { "bSearchable": false, "bVisible": false },
	    			/* login */ null,
	    			/* name */ null,
	    			/* email */ null,
	    			/* role */ null,
	    			/* password */ { "bSearchable": false, "bVisible":  false }
		               ]

			               
	  });
  initCrudButtons();
} );