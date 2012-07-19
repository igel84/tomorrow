$(document).ready(function() {	
	
	$('#logo').click(function() {
		window.location = 'http://2morrowfest.ru';
	});
	
	//$('#video_center').click(function() { alert('sfsd'); });
	
	$("#video_main").fancybox({
    	zoomSpeedIn: 0,
    	zoomSpeedOut:0,
    	frameWidth: 640,
    	frameHeight: 360
    });
	
	//меню на главной
	$('#menu_but ul li ul').css({	display:'none', left:'auto'	});	
	$('#menu_but ul li').hover(
		function() {
			var br, ht, wd
			if (!$(this).hasClass("acts_but"))
			{
				br = $(this).offset(); //find('a').
			 	ht = $(this).height(); 
			 	wd = $(this).width(); 
			}
			else 
			{ 
				br = $(this).parent().find('.for_acts').offset(); //find('a').
			 	ht = $(this).parent().find('.for_acts').height(); 
			}
			//if ($(this).find('a').hasClass('kale')) { 
			//	
			//	$(this).find('ul').css({ 'top': '180px', 'left': (br.left-100) }); 
			//}
			//else { 
			//alert('asadf');
			$(this).find('ul').css({ 'top': '367px', 'left': br.left});
			//$(this).find('ul > li').css({ 'top': '180px', 'left': br.left, 'width': wd }); 
			//}
			$(this).find('ul').stop(true, true).slideDown('fast');
		},
		function() { $(this).find('ul').stop(true, true).fadeOut('fast'); });
	
	//основное меню
	$('#main_menu li ul').css({	display:'none', left:'auto'	});
	$('#main_menu li').hover(
		function() {
			var br, ht, wd
			if (!$(this).hasClass("acts_but"))
			{
				br = $(this).find('a').offset(); //find('a').
			 	ht = $(this).find('a').height(); 
			 	wd = $(this).find('a').width(); 
			}
			else 
			{ 
				br = $(this).parent().find('.for_acts').offset(); //find('a').
			 	ht = $(this).parent().find('.for_acts').height(); 
			}
			//if ($(this).find('a').hasClass('kale')) { 
			//	
			//	$(this).find('ul').css({ 'top': '180px', 'left': (br.left-100) }); 
			//}
			//else { 
			$(this).find('ul').css({ 'top': '180px', 'left': br.left});
			//$(this).find('ul > li').css({ 'top': '180px', 'left': br.left, 'width': wd }); 
			//}
			$(this).find('ul').stop(true, true).slideDown('fast');
		},
		function() { $(this).find('ul').stop(true, true).fadeOut('fast'); });
	
	//изменение размера фото, если превышает ширину экрана
	//alert($("#main_img").parent().parent().width());
	var brWidth = $.browser.opera? window.innerWidth : $(window).width();
	//alert(brWidth);
	if ($("#main_img").parent().parent().width() > (brWidth-400))
	{
		//alert('dsf');
		$("#main_img").css({ width: (brWidth-400) });
	}
	//лента новостей	
	var scrWidth = $('table#main').width()-293; //$(document).width()-293;
	$('div.sc_menu').css({ width: scrWidth });
	var div = $('div.sc_menu'),
		ul = $('ul.sc_menu'),
		ulPadding = 15;
	
	//Get menu width
	var divWidth = div.width();
 
	//Remove scrollbars	
	div.css({overflow: 'hidden'});
	
	//Find last image container
	var lastLi = ul.find('li:last-child');
	
	//When user move mouse over menu
	div.mousemove(function(e){
		//As images are loaded ul width increases,
		//so we recalculate it each time
		var ulWidth = lastLi[0].offsetLeft + lastLi.outerWidth() + ulPadding;	
		var left = (e.pageX - div.offset().left) * (ulWidth-divWidth) / divWidth;
		div.scrollLeft(left);
	});

});
