$(function() {
    //init
    $(".basket").find("ul").append('<li data-id="0">'
        + '<span class="name" data-id="2">1 bedroom</span>'
        + '<input class="count" value="89" type="text">');
    $(".basket").find("ul").append('<li data-id="1">'
        + '<span class="name" data-id="1">1 bathroom</span>'
        + '<input class="count" value="20" type="text">');
    recalcTotal();

    $( "#catalog" ).accordion({
        activate: function(event, ui) {
            //var activeIndex = $("#catalog").accordion("option", "active");
            //console.log(activeIndex);
        }
    });

   // var refreshVal = 1;

    $("#selectable1, #selectable2").selectable({
         stop: function(event, ui) {

            $(event.target).children('.ui-selected').not(':first').removeClass('ui-selected');

                var basket = $(".basket"),
                    itemId = basket.find("ul li[data-id='" + $("#catalog").accordion("option", "active") + "']");

                if (itemId.html() != null) {
                    if (itemId.find("span").attr("data-id")===$(event.target).children('.ui-selected').attr("data-id")) {
                        itemId.remove();
                        $(event.target).children('.ui-selected').removeClass('ui-selected');
                    } else {
                        itemId.find("span").attr("data-id",$(event.target).children('.ui-selected').attr("data-id"));
                        itemId.find("span").html($(event.target).children('.ui-selected').html());
                        itemId.find("input").val($(event.target).children('.ui-selected').val());
                    }
                }
                else {
                    basket.find("ul").append('<li data-id="' +  $("#catalog").accordion("option", "active") + '">'
                        + '<span class="name" data-id="'+$(event.target).children('.ui-selected').attr("data-id")+'">'
                        + $(event.target).children('.ui-selected').html()
                        + '</span>'
                        + '<input class="count" value="'+$(event.target).children('.ui-selected').val()+'" type="text">');
                }
             recalcTotal();
    	 }

    		            });

    $('#selectable3 li').click(function(){
        if($(this).hasClass('ui-selected')){
            $(this).removeClass('ui-selected');
            $(".basket").find("ul span[data-id='" + $(this).attr("data-id") + "']").parent("li").remove();
        }else{
            $(this).addClass('ui-selected');
            $(".basket").find("ul").append('<li data-id="' +  $("#catalog").accordion("option", "active") + '">'
                + '<span class="name" data-id="'+$(this).attr("data-id")+'">'
                + $(this).html()
                + '</span>'
                + '<input class="count" value="'+$(this).val()+'" type="text">');
        }
        recalcTotal();
    });


    function recalcTotal () {
        $(".basket").find(".total").html('$'+$("[class^=count]").sum());
    }
    
    $('.carousel').carousel({
    	pause: true,
    	interval: false
    	});


    
//---------------------
	var items = [];
	var month =  ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	var day = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fri', 'Sa'];
    var dt = new Date();
    
	$.ajax({
        type: "GET",
        url: 'book/calendar',
	    contentType: "application/json",            
    success: function(response){        	
    	 allExistingDates=JSON.parse(response);
    	 items.push('<div class="week item active">');
    	 for(var i=0;i<allExistingDates.length;i++){
    		 dt = new Date((allExistingDates[i].day).replace(/-/gi,'/')); 
    		 //console.log((allExistingDates[i].day).replace(/-/gi,'/'));
    		 
    		 if ((0 == i%7)&&(0 != i)) (items.push('</div><div class="week item">'));  
   		     items.push('<div class="day">');
		     items.push('<label class="header">'+day[dt.getDay()]+'<br>'+month[dt.getMonth()]+' '+dt.getDate()+'</label>');
			 
    		  $.each(allExistingDates[i].hours, function(key, hour) {
				  //console.log(key + " : " + hour);  
				  dt = new Date(hour);
		          items.push('<label class="radio">');
		    	  items.push('<input name="radio_buttons" value="'+hour+'" type="radio">'+dt.getHours()+'</label>');
			  });
    		  items.push('</div>'); 
		  }
    	 items.push('</div>');
    	 $('<div/>', {'class': 'carousel-inner', html: items.join('')}).appendTo('.carousel');
    	 console.log(items);
    	 
    	 $("input[name*='radio_buttons']").click(function(){
       	    	$('label.radio.active').removeClass('active');
       	    	$(this).parent().addClass('active');
       	    	console.log($(this).val());
       	 });    	 
		  
        } //success
   });
	

});
