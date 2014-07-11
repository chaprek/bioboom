<?php echo $header; ?>

<div id="main">
    <div class="wrapper" role="main">
        <div class="container">
            <div class="page">
                <div class="breadcrumbs">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                        <?php } ?>
                    </div>
           <div class="main-content clearfix">
           
                    <h1 class="personal-title cart-title"><?php echo $heading_title; ?></h1>
                    <div class="cart-wrap clearfix">
                     <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
     
                        <table class="cart hidden480">
                        <?php foreach ($products as $product) { ?>
                            <tr>
                                <td class="dlt"><a href="<?php echo $product['remove']; ?>" class="remove"></a></td>
                                <td class="thumb">
                                      <?php if ($product['thumb']) { ?>
                                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                      <?php } ?>
                                </td>
                                <td class="info">
                                                                
                                    <p><a href="<?php echo $product['href']; ?>" style="<?= (!$product['stock'])?'color: #ad0000;':''?>"><?php echo $product['name']; ?></a></p>
                                    <p>
                                    <?php foreach ($product['option'] as $option) { ?>
                                    <?php echo $option['name']; ?>: <?php echo $option['value']; ?><br />
                                    <?php } ?>
                                    </p>
                                    <p class="price"><?php echo $product['price']; ?></p>
                                </td>
                                <td class="count">
                                    <div class="trade-count">
                                        <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" />
                                        <button type="button" class="inc incc"></button>
                                        <button type="button" class="dec decc"></button>
                                    </div>
                                </td>
                                <td class="total"><?php echo $product['total']; ?></td>
                            </tr>
                  <? }?>
                        </table>
                        
                        </form>
                        
                        <div class="cart cart480">
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <? $all_num = 0;?>
                        <?php foreach ($products as $product) { ?>
                            <div class="item">
                                <div class="dlt"><a href="<?php echo $product['remove']; ?>" class="remove"></a></div>
                                <div class="thumb row">
                                      <?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                      <?php } ?>
                                </div>
                                <div class="info row">
                                    <p><a href="<?php echo $product['href']; ?>" style="<?= (!$product['stock'])?'color: #ad0000;':''?>"><?php echo $product['name']; ?></a></p>
                                    <p>
                                    <?php foreach ($product['option'] as $option) { ?>
                                    <?php echo $option['name']; ?>: <?php echo $option['value']; ?><br />
                                    <?php } ?>
                                    </p>
                                    <p class="price"><?php echo $product['price']; ?></p>
                                </div>
                                <div class="count row">
                                    <div class="trade-count">
                                        <input type="text"  name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity'];?>" />
                                        <button type="button" class="inc incc"></button>
                                        <button type="button" class="dec decc"></button>
                                    </div>
                                </div>
                                <div class="total row"><?php echo $product['total']; ?></div>
                            </div>
                        <? }?>
                        </form>
                        </div>
                        <div class="cart-coupon-container">
                        
                        
                        
                        <div id="coupon"  class="item">
                        <h3>Использовать купон</h3>
                        
                          <form action="<?php echo $action; ?>" method="post" class="aaa" enctype="multipart/form-data">
                            <input type="text" name="coupon" placeholder="<?php echo $entry_coupon; ?>" value="" />
                            <input type="hidden" name="next" value="coupon" />
                            &nbsp;
                            <a class="help-coupon" style="cursor: pointer;">Как получить купон</a>
                            <input type="submit"  class="btn-submit-gray" value="Применить" class="button" />
                          </form>
                                                    
                          <?php if ($attention) { ?>
                            <div class="attention"><?php echo $attention; ?><!--<img src="catalog/view/theme/default/image/close.png" alt="" class="close" />--></div>
                            <?php } ?>
                            <?php if ($success) { ?>
                            <div class="success"><?php echo $success; ?><!--<img src="catalog/view/theme/default/image/close.png" alt="" class="close" />--></div>
                            <?php } ?>
                            <?php if ($error_warning) { ?>
                            <div class="warning" style="color: #ad0000;"><?php echo $error_warning; ?><!--<img src="catalog/view/theme/default/image/close.png" alt="" class="close" />--></div>
                            <?php } ?>
                        </div>
    
                            
                            
                            <div class="item">
                        
                            
                            
                            <table>
                            <?php foreach ($vouchers as $vouchers) { ?>
                              <tr>
                                <td class="image"></td>
                                <td class="name"><?php echo $vouchers['description']; ?></td>
                                <td class="model"></td>
                                <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
                                  &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
                                <td class="price"><?php echo $vouchers['amount']; ?></td>
                                <td class="total"><?php echo $vouchers['amount']; ?></td>
                              </tr>
                              <?php } ?>
                              </table>
                              
                              
                              
                                <table class="min-order">
                                    <tr style="border-bottom: 1px solid #CCCCCC;">
                                        <td><p>Бесплатная доставка по Киеву и Украине</p></td>
                                        <td>
                                        <p style="color: #ccc;">от </p>                                        
                                        <span>501<sup>*</sup></span> грн</td>
                                    </tr>
                                    <tr>
                                        <td>Бесплатная доставка по Киевской области</td>
                                        <td>
                                        <p  style="color: #ccc;">от </p>  
                                        <span>1001<sup>*</sup></span> грн</td>
                                    </tr>
                                </table>
                                <div class="notice">* с учетом скидок</div>
                            </div>
                            <div class="item">
                                <table class="coupon-total">
                                    <tr>
                                        <td>Товаров</td>
                                        <td><?= $all_num?></td>
                                    </tr>
                                    <tr>
                                        <td>Сумма</td>
                                        <td><span><?= $allsum?></span></td>
                                    </tr>
                                    <tr>
                                        <td>Скидка</td>
                                        <td><?= $coupon_sum?></td>
                                    </tr>
                                </table>
                                <a <?= ($isLogged)?'href="'.$checkout.'"':'' ?> class="btn-green <?= ($isLogged)?'':'fancy-login'?>"><?php echo $button_checkout; ?></a>
                            </div>
                        </div>
                    </div>
                    
                    <? if(!$isLogged || !$wishes){?>
                        <?php echo $content_bottom; ?>
                    <? } else {?>
                    <div class="cart-wishes">
                        <h2 class="personal-title">Мои желания</h2>
                        <div class="catalog grid catalog-page catalog-wishes">
                            <div class="items">
                            
                            <?php if ($wishes) { ?>
                                    <?php foreach ($wishes as $product) { ?>
                                    <article class="item"  id="wishlist-row<?php echo $product['product_id']; ?>">
                                    <?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>" class="thumb">
                                            <div>
                                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                                                <div href="<?php echo $product['remove']; ?>" class="delete"></div>
                                            </div>
                                        </a>
                                    <?php } ?>
                                    <div class="content">
                                                <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                                <div class="price"><?php echo $product['price']; ?></div>
                                                <div class="excerpt">
                                                    <p></p>
                                                </div>
                                                <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="add-to-cart" title="Добавить в корзину"></a>
                                            </div>
                                        </article>
                                    
                                     <?php } ?>
                            
                            <?php } ?>
                            </div>
                        </div>
                    </div>
                    
                    <? }?>
                    
                    
                    
                </div>
            </div>
        </div>
    </div>
    <div id="clear"></div>
    
    <div class="pop_up" style="height: auto;">
        <h3>Не упустите свой шанс получить купон на скидку:</h3>
        <p>- Посещайте нашу страничку на Facebook или Вконтакте</p>
        <p>- Подписывайтесь на электронную рассылку</p>
        <p>- Регулярно входите в свой профиль в магазине</p>
        <p class="ext">* В корзине Вы можете активировать ТОЛЬКО ОДИН код купона.</p>
        <div class="exit">X</div>
    </div>
    
</div>
</div>


 
 
  <!--
  <div class="cart-total">
    <table id="total">
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td class="right"><b><?php echo $total['title']; ?>:</b></td>
        <td class="right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </table>
  </div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $checkout; ?>" class="button"><?php echo $button_checkout; ?></a></div>
    <div class="center"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_shopping; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
  -->
  
<script type="text/javascript"><!--
/*-$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();
	
	$('#' + this.value).show();
});-*/
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--

$('.help-coupon').click(function(){
   $('.pop_up').fadeIn(); 
});
$('.exit').click(function(){
   $('.pop_up').fadeOut(); 
});

$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				}	
							
				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio">';
				
				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}
								
							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				
				$.colorbox({
					overlayClose: true,
					opacity: 0.5,
					width: '600px',
					height: '400px',
					href: false,
					html: html
				});
				
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php } ?>
<?php echo $footer; ?>