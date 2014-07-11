<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width" name="viewport"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="telephone=no" name="format-detection"/>
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
	<meta name="og:site_name" content="bioboom.ua" />
    <meta property="og:title" content="<?php echo $title; ?>" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="<?php echo $og_url; ?>" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" type="image/png" href="/favicon.png" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="catalog/view/javascript/html5.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/css3-mediaqueries.js"></script>
    <![endif]-->
	<?
    if($canonical){
    echo '<link rel="canonical" href="'.$can_url.'" />'."\n";
    }
	?>
	<?php if (isset($pagin_next)) { ?>
	<link rel="next" href="<?php echo $pagin_next; ?>">
    <?php } ?>
	<?php if (isset($pagin_prev)) { ?>
	<link rel="prev" href="<?php echo $pagin_prev; ?>">
    <?php } ?>
	<?
    if(isset($this->request->get['route'])){
    $contr_gr_arr=explode("/",$this->request->get['route']);
    $contr_gr= $contr_gr_arr[0];
    if($contr_gr=='account' || 
    $contr_gr=='checkout' || 
    $contr_gr=='affiliate' ||
    $contr_gr_arr[1]=='search' ||
    isset($_GET["manufacturer_id"])
    ){
    echo '<meta name="robots" content="noindex, follow" >'."\n";
    }
    }
    ?>
    
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/jquery.fancybox.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/style.css"/>
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/orange.css"/>
    <script src="catalog/view/javascript/jquery-1.8.1.min.js"></script>
    <script src="catalog/view/javascript/picturefill.js"></script>
    <script src="catalog/view/javascript/jquery.scrollTo.js"></script>
    <script src="catalog/view/javascript/jquery.fancybox.pack.js"></script>
    <script src="catalog/view/javascript/jquery.TouchSwipe.min.js"></script>
    <script src="catalog/view/javascript/jquery.carouFredSel-6.1.0-packed.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
    <script src="catalog/view/javascript/ti_custom_checkbox.js"></script>
    <script src="catalog/view/javascript/jquery/jquery.loadmask.min.js"></script>
    <script src="catalog/view/javascript/orange.js"></script>
    <script src="catalog/view/javascript/scripts.js"></script>
    <script type="text/javascript" src="//vk.com/js/api/openapi.js?105"></script>
	    <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-44614117-1', 'bioboom.ua');
  ga('require', 'displayfeatures');
  ga('send', 'pageview');
  ga('require', 'ecommerce', 'ecommerce.js');

</script>
<script type="text/javascript" src="https://apis.google.com/js/plusone.js">
      {"parsetags": "explicit"}
    </script>

</head>
<body>

<!-- Start Alexa Certify Javascript -->
<script type="text/javascript">
_atrk_opts = { atrk_acct:"ol+Ni1a4ZP000/", domain:"bioboom.ua",dynamic: true};
(function() { var as = document.createElement('script'); as.type = 'text/javascript'; as.async = true; as.src = "https://d31qbv1cthcecs.cloudfront.net/atrk.js"; var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(as, s); })();
</script>
<noscript><img src="https://d5nxst8fruw4z.cloudfront.net/atrk.gif?account=ol+Ni1a4ZP000/" style="display:none" height="1" width="1" alt="" /></noscript>
<!-- End Alexa Certify Javascript -->

<!--CHAT MODULE-->
<!-- <script type="text/javascript" language="javascript">
                            	var s_loaded_1406 = false;
                            	var s_old_onload = window.onload;
                            	window.onload = function () {
                            	  if (s_loaded_1406) return; s_loaded_1406 = true;
                            		if (typeof(s_old_onload) == 'function') { try { s_old_onload(); } catch(e) {}; };
                            		var sitehelp_s = document.createElement('script');
                            		sitehelp_s.type = 'text/javascript';
                            		sitehelp_s.src = top.location.protocol + '//c.sitehelp.im/code.cgi?c=1406' + (top.location.protocol=='http:' ? '' : '&ssl=1') + '&rnd=' + Math.random();
                            		document.body.appendChild(sitehelp_s);
                            	};
                            </script>-->
<!--END CHAT MODULE-->

<!--FB Widget-->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/uk_UA/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>




    <div id="page">
        <header id="header">
            <div class="wrapper">
                <div class="container clearfix">
                    <div class="row-fluid">
                        <div class="top-section">
                            <a class="pull-right" href="<?=$this->url->link('information/information', 'information_id=16')?>">Сервис</a>
                            <?php echo $language; ?>
                           
                           <div class="personal-links pull-right head_deliver">
                               <a href="/oplata-i-dostavka" id="wishlist-total">Оплата и доставка</a> <a href="<?=$this->url->link('information/contact')?>">Контакты</a>
                           </div>
                          
                           
                            <?php if (!$logged) { ?>
                                <div class="auth pull-right">
                                       <?php echo $text_welcome; ?>
                                </div>
                                
                                <div class="recipe-products auth-popup popup-window">
                                    <a href="#" class="close"></a>
                                    <div class="container clearfix">
                                        <div class="clearfix">
                                            <div class="auth-popup-item registration-container" id="login">
                                                <div class="auth-title">Войти</div>
                                                <div class="data-set auth-popup-data">
                                                    <form action="<?php echo $action_l; ?>" id="form_login" method="post" enctype="multipart/form-data">
                                                        <div class="data-row">
                                                            <input type="text" placeholder="E-mail" name="email" value="<?php echo $email_l; ?>" />
                                                        </div>
                                                        <div class="data-row">
                                                            <input type="password" name="password" value="<?php echo $password_l; ?>" placeholder="Пароль" />
                                                        </div>
                                                        <a href="<?php echo $forgotten; ?>" class="forgot-link">Забыли пароль?</a>
                                                        
                                                            <div class="data-error">
                                                                <span class="error_l"></span>
                                                            </div>
                                                        <div class="login-footer">
                                                            <div class="remember-user">
                                                                <input type="checkbox"  id="remember" name="remember" value="1" checked="checked" class="custom-check"/>
                                                                <label>Запомнить </label>
                                                            </div>
                                                            <a class="button-login" style="color: #fff;">Войти</a>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="registration-container auth-popup-item" id="registr">
                                                <div class="auth-title">Зарегистрироваться</div>
                                                <div class="data-set auth-popup-data">
                                                    <form action="<?php echo $action_r; ?>" method="post" id="form_reg" enctype="multipart/form-data">
                                                        <div class="data-row">
                                                            <input type="text" name="firstname" value="<?php echo $firstname_r; ?>" placeholder="Имя" />
                                                        </div>
                                                        <div class="data-row">
                                                            <input type="text" name="email" value="<?php echo $email_r; ?>" placeholder="E-mail" />
                                                        </div>
                                                        <div class="data-row">
                                                            <input type="password" name="password" value="<?php echo $password_r; ?>" placeholder="Пароль" />
                                                        </div>
                                                        <span class="error_r"></span>
                                                        <div class="login-footer">
                                                            <div class="remember-user">
                                                                <input type="hidden" id="personal" name="agree" value="1" />
                                                                <input type="hidden" name="mini_registr" value="1" />
                                                                <input type="checkbox"  id="spam" name="newsletter" value="1" checked="checked" class="custom-check"/>
                                                                <label>Подпишитесь на акции и скидки недоступные для всех клиентов</label>
                                                            </div>
                                                            <a class="btn-green button-reg">Создать профиль</a>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                       <!-- <div class="social-auth-container">
                                            <div class="social-auth-title">Или войдите с помощью:</div>
                                            <div class="social-auth-links">
                                                <a href="#" class="social-auth-item fb"></a>
                                                <a href="#" class="social-auth-item vk"></a>
                                                <a href="#" class="social-auth-item gplus"></a>
                                                <a href="#" class="social-auth-item twitter"></a>
                                            </div>
                                        </div>-->
                                    </div>
                                </div>
                                
                                <script>
                                
                                $('.button-login').bind('click', function(e) {
                                    e.preventDefault();
                                	$.ajax({
                                		url: '/login',
                                		type: 'post',
                                		data: $('#form_login input[type=\'text\'], #form_login input[type=\'hidden\'], #form_login input[type=\'password\'], #form_login input[type=\'checkbox\']:checked'),
                                		dataType: 'json',
                                		success: function(json) {
                                		  /*-$(this).parents('form').submit(function(){
                                		     return false; 
                                		  });-*/
                                			
                                			if (json['error']) {
                                                var mail = $('#form_login input[name=\'email\']');
                                                var pass = $('#form_login input[name=\'password\']');
                                                
                                                if(mail.val().length < 4){
                                                    mail.css('border-color', '#ad0000');
                                                }
                                                if(pass.val().length < 4){
                                                    pass.css('border-color', '#ad0000');
                                                }
                                                
                                				$('.error_l').text(json['error']);                                                
                                                
                                			} 
                                			if (json['success']) {
                                                window.location.reload();                                                
                                			}	
                                		} 
                                	});
                                });
                                
                                $('.button-reg').bind('click', function(e) {
                                    e.preventDefault();
                                	$.ajax({
                                		url: '/create-account',
                                		type: 'post',
                                		data: $('#form_reg input[type=\'text\'], #form_reg input[type=\'hidden\'], #form_reg input[type=\'password\'], #form_reg input[type=\'checkbox\']:checked'),
                                		dataType: 'json',
                                		success: function(json) {
                                			
                                			if (json.errors) {
                                				/*-$('.error_r').text(json['error']);-*/
                                                
                                                $('.error').remove();
                                                
                                                for (var key in json.errors) {
                            						$('#form_reg input[name=\'' + key + '\']').
                            								after('<p class="error" >' + json.errors[key] + '</p>');
                                                            
                                                            $('#form_reg input[name=\'' + key + '\']').css('border-color', '#ad0000');
                            					    
                            					   }
                                                
                                			} 
                                			if (json['success']) {
                                                window.location.reload();                                                
                                			}	
                                		} 
                                	});
                                });
                                
                                </script>
                                
                            <?php } else { ?>
                                <div class="personal-links pull-right">
                                    <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>  <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                                </div>
                            <?php } ?>
                        </div>
                        <a class="logo" href="/" title="Интернет-магазин БиоБум™"></a>
                        
                        <? if($reques == '/'){?>
                        <h1 class="super-main-title">Магазин органических продуктов</h1>
                        <? } else {?>
                        <div class="super-main-title">Магазин органических продуктов</div>
                        <? }?>
                        <div class="work-time-container">
                            <a href="tel:0443532339" class="call-us">(044) 353-23-39</a>
                            <div class="show_phones">V</div>
                            <div class="phones">
                                <div>
                                    <div>
                                        <a href="tel:0443532339" class="home">(044) 353-23-39</a>
                                        <a href="tel:0989413232" class="ks">(098) 941-32-32</a>
                                        <a href="tel:0953163232" class="mts">(095) 316-32-32</a>
                                        <a href="tel:0939013232" class="life">(093) 901-32-32</a>
                                    </div>
                                </div>
                            </div>
                            <div>пн-пт 9-18:00</div>
                            <div>сб-вс выходной</div>
                        </div>
                        <div class="bottom-section">
                            <div id="top_cart" class="wrap-cart">
                            <?php echo $cart; ?>
                            </div>
                            <div class="search-form">
                                <input type="text"  name="filter_name" value="<?php echo ($filter_name)?$filter_name:$text_search; ?>" class="search-field"/>
                                <div class="button-search"><i class="search-icon"></i></div>
                            </div>
                        </div>
<? 
//echo "<pre>";
//print_r($categories);
//echo "</pre>";
?>   
                        <?php if ($categories) { ?>                 
                        <nav id="main-menu">
                        <div class="divider_mini"></div>
                            <a href="#" class="menu-toggle hidden" ontouchstart=""><i class="menu-icon"></i><span class="menu-toggle_title">Каталог</span></a>
                            
                            <ul class="menu row-fluid">
                            <?php foreach ($categories as $category) { ?>
                                <li class="top-level">
                                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                    <div class="divider  <?= (strpos($category['href'], $_SERVER['REQUEST_URI']) !== false && $_SERVER['REQUEST_URI'] != '/')?'active':''?>"></div>

                                    <?php if ($category['children']) { ?>
                                    <div class="submenu">
                                        <div class="submenu-inner">
                                            <div class="main-col">
                                            <?php for ($i = 0; $i < count($category['children']); $i++) { ?>
                                                <div class="s-col">
                                                <? if(isset($category['children'][$i]['children']) && count($category['children'][$i]['children']) > 0){?>
                                                    <div class="sub-title"><a class="top_cat" href="<?=$category['children'][$i]['href']?>"><?= $category['children'][$i]['name']?></a></div>
                                                    <ul>
                                                    <? foreach($category['children'][$i]['children'] as $child){ ?>

                                                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>

                                                    <? }?>
                                        
                                                    </ul>
                                                <? } else {?>
                                                    <div class="sub-title"><a href="<?php echo $category['children'][$i]['href']; ?>"><?= $category['children'][$i]['name']?></a></div>    
                                                <? }?>
                                                </div>
                                    
                                            <?php } ?>
                                            </div>
                                            <div class="small-col clearfix">
                                           <? if($category['rand_product']){?>
                                           
                                                <a class="item" href="<?= $category['rand_product']['href']?>">
                                                    <div class="thumb"><img src="<?= $category['rand_product']['thumb']?>" alt="" /></div>
                                                    <div class="desc">
                                                        <div class="i-title"><?= $category['rand_product']['name']?></div>
                                                        <? if($category['rand_product']['special']){?>
                                                            <div class="price" style="text-decoration: line-through;"><?= $category['rand_product']['price']?></div>
                                                            <div class="price" style="color: #ad0000;"><?= $category['rand_product']['special']?></div>
                                                        <? } else {?>
                                                            <div class="price"><?= $category['rand_product']['price']?></div>
                                                        <? }?>
                                                    </div>
                                                </a>
                                            <? }?>
                                            <? if($category['recipes']){?>
                                                <a class="item even" href="<?= $category['recipes']['href']?>">
                                                    <div class="thumb">
                                                    <img src="<?= $category['recipes']['image']?>" alt="<?= $category['recipes']['title']?>"/>
                                                    </div>
                                                    <div class="desc">
                                                        <div class="i-title"><?= $category['recipes']['title']?></div>
                                                        <div class="price"><?= $category['recipes']['description']?></div>
                                                    </div>
                                                </a>
                                            <? }?>
                                            </div>
                                        </div>
                                    </div>
                                     <?php } ?>
                                </li>
                            <?php } ?>
                            </ul>
                        </nav> 
                        <?php } ?>
                    </div>
                </div>
            </div>
        </header>
    
        
  
