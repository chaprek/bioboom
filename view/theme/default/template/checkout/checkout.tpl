<?php echo $header; ?>
<style type="text/css">
	.payment .buttons{
		display: none;
	}
</style>

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
                    <h1 class="personal-title"><?php echo $heading_title; ?> / Шаг 3</h1>
                    <div class="registration-container clearfix last-step">
                        <form id="checkout_form" onsubmit="return false;">
                            <div class="left-col">
                                <h3>Ваши данные</h3>
                                <div class="personal-data">
                                    <p><?php echo $firstname?> <?php echo $lastname?></p>
                                    <p>"<?php echo $telephone?></p>
                                    <p><?php echo $email?></p>
                                    <a href="#" class="change">Изменить данные</a>
                                    <input type="hidden" name="firstname" value="<?php echo $firstname?>"/>
                                    <input type="hidden" name="lastname" value="<?php echo $lastname?>"/>
                                    <input type="hidden" name="telephone" value="<?php echo $telephone?>"/>
                                    <input type="hidden" name="email" value="<?php echo $email?>"/>
                                    <input type="hidden" name="address_1" value="<?php echo $address_1?>" />
                                    <input type="hidden" name="city" value="<?php echo $city; ?>" />
                                    <input type="hidden" name="country_id" value="<? echo $country_id ?>" />
                                    <!--
                                    Скорее всего эта мотня будет тянуться аяксом после сохранения тоже аякс
                                    <p><input type="text" value="<?php echo $firstname?>></p>
                                    <p><input type="text" value="<?php echo $lastname?>"></p>
                                    <p><input type="text" value="<?php echo $telephone?>"></p>
                                    <p><input type="text" value="<?php echo $email?>"></p>
                                    <a href="#" class="btn-green">Сохранить</a>
                                    
                                    
                                    <input type="text" name="address_1" value="<?php echo $address_1?>" class="large-field"/>
                                    <input type="text" name="city" value="<?php echo $city; ?>" class="large-field" />
                                    
                                    <option value=""><?php echo $text_select; ?></option>
								      <?php foreach ($countries as $country) { ?>
								      <?php if ($country['country_id'] == $country_id) { ?>
								      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
								      <?php } else { ?>
								      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
								      <?php } ?>
								      <?php } ?>
                                      
                                      
                                    -->
                                </div>
                            </div>
                            <div class="mid-col">
                                <div class="item">
                        
                                    <h3>Способ доставки</h3>
                                    <div class="radio-group">
                                    <?php if(count($shipping_methods)>1) { ?>
                                    <?php foreach($shipping_methods as $shipping_method) { ?>
                                            <?php if(!$shipping_method['error']) { ?>
        									<?php foreach($shipping_method['quote'] as $quote) { ?>
                                            <p>
        									           <?php if($quote['code'] == $shipping_code || !$shipping_code) { ?>
                                                    
        												<?php $shipping_code = $quote['code']; ?>
        												<input type="radio" name="shipping_method"
        													   value="<?php echo $quote['code']; ?>"
        													   id="<?php echo $quote['code']; ?>" checked="checked"/>
        												<?php } else { ?>
        												<input type="radio" name="shipping_method"
        													   value="<?php echo $quote['code']; ?>"
        													   id="<?php echo $quote['code']; ?>"/>
        												<?php } ?>
        											<label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label></p>
    										<?php } ?>
                                    
                                   <?php } else{ ?>
                                        <p><input type="radio" name="delivery-type" id="courier_kiev"><label>Курьером по Киеву</label></p>
                                    <?php } ?>
                                    <?php } ?>
                                    <?php } else{ ?>
                                    
                                        <?php $shipping_method = array_shift($shipping_methods);?>
                                        
                                        <?php foreach($shipping_method['quote'] as $quote) { ?>
        									<p><label><?php echo $quote['title']; ?></label></p>
        								<?php }?>
                                        
                                    <?php } ?>
                                    </div>
                                </div>
                                <div class="item">
                                    <h3>Способ оплаты</h3>
                                    
                                    <div class="radio-group">
                                    <?php if($payment_methods) { ?>
								<?php foreach($payment_methods as $payment_method) { ?>
								
                                <?php if($payment_method['code'] == $payment_code || !$payment_code) { ?>
                                <p>
										<?php $code = $payment_method['code']; ?>
										<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>"
											   checked="checked"/>
										<?php } else { ?>
										<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>"/>
										<?php } ?>
									<label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></p>
								
                                
								<?php } ?>
							<?php } ?>
                            <div class="payment">
								<?php echo $payment?>
							</div>
                                    </div>
                                </div>
                                <a href="#" class="change"><?php echo $column_comment; ?></a>
                                <div class="comment-form clearfix hidden">
								<textarea rows="8" style="width: 300px" name="comment"><?php echo $comment?></textarea>
                                    <input type="submit" value="Отправить" class="btn-submit-gray">
                                </div>
                            </div>
<input type="hidden" name="agree" value="1" />


 <div class="right-col">
                                <h3>В Вашей корзине</h3>
                                <table class="table-total">
                                    <tbody>
                                        <tr>
                                            <td>Товаров</td>
                                            <td><?= $product_total ?></td>
                                        </tr>
                                        <tr>
                                            <td>Сумма</td>
                                            <td><?= $sum?></td>
                                        </tr>
                                        <tr>
                                            <td>Скидка</td>
                                            <td>10%</td>
                                        </tr>
                                        <tr>
                                            <td>Доставка</td>
                                            <td><?= $deliv?></td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td>Всего к оплате</td>
                                            <td><?= $allsum?></td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <div class="centered">
                                    <a id="confirm" class="btn-green">Оформить заказ</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="clear"></div>
</div>
</div>
					
<?php echo $payment?>
			
<!--<a id="confirm" class="button"><span><?php echo $button_confirm?></span></a>-->
								   

<?php echo $content_bottom; ?></div>
<script type="text/javascript">

	$('#confirm').live('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/checkout',
			type: 'post',
			data: $('#checkout_form').serialize(),
			dataType: 'json',
			beforeSend: function() {
				$('#confirm').bind('click', false);
				$('#confirm').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('#confirm').unbind('click', false);
				$('.wait').remove();
			},
			success: function(json) {
				$('.warning').remove();
				$('.error').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json.errors) {
					for (var key in json.errors) {
					    if (key == 'country_id') {
						$('#checkout .checkout-content select[name=\'' + key + '\']').
								after('<span class="error" >' + json.errors[key] + '</span>');
					    } else {
						$('#checkout .checkout-content input[name=\'' + key + '\']').
								after('<span class="error" >' + json.errors[key] + '</span>');
					    }
					}
					var eTop = $('#checkout').offset().top;
					$('html, body').animate({scrollTop: eTop}, 'slow');
				} else {
					if (json.result = "success") {
						var confirm_btn = $('#button-confirm');
						if (!confirm_btn){
							confirm_btn =$('.payment . buttons input.button')
						}
						confirm_btn.trigger('click');
					}
				}
			}
		});
	});

	$('input[name=payment_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_payment',
			type: 'post',
			data: 'payment_code='+$("input[name=payment_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 if (json.payment){
					 $(".payment").html(json.payment);
				 }
				 $(".checkout-product").unmask();
			}
		})
	});

	$('input[name=shipping_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_shipping',
			type: 'post',
			data: 'shipping_method='+$("input[name=shipping_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 $('#total_data').html(json['totals_data']);
				 $(".checkout-product").unmask();
			}
		})
	});

	//--></script>
<?php echo $footer; ?>
