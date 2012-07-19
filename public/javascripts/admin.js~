$(document).ready(function() {
	$.ajaxSetup({
  	beforeSend: function(xhr) {
    	xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  	}
	});
	
	//аккордион для админского меню
	$('#admin_menu ul > li ul').click(function(e) { e.stopPropagation(); }).hide(); //.filter(':not(:first)').hide();
	$('#admin_menu ul > li').click(function() {
		var selfClick = $(this).find('ul:first').is(':visible');
		if (selfClick) { return; }
		
		$(this).parent().find('> li ul:visible').slideToggle();
		$(this).find('ul:first').stop(true, true).slideToggle();		
	});
	
	jQuery.fn.butEffect = function() {
		$('#send_pokaz').button();
		$('#date_but').buttonset();
		$('#mesto').buttonset();
		$('#add_pokaz').button();
	};
	$('body').butEffect();
	
	$("#add_pokaz_TEMP").click(function() { 
    $.ajax({
          type: "GET",
          url: "pokazs/new.js",//+id+".js",
          //data: 'sdf', //$("#new_task").serialize(), //({name : new_name}),
          success: function(data){
            //if (data["success"]) { color = 'green'; }
            //var firm = data["firm"].firm;
            //alert(firm.name);
            //elem.html('<form action="firms/update">'+firm.name+'</form>');
            //$("#response-for-name").html(data["firm"]).css('color',color);
          }
    });
    return;
  });
  
});
