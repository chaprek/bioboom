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
                                    <p class="fnam"><?php echo $firstname?> <?php echo $lastname?></p>
                                    <p><?php echo $telephone?></p>
                                    <p><?php echo $email?></p>
                                   <!-- <a href="#" class="change">Изменить данные</a>-->
                                    <input type="hidden" name="firstname" value="<?php echo $firstname?>"/>
                                    <input type="hidden" name="email" value="<?php echo $email?>"/>
                                    
                                    <? if(!empty($city)){?>
                                                                        
                                    <input type="hidden" name="city" value="<?php echo $city; ?>" />
                                    
                                    <?} else {?>
                                    <input type="hidden" name="city" value="Киев" />
                                    <? }?>
                                    
                                    <? if(isset($telephone) && $telephone != ""){?>
                                    <input type="hidden" name="address_1" value="<?php echo $address_1?>" />
                                    <input type="hidden" name="country_id" value="<? echo $country_id ?>" />
                                    <input type="hidden" name="lastname" value="<?php echo $lastname?>"/>
                                    <input type="hidden" name="telephone" value="<?php echo $telephone?>"/>
                                    
                                    <p class="change_checkout"><input type="text" name="telephone" value="<?php echo $telephone?>" placeholder="Введите Ваш телефон" /></p>
                                    <p class="change_checkout"><input type="text" name="firstname" value="<?php echo $firstname?>" placeholder="Введите Ваше имя" /></p>
                                    <? } else {?>
                                    
                                    <input type="hidden" name="address_1" value="<?php echo $address_1?>" />
                                    <p><input type="text" name="telephone" value="<?php echo $telephone?>" placeholder="Введите Ваш телефон" /></p>
                                    
                                    <p class="change_checkout"><input type="text" name="firstname" value="<?php echo $firstname?>" placeholder="Введите Ваше имя" /></p>
                                    
                                    <? }?>
                                    <p class="change_check">Изменить данные</p>
                                    
                                </div>
                            </div>
                            <div class="mid-col">
                                <div class="item">
                        
                                    <h3>Способ доставки</h3>
                                  <!--  <div class="your-address">
                                        Адрес Вашей доставки:<br/>
                                        <?php echo $city; ?><br/>
                                        <?php echo $address_1?>
                                        <div class="del_cost">Стоимость доставки - <span id="total_data" class="free_del"><?= $deliv?></span></div>
                                        <a class="change_addr">Изменить адрес</a>
                                    </div>-->
                                    <div class="radio-group ship">
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
            											<label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label>
                                                    </p>
                                                        
                                                        
                                                        <? if(strpos($quote['code'], 'citylink') !== false && ($quote['code'] == $shipping_code || !$shipping_code) && empty($address_1)){?>
                                                            <div class="delivery-addr" data-id="courier_kiev" style="display: block;">
                                                                <div class="row">
                                                                    <label>Адресс</label>
                                                                    <input type="text" name="street_kiev" value="<?= (!empty($address_1))?$address_1:''?>" placeholder="Введите адресс" />
                                                                </div>
                                                            </div>
                                                        <? } elseif(strpos($quote['code'], 'pickup') !== false){?>
                                                            <div class="delivery-addr" data-id="self">                                                                                                            
                                                               <p> Вы можете забрать свой заказ самостоятельно из магазина. </p>
                                                               <p> Адрес: Киев, просп.. Героев Сталинграда 8 (корпус 7). 
                                                                Время работы: ежедневно с 10:00 до 20:00)</p>
                                                            </div> 
                                                        <? } elseif(strpos($quote['code'], 'flat') !== false){?>
                                                         <div class="delivery-addr" data-id="courier_region">
                                                            <div class="row">
                                                                <label>Населенный пункт</label>
                                                                <div class="c-select">
                                                                    <div class="pointer"></div>
                                                                    <select name="city_kiev">
                                                                        <option value="">Выберите город</option>
                                                                        <option value="Вишгород">Вишгород</option>
                                                                        <option value="Осещина">Осещина</option>
                                                                        <option value="Нові Петрівці">Нові Петрівці</option>
                                                                        <option value="Старі Петрівці">Старі Петрівці</option>
                                                                        <option value="Лютіж">Лютіж</option>
                                                                        <option value="Демидів">Демидів</option>
                                                                        <option value="Литвинівка">Литвинівка</option>
                                                                        <option value="Козаровичі">Козаровичі</option>
                                                                        <option value="Димер">Димер</option>
                                                                        <option value="Тарасівщина">Тарасівщина</option>
                                                                        <option value="Гаврилівка">Гаврилівка</option>
                                                                        <option value="Синяк">Синяк</option>
                                                                        <option value="Вороньківка">Вороньківка</option>
                                                                        <option value="Червоне">Червоне</option>
                                                                        <option value="Гута-Межигірська">Гута-Межигірська</option>
                                                                        <option value="Раківка">Раківка</option>
                                                                        <option value="Лубянка">Лубянка</option>
                                                                        <option value="Озера">Озера</option>
                                                                        <option value="Мощун">Мощун</option>
                                                                        <option value="Гостомель">Гостомель</option>
                                                                        <option value="Горенка">Горенка</option>
                                                                        <option value="Буча">Буча</option>
                                                                        <option value="Ірпінь">Ірпінь</option>
                                                                        <option value="Коцюбинське">Коцюбинське</option>
                                                                        <option value="Стоянка">Стоянка</option>
                                                                        <option value="Капітанівка">Капітанівка</option>
                                                                        <option value="Дмитрівка">Дмитрівка</option>
                                                                        <option value="Мила">Мила</option>
                                                                        <option value="Михайлівка-Рубежівка">Михайлівка-Рубежівка</option>
                                                                        <option value="Ворзель">Ворзель</option>
                                                                        <option value="Блиставиця">Блиставиця</option>
                                                                        <option value="Мироцьке">Мироцьке</option>
                                                                        <option value="Немішаєве">Немішаєве</option>
                                                                        <option value="Микуличі">Микуличі</option>
                                                                        <option value="Клавдієво-Тарасове">Клавдієво-Тарасове</option>
                                                                        <option value="Діброво-Ленінське">Діброво-Ленінське</option>
                                                                        <option value="Лісне">Лісне</option>
                                                                        <option value="Мрія">Мрія</option>
                                                                        <option value="Гурівщина">Гурівщина</option>
                                                                        <option value="Любимівка">Любимівка</option>
                                                                        <option value="Козинці">Козинці</option>
                                                                        <option value="Хмільна">Хмільна</option>
                                                                        <option value="Березівка">Березівка</option>
                                                                        <option value="Бузова">Бузова</option>
                                                                        <option value="Колощина">Колощина</option>
                                                                        <option value="Северинівка">Северинівка</option>
                                                                        <option value="Ясногородка">Ясногородка</option>
                                                                        <option value="Неграші">Неграші</option>
                                                                        <option value="Личанка">Личанка</option>
                                                                        <option value="Шпитьки">Шпитьки</option>
                                                                        <option value="Петрушки">Петрушки</option>
                                                                        <option value="Горбовичі">Горбовичі</option>
                                                                        <option value="Гореничі">Гореничі</option>
                                                                        <option value="Білогородка">Білогородка</option>
                                                                        <option value="Шевченкове">Шевченкове</option>
                                                                        <option value="Музичі">Музичі</option>
                                                                        <option value="Лука">Лука</option>
                                                                        <option value="Вишневе">Вишневе</option>
                                                                        <option value="Крюківщина">Крюківщина</option>
                                                                        <option value="Гатне">Гатне</option>
                                                                        <option value="Тарасівка">Тарасівка</option>
                                                                        <option value="Боярка">Боярка</option>
                                                                        <option value="Юрівка">Юрівка</option>
                                                                        <option value="Чабани">Чабани</option>
                                                                        <option value="Віта-Поштова">Віта-Поштова</option>
                                                                        <option value="Хотів">Хотів</option>
                                                                        <option value="Нове">Нове</option>
                                                                        <option value="Забіря">Забіря</option>
                                                                        <option value="Княжичі">Княжичі</option>
                                                                        <option value="Жорнівка">Жорнівка</option>
                                                                        <option value="Бобриця">Бобриця</option>
                                                                        <option value="Малютянка">Малютянка</option>
                                                                        <option value="Іванків">Іванків</option>
                                                                        <option value="Глеваха">Глеваха</option>
                                                                        <option value="Липовий Скиток">Липовий Скиток</option>
                                                                        <option value="Варовичі">Варовичі</option>
                                                                        <option value="Кожухівка">Кожухівка</option>
                                                                        <option value="Хотянівка">Хотянівка</option>
                                                                        <option value="Новосілка">Новосілка</option>
                                                                        <option value="Лебедівка">Лебедівка</option>
                                                                        <option value="Нижча Дубечня">Нижча Дубечня</option>
                                                                        <option value="Вища Дубечня">Вища Дубечня</option>
                                                                        <option value="Пірнове">Пірнове</option>
                                                                        <option value="Воролаїв">Воролаїв</option>
                                                                        <option value="Літки">Літки</option>
                                                                        <option value="Рожни">Рожни</option>
                                                                        <option value="Пухівка">Пухівка</option>
                                                                        <option value="Погреби">Погреби</option>
                                                                        <option value="Зазимя">Зазимя</option>
                                                                        <option value="Рожівка">Рожівка</option>
                                                                        <option value="Скибин">Скибин</option>
                                                                        <option value="Бровари">Бровари</option>
                                                                        <option value="Княжичі">Княжичі</option>
                                                                        <option value="Перемога">Перемога</option>
                                                                        <option value="Велика Димерка">Велика Димерка</option>
                                                                        <option value="Димитрове">Димитрове</option>
                                                                        <option value="Красилівка">Красилівка</option>
                                                                        <option value="Требухів">Требухів</option>
                                                                        <option value="Мала Олександрівка">Мала Олександрівка</option>
                                                                        <option value="Щасоиве">Щасоиве</option>
                                                                        <option value="Гора">Гора</option>
                                                                        <option value="Бориспіль">Бориспіль</option>
                                                                        <option value="Гнідин">Гнідин</option>
                                                                        <option value="Вишеньки">Вишеньки</option>
                                                                        <option value="Матрусівка">Матрусівка</option>
                                                                        <option value="Проців">Проців</option>
                                                                        <option value="Козин">Козин</option>
                                                                        <option value="Таценки">Таценки</option>
                                                                        <option value="Українка">Українка</option>
                                                                        <option value="Обухів">Обухів</option>
                                                                        <option value="Нещерів">Нещерів</option>
                                                                        <option value="Нові Безрадичі">Нові Безрадичі</option>
                                                                        <option value="Старі Безрадичі">Старі Безрадичі</option>
                                                                        <option value="Плюти">Плюти</option>
                                                                        <option value="Креничі">Креничі</option>
                                                                        <option value="Підгірці">Підгірці</option>
                                                                        <option value="Романків">Романків</option>
                                                                        <option value="Великі Дмитровичі">Великі Дмитровичі</option>
                                                                        <option value="Малі Дмитровичі">Малі Дмитровичі</option>
                                                                        <option value="Гвоздів">Гвоздів</option>
                                                                        <option value="Рославичі">Рославичі</option>
                                                                        <option value="Ходосівка">Ходосівка</option>
                                                                        <option value="Лісники">Лісники</option>
                                                                        <option value="Круглик">Круглик</option>
                                                                        <option value="Кременище">Кременище</option>
                                                                        <option value="Васильків">Васильків</option>
                                                                        <option value="Мархалівка">Мархалівка</option>
                                                                        <option value="Зелений Бір">Зелений Бір</option>
                                                                        <option value="Крушина">Крушина</option>
                                                                        <option value="Борисів">Борисів</option>
                                                                        <option value="Залізне">Залізне</option>
                                                                        <option value="Кобці">Кобці</option>
                                                                        <option value="Березанщина">Березанщина</option>
                                                                        <option value="Путрівка">Путрівка</option>
                                                                        <option value="Зайців">Зайців</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <label>Адресс</label>
                                                                <input type="text" name="street_obl"  value="<?= (!empty($address_1))?$address_1:''?>" placeholder="Введите адресс"/>
                                                            </div>
                                                        </div>   
                                                        <? } elseif(strpos($quote['code'], 'novaposhta') !== false){?>
                                                            <div class="delivery-addr" data-id="post">
                                                                <div class="row">
                                                                    <label>Населенный пункт</label>
                                                                    <div class="c-select">
                                                                        <div class="pointer"></div>
                                                                        <select name="city_nova">
                                                                        <? if($newpost_cities){?>
                                                                            <option>Выберите город</option>                                                                                                                                                                                                
                                                                            <? foreach($newpost_cities as $city){?>
                                                                                <option value="<?= $city ?>"><?= $city ?></option>
                                                                            <? }?>
                                                                        <? }?>                                                                                                                                                                                                            
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <label>№ склада</label>
                                                                    <div id="branches" class="c-select">
                                                                        <div class="pointer"></div>
                                                                        <select name="number">
                                                                            <option>Выберите город</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <? }?>
        										<?php } ?>
                                        
                                               <?php } else{ ?>
                                                    <p><input type="radio" name="delivery-type" id="courier_kiev" /><label>Курьером по Киеву</label></p>
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
                                
                                <div class="item" style="margin-top: 15px">
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
                                            <td style="text-align: right;"><?= $coupon_sum?> грн.</td>
                                            <input type="hidden" name="discount" value="<?= $coupon_sum?>" />
                                        </tr>
                                        <tr>
                                            <td>Доставка</td>
                                            <td style="text-align: right;" class="deliv"><?= $deliv?></td>
                                            <input class="deliv_hidden" type="hidden" name="shipping_price" value="<?= $deliv?>" />
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td>Всего к оплате</td>
                                            <td class="totall"><?= $allsum?></td>
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
								
<a id="confirm" class="button"><span><?php echo $button_confirm?></span></a>
								   


<?php //echo $content_bottom; ?></div>
<script type="text/javascript">

$('.change_check').live('click', function(){
    $('.change_checkout').show();
    $('.fnam').remove();
    $(this).remove();
});


$('.ship input[type=radio]:checked').parent().next().slideDown();

	$('#confirm').live('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/checkout',
			type: 'post',
			data: $('#checkout_form').serialize(),
			dataType: 'json',
			beforeSend: function() {
				$('#confirm').bind('click', false);
				/*-$('#confirm').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');-*/
			},
			complete: function() {
				$('#confirm').unbind('click', false);
				$('.wait').remove();
			},
			success: function(json) {
				$('.warning').remove();
				$('.error').remove();

				/*-if (json['redirect']) {
					location = json['redirect'];
				}-*/

				if (json.errors) {
					for (var key in json.errors) {
					   if (key == 'country_id') {
						$('#checkout_form select[name=\'' + key + '\']').
								after('<p class="error" >' + json.errors[key] + '</p>');
					    } else {
						$('#checkout_form input[name=\'' + key + '\']').
								after('<p class="error" >' + json.errors[key] + '</p>');
					    
					   }
                    }
					var eTop = $('#checkout_form').offset().top;
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
    
    $('select[name=city_nova]').live('change', function() {
                    
            $('#branches').load('index.php?route=checkout/checkout/chose_warens&city=' + $(this).val() + ' > *');
            
            $(".checkout-product").mask();
            $.ajax({
			url: 'index.php?route=checkout/checkout/change_shipping',
			type: 'post',
			data: 'shipping_method='+$("input[name=shipping_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 $('#total_data').html(json['totals_data']['deliv']);
				 $('.deliv').html(json['totals_data']['deliv']);
				 $('.deliv_hidden').val(json['totals_data']['deliv']);
				 $('.totall').html(json['totals_data']['total']);
				 $(".checkout-product").unmask();
			}
		})
                
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
				 $('#total_data').html(json['totals_data']['deliv']);
				 $('.deliv').html(json['totals_data']['deliv']);
				 $('.deliv_hidden').val(json['totals_data']['deliv']);
				 $('.totall').html(json['totals_data']['total']);
				 $(".checkout-product").unmask();
			}
		})
	});

	//--></script>
    
    <!--HOUSES FLATS DELETE-->
 <!-- <div class="row clearfix">
                                            <div class="col">
                                                <label>Дом</label>
                                                <input type="number" name="house_kiev" value="" />
                                            </div>
                                            <div class="col">
                                                <label>Квартира</label>
                                                <input type="number" name="flat_kiev" value="" />
                                            </div>
                                        </div>
                                        <div class="row clearfix">
                                            <div class="col">
                                                <label>Подъезд</label>
                                                <input type="number" name="entrance_kiev" value="" />
                                            </div>
                                            <div class="col">
                                                <label>Этаж</label>
                                                <input type="number" name="flour_kiev" value=""/>
                                            </div>
                                        </div>-->
                                       <!-- <div class="row">Стоимость Вашей доставки - <span class="del_cost"><?= $deliv?></span></div>
                                        <p class="err_adr"></p>-->
                                        
                                        
                                        
              
                                       <!-- <div class="row clearfix">
                                            <div class="col">
                                                <label>Дом</label>
                                                <input type="number" name="house_obl"  value=""/>
                                            </div>
                                            <div class="col">
                                                <label>Квартира</label>
                                                <input type="number" name="flat_obl" value=""/>
                                            </div>
                                        </div>
                                        <div class="row clearfix">
                                            <div class="col">
                                                <label>Подъезд</label>
                                                <input type="number" name="entrance_obl" value=""/>
                                            </div>
                                            <div class="col">
                                                <label>Этаж</label>
                                                <input type="number" name="flour_obl" value=""/>
                                            </div>
                                        </div>-->                          
                                        


    
<?php echo $footer; ?>
