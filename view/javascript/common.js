$(document).ready(function() {
  
    $('.inc').click(function(){
        var valu = $(this).parent().children('input').val();
        var va = $(this).parent().children('input');
        if(valu > 1){
            va.val(valu - 1);
            if($(this).hasClass('incc')){
                $(this).parents('form').submit();
            }                        
        }
    });
    
    $('.dec').click(function(){
        var valu = $(this).parent().children('input').val();
        var va = $(this).parent().children('input');
        va.val(+valu + 1);
        if($(this).hasClass('decc')){
            $(this).parents('form').submit();
        }
    });
    
    $('.dec_min').live("click", function(){
        var form = $(this).parent();
        var price = form.parent().parent().next(); 
        form.find('.quantity').val(+form.find('.quantity').val() + 1);
        $.ajax({
    		url: 'http://bioboom.ua/shopping-cart',
    		type: 'post',
            dataType: 'json',
    		data:  form.serialize(),
    		success: function(json) {
    				price.text(json['total']);
    		}
    	});
    });
    
    $('.inc_min').live("click", function(){
        var form = $(this).parent();
        var price = form.parent().parent().next(); 
        var quant = form.find('.quantity').val();
        
        if(quant > 1){
            form.find('.quantity').val(+quant - 1);
            
            $.ajax({
        		url: 'http://bioboom.ua/shopping-cart',
        		type: 'post',
                dataType: 'json',
        		data:  form.serialize(),
        		success: function(json) {
        				price.text(json['total']);
        		}
        	});
        }
    });
    $('#cart_pop_up .remove').live("click", function(){
        
        $('#top_cart').load('index.php?route=module/cart&remove=' + $(this).attr('data-key') + ' > *')
        
        /*-var product = $(this).parent().parent();
        $.ajax({
        		url: 'index.php?route=module/cart&remove=' + $(this).attr('data-key'),
        		type: 'post',
                dataType: 'json',
        		success: function(json) {
        		  product.fadeOut();
        		}
        	});-*/
    });
	
    /*-View left col-*/
    $(".catalog-menu li li.active").parent().parent().addClass('active');
    
	$('#header input[name=\'filter_name\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var filter_name = $('input[name=\'filter_name\']').attr('value');
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
    
    

    $('.search-field').each(function(){
    
       $(this).focus(function(){
        
         if (this.value == this.defaultValue) { 
            this.value = "";
            this.style.color = '#000' 
            } 
           }); 
           
         $(this).blur(function(){
        
        if (this.value == "") { 
            this.value = this.defaultValue 
            this.style.color = '#A7ACAF'
            } 
           }); 
            
    }); 
    
    	/* Ajax Cart */
/*-	$('.change_addr').live('click', function() {
	   if($('[data-id=courier_kiev]').css('display') == 'none'){
	       $('.delivery-addr').slideUp();
		   $('[data-id=courier_kiev]').slideDown();
        } else {
	       $('[data-id=courier_kiev]').slideUp();
	   }
    
	});-*/
    
    $("label[for='citylink.citylink']").live('click', function() {
	   if($('[data-id=courier_kiev]').css('display') == 'none'){
	       $('.delivery-addr').slideUp();
            $('[data-id=courier_kiev]').slideDown();
	   } else {
	       $('[data-id=courier_kiev]').slideUp();
	   }
    
    });
    
    $("label[for='novaposhta.novaposhta']").live('click', function() {
	   if($('[data-id=post]').css('display') == 'none'){
	       $('.delivery-addr').slideUp();
            $('[data-id=post]').slideDown();
	   } else {
	       $('[data-id=post]').slideUp();
	   }
    
    });
    
    $("label[for='pickup.pickup']").live('click', function() {
	   if($('[data-id=post]').css('display') == 'none'){
	       $('.delivery-addr').slideUp();
            $('[data-id=self]').slideDown();
	   } else {
	       $('[data-id=self]').slideUp();
	   }
    
    });
    
    $("label[for='flat.flat']").live('click', function() {
	   if($('[data-id=courier_region]').css('display') == 'none'){
	       $('.delivery-addr').slideUp();
            $('[data-id=courier_region]').slideDown();
	   } else {
	       $('[data-id=courier_region]').slideUp();
	   }
    
    });
    
    /*-SHOW PHONES HEADER-*/
    $('#header .work-time-container .show_phones, #header .work-time-container .call-us').click(function(e){
        e.preventDefault();
        $('#header .work-time-container .phones').slideToggle();
        $(this).toggleClass('active');
        return false;
    });
    $('.footer-work-time-container .work-time-container .show_phones, .footer-work-time-container .work-time-container .call-us').click(function(e){
        e.preventDefault();
        $('.footer-work-time-container .work-time-container .phones').slideToggle();
        $(this).toggleClass('active');
        return false;
    });
   /*- $('.work-time-container').click(function(){
        $('.work-time-container .phones').slideToggle();
        $(this).toggleClass('active');
        return false;
    });-*/
     
});

function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
			 
				$('html, body').animate({ scrollTop: 0 }, 'slow', function(){
                    $('#top_cart').load('index.php?route=module/cart > *', function(){
                        $('#top_cart .recipe-products').show(100, function(){
                            recipeProducts();                 
                        });
                    });
                }); 
             
             recipeProducts();
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#cart-total').html(json['total']);
				
			}	
		}
	});
    
    
    
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			/*-$('.success, .warning, .attention, .information').remove();-*/
						
			if (json['success']) {
			 /*-
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');-*/
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
                
                $('.add-to-favorite').addClass('inWish');
                $('.add-to-favorite').text('в моих желаниях');
			}	
		}
	});
}

function addToWaitlist(product_id) {
	$.ajax({
		url: 'index.php?route=account/waitlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
                $('.add-to-wait').html('в листе ожидания');
             
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}