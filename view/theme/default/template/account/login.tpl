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
                    <? if($from_cart){?>
                       <h1 class="personal-title">ОФОРМИТЬ ЗАКАЗ</h1>
                    <aside class="sidemenu login-side">
                        <div class="content">
                            <div class="block step-block">Осуществите покупку всего за три простых Шага.</div>
                            <div class="block step-block"><span class="step">Шаг 1</span> - Войдите в свой профиль, если у вас его еще нет - создайте его с помощью следующего шага</div>
                            <div class="block step-block"><span class="step">Шаг 2</span> - Быстрая и простая Регистрация, которая займет меньше минуты!</div>
                            <div class="block step-block"><span class="step">Шаг 3</span> - Выберите способ доставки и оплаты. Вот и все!</div>
                            <div class="block step-block">Покупайте с уверенностью<br>
                            Защита персональных данных
                            <span class="status active">АКТИВНА</span>
                            </div>
                        </div>
                    </aside>
                    <? } else {?>
                    
                        <h1 class="personal-title">МОЙ ПРОФИЛЬ</h1>
                        <aside class="sidemenu login-side">
                            <div class="content">
                                <div class="block">
                                    <p>Покупайте с уверенностью</p>
                                    <p>Защита персональных данных <span class="status active">(активна)</span></p>
                                </div>
                                <div class="block">
                                    Вопросы?<br>
                                    Если у Вас возникли вопросы или
                                    Вам необходима помощь с
                                    Учетной записью, Вы можете
                                    <a href="#" class="underlink">связаться с нами</a>.
                                </div>
                            </div>
                        </aside>
                        
                        
                     <? }?>
                        
                        <div class="big-side">
                            <div class="auth-container">
                                <div class="item">
                                
                                <?php if ($success) { ?>
                                    <div class="success"><?php echo $success; ?></div>
                                    <?php } ?>
                                    <?php if ($error_warning) { ?>
                                    <div class="warning"><?php echo $error_warning; ?></div>
                                <?php } ?>
                                
                                    <h3>Зарегистрированный пользователь</h3>
                                    <div class="content">
                                        <form class="auth-form auth-row"  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <label>E-mail клиента</label>
                                                <input type="text" name="email" value="<?php echo $email; ?>" />
                                            </div>
                                            <div class="row">
                                                <label><?php echo $entry_password; ?></label>
                                                <input type="password" name="password" value="<?php echo $password; ?>" />
                                                <div class="centered">
                                                    <a href="<?php echo $forgotten; ?>" class="forget-pass"><?php echo $text_forgotten; ?></a>
                                                </div>
                                                <!--<div class="remember-user">
                                                    <label class="remember" for="remember">Запомнить</label><input type="checkbox" id="remember">
                                                </div>-->
                                            </div>
                                            <div class="row centered">
                                                <input type="submit" value="<?php echo $button_login; ?>" class="btn-submit-mid button" />
                                                  <?php if ($redirect) { ?>
                                                  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                                                  <?php } ?>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="item create-account">
                                    <h3>Новый пользователь</h3>
                                    <div class="content">
                                        <img src="images/create_account.png" alt="">
                                        <a href="<?php echo $register; ?>" class="btn-green">Создать профиль</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="clear"></div>
    </div>
</div>


<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 



<?php echo $footer; ?>