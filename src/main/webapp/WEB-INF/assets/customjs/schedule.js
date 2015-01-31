$(document).ready(function() {
    /* Add/remove class to a row when clicked on */
    $('#scheduletable tbody tr').click( function() {
    	oTable.$('tr.row_selected').removeClass('row_selected');
        $(this).toggleClass('row_selected');
    } );

    function initCrudButtons(){
    	$("div.toolbar").html('<a href="addschedule" id="bt_add" class="btn btn-primary">Create</a> <a href="#" id="bt_update" class="btn btn-success">Edit</a> <button id="bt_delete" type="button" class="btn btn-danger">Delete</button>');

    	$("#bt_delete").click(function() {     
    		var selected_id = oTable.$('tr.row_selected');            
    		if (selected_id.length == 0) { 
    	    	  $('#errorModalLabel').html('Warning:');
    	    	  $('#errorModalMsg').html('Please select a record first.');
    	    	  $('#errorModelBody').attr('class', 'modal-body alert alert-warning');
    	    	  $('#errorModal').modal();
    		} else {
    			if(confirm('Are you sure you want to delete the selected row?')){
    				deleteAccount(oTable.fnGetData(selected_id[0])[0]);	
    			}
    		}
    	});
    	  	
    }

    function deleteAccount(id){
    	$.ajax({
            type: "DELETE",
            url: 'schedule/'+id,
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
	
oTable =$('#scheduletable').dataTable({
	  "sDom": 'l<"toolbar">frtip',
	  "sPaginationType" : "bootstrap",
	  "aoColumns" : [ 
	     			/* id */ { "bSearchable": false, "bVisible": false },
	    			/* name */ null,
	    			/* login */ null,
	    			/* email */ null,
	    			/* begin */ null,
	    			/* comment */ null
		               ]

			               
	  });
  initCrudButtons();
} );
