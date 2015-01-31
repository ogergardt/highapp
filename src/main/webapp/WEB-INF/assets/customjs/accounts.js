$(document).ready(function() {
    /* Add/remove class to a row when clicked on */
    $('#accountable tbody tr').click( function() {
    	oTable.$('tr.row_selected').removeClass('row_selected');
        $(this).toggleClass('row_selected');
    } );

    function initCrudButtons(){
    	$("div.toolbar").html('<a href="adduser" id="bt_add" class="btn btn-primary">Create</a> <a id="bt_update" class="btn btn-success">Edit</a> <button id="bt_delete" type="button" class="btn btn-danger">Delete</button>');

    	$("#bt_update").click(function() {
    		var selected_id = oTable.$('tr.row_selected');
    		if (selected_id.length == 0) {
    	    	  $('#errorModalLabel').html('Warning:');
    	    	  $('#errorModalMsg').html('Please select a record first.');
    	    	  $('#errorModelBody').attr('class', 'modal-body alert alert-warning');
    	    	  $('#errorModal').modal();
    		} else {
    			$("#bt_update").attr("href", "updateuser_" + oTable.fnGetData(selected_id[0])[0]);
    		}
    	});
    	
    	$("#bt_delete").click(function() {     
    		var selected_id = oTable.$('tr.row_selected');            
    		if (selected_id.length == 0) { 
    	    	  $('#errorModalLabel').html('Warning:');
    	    	  $('#errorModalMsg').html('Please select a record first.');
    	    	  $('#errorModelBody').attr('class', 'modal-body alert alert-warning');
    	    	  $('#errorModal').modal();
    		} else {
    			if(confirm('Are you sure you want to delete the selected account?')){
    				deleteAccount(oTable.fnGetData(selected_id[0])[0]);	
    			}
    		}
    	});
    	  	
    }

    function deleteAccount(id){
    	$.ajax({
            type: "DELETE",
            url: 'users/'+id,
        success: function(response,status,xhr){        	
    		oTable.fnDeleteRow( oTable.fnGetPosition($("tr.row_selected")[0]) );
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

