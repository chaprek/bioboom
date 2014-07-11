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
                    <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                    <div class="registration-container clearfix">
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="left-col">
                                <img src="images/create_account.png" alt="">
                                <!--<div class="text">Какй-то завораживающий текст. Какй-то завораживающий текст. Какй-то завораживающий текст</div>-->
                            </div>
                            <div class="mid-col">
                            <?php if ($error_warning) { ?>
                                <div class="warning"><?php echo $error_warning; ?></div>
                            <?php } ?>
                                <div class="row">
                                    <label><?php echo $entry_firstname; ?><span class="required">*</span></label>
                                    <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
                                    <?php if ($error_firstname) { ?>
                                    <span class="error"><?php echo $error_firstname; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="row">
                                    <label><?php echo $entry_lastname; ?><span class="required">*</span></label>
                                    <input type="text" name="lastname" value="<?php echo $lastname; ?>" />
                                    <?php if ($error_lastname) { ?>
                                    <span class="error"><?php echo $error_lastname; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="row">
                                    <label><?php echo $entry_email; ?><span class="required">*</span></label>
                                    <input type="text" name="email" value="<?php echo $email; ?>" />
                                    <?php if ($error_email) { ?>
                                    <span class="error"><?php echo $error_email; ?></span>
                                    <?php } ?>
                                </div>
                                 <div class="row">
                                    <label><?php echo $entry_telephone; ?><span class="required">*</span></label>
                                    <input type="text" name="telephone" value="<?php echo $telephone; ?>" />
                                    <?php if ($error_telephone) { ?>
                                    <span class="error"><?php echo $error_telephone; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="row">
                                    <label><?php echo $entry_address_1; ?><span class="required">*</span></label>
                                    <input type="text" name="address_1" value="<?php echo $address_1; ?>" />
                                     <?php if ($error_address_1) { ?>
                                    <span class="error"><?php echo $error_address_1; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="row">
                                    <label><?php echo $entry_city; ?><span class="required">*</span></label>
                                    <input type="text" name="city" value="<?php echo $city; ?>" />
                                     <?php if ($error_city) { ?>
                                    <span class="error"><?php echo $error_city; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="row">
                                    <label><?php echo $entry_country; ?><span class="required">*</span></label>
                                    <div class="c-select">
                                        <div class="pointer"></div>
                                        <select name="country_id">
                                          <option value=""><?php echo $text_select; ?></option>
                                          <?php foreach ($countries as $country) { ?>
                                          <?php if ($country['country_id'] == $country_id) { ?>
                                          <option value="<?php echo $country['country_id']; ?>" data-iso2="<?php echo $country['iso_code_2']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                          <?php } else { ?>
                                          <option value="<?php echo $country['country_id']; ?>" data-iso2="<?php echo $country['iso_code_2']; ?>"><?php echo $country['name']; ?></option>
                                          <?php } ?>
                                          <?php } ?>
                                        </select>
                                    </div>
                                    <?php if ($error_country) { ?>
                                    <span class="error"><?php echo $error_country; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="row">
                                    <label><?php echo $entry_zone; ?><span class="required">*</span></label>
                                    <div class="c-select">
                                        <div class="pointer"></div>
                                        <select name="zone_id">
                                        </select>
                                    </div>
                                    <?php if ($error_zone) { ?>
                                    <span class="error"><?php echo $error_zone; ?></span>
                                    <?php } ?>
                                </div>
                                                                                                                                                                                                                                
                                <div class="row">
                                    <label><?php echo $entry_password; ?><span class="required">*</span></label>
                                    <input type="password" name="password" value="<?php echo $password; ?>" />
                                    <?php if ($error_password) { ?>
                                    <span class="error"><?php echo $error_password; ?></span>
                                    <?php } ?></td>                                    
                                   <!-- <div class="notice">Только такие и такие символы</div>-->
                                </div>
                                <div class="row">
                                    <label><?php echo $entry_confirm; ?><span class="required">*</span></label>
                                    <input type="password" name="confirm" value="<?php echo $confirm; ?>" />
                                    <?php if ($error_confirm) { ?>
                                    <span class="error"><?php echo $error_confirm; ?></span>
                                    <?php } ?>                                    
                                    <div class="notice required">* Поля обязательные для заполнения.</div>
                                </div>
                                <div class="row centered">
                                    <input type="submit"  class="btn-green" value="Зарегистрироваться" class="button" />                                    
                                </div>
                            </div>
                            <div class="right-col">
                                <label>Дата рождения</label>
                                <input type="text">
                                <div class="notice">Внесите, пожалуйста, дату своего рождения для получения приятных сюрпризов и подарков к своему празднику.</div>
                                <div class="terms">
                                    <div class="item">
                                    
                                    <input type="checkbox" id="spam" name="newsletter" value="1" checked="checked"/>
                                    <label for="spam">Я выражаю согласие на получение коммерческой информации, пересылаемой мне при помощи средств электронной связи, в частности, электронной почты.</label></div>
                                    <div class="item">
                                    <input type="checkbox" id="personal" name="agree" value="1" checked="checked" />
                                    <label for="personal">Я выражаю согласие на обработку моих персональных данных в соответствии с частью 5 статьи 6 Закона Украины «О защите персональных данных».</label></div>
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
                    
<div id="content">

<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
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
			
			if (json['zone']) {
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
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
//--></script> 
<?php echo $footer; ?>