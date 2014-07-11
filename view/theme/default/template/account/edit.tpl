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
                    <aside class="sidemenu">
                    <?php echo $column_right; ?>
                        
                    </aside>
                      <div class="big-side">
                      <?php if ($error_warning) { ?>
                    <div class="warning"><?php echo $error_warning; ?></div>
                    <?php } ?>
                    <?php if ($success) { ?>
                    <div class="success"><?php echo $success; ?></div>
                    <?php } ?>
                         <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                         <h2><?php echo $text_your_details; ?></h2>
                         <div class="content">
                             <div class="personal-info">
                                 <div class="category-pict">
                                     <img src="images/personal-pict.jpg" alt="">
                                 </div>
                                 <div class="data-list">
                                     <div class="row">
                                         <div class="col-title">Имя и фамилия</div>
                                         <div class="col-content"><?php echo $firstname; ?> <?php echo $lastname; ?></div>
                                     </div>
                                     <div class="row">
                                         <div class="col-title">пол</div>
                                         <div class="col-content">женский</div>
                                     </div>
                                     <div class="row">
                                         <div class="col-title"><?php echo $entry_address_1; ?></div>
                                         <div class="col-content"><?php echo $address_1; ?></div>
                                     </div>
                                     <div class="row">
                                         <div class="col-title">Индекс, населенный пункт</div>
                                         <div class="col-content"><?php echo $postcode; ?> <?php echo $city; ?></div>
                                     </div>
                                     <div class="row">
                                         <div class="col-title">Номер телефона</div>
                                         <div class="col-content"><?php echo $telephone; ?></div>
                                     </div>
                                     <div class="row">
                                         <div class="col-title">Дата рождения</div>
                                         <div class="col-content">160485</div>
                                     </div>
                                     <div class="row">
                                         <div class="col-title"><?php echo $entry_email; ?></div>
                                         <div class="col-content"><?php echo $email; ?></div>
                                     </div>
                                     <div class="row controls-row">
                                         <div class="col-title"><a href="#" class="btn-submit-mid">Изменить данные</a></div>
                                     </div>
                                     <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                     <input type="hidden" name="zone_id" value="<?php echo $zone_id; ?>"/>
                                     <input type="hidden" name="country_id" value="<?php echo $country_id; ?>"/>
                                         <div class="row clearfix">
                                             <div class="col-title"><?php echo $entry_firstname; ?></div>
                                             <div class="col-content clearfix"><input type="text" name="firstname" value="<?php echo $firstname; ?> "/></div>
                                             <?php if ($error_firstname) { ?>
                                            <span class="error"><?php echo $error_firstname; ?></span>
                                            <?php } ?>
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title"><?php echo $entry_lastname; ?></div>
                                             <div class="col-content clearfix"><input type="text" name="lastname" value="<?php echo $lastname; ?>"/></div>
                                             <?php if ($error_lastname) { ?>
                                            <span class="error"><?php echo $error_lastname; ?></span>
                                            <?php } ?>
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title">пол</div>
                                             <div class="col-content clearfix"><input type="text" value="женский"></div>
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title"><?php echo $entry_address_1; ?></div>
                                             <div class="col-content clearfix">
                                             <input type="text" name="address_1" value="<?php echo $address_1; ?>" /></div>
                                                <?php if ($error_address_1) { ?>
                                                <span class="error"><?php echo $error_address_1; ?></span>
                                                <?php } ?>
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title"><?php echo $entry_city; ?></div>
                                             <div class="col-content clearfix">
                                             <input type="text" name="city" value="<?php echo $city; ?>" /></div>
                                                <?php if ($error_city) { ?>
                                                <span class="error"><?php echo $error_city; ?></span>
                                                <?php } ?>
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title"><?php echo $entry_postcode; ?></div>
                                             <div class="col-content clearfix"><input type="text" name="postcode" value="<?php echo $postcode; ?>"></div>
                                            <?php if ($error_postcode) { ?>
                                            <span class="error"><?php echo $error_postcode; ?></span>
                                            <?php } ?>                                         
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title"><?php echo $entry_telephone; ?></div>
                                             <div class="col-content clearfix"><input type="text" name="telephone" value="<?php echo $telephone; ?>" /></div>
                                             <?php if ($error_telephone) { ?>
                                            <span class="error"><?php echo $error_telephone; ?></span>
                                            <?php } ?>
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title">Дата рождения</div>
                                             <div class="col-content clearfix"><input type="text" value="160485"></div>
                                         </div>
                                         <div class="row clearfix">
                                             <div class="col-title"><?php echo $entry_email; ?></div>
                                             <div class="col-content clearfix">
                                                 <input type="text" name="email" value="<?php echo $email; ?>" />
                                                 <!--<div class="notice">Подтвердите адрес e-mail</div>
                                                 <input type="text">-->
                                                 <?php if ($error_email) { ?>
                                                <span class="error"><?php echo $error_email; ?></span>
                                                <?php } ?>
                                                 <div class="notice">Изменение адреса e-mail приведет к изменению адреса, используемого для входа в профиль</div>
                                             </div>
                                         </div>
                                         <div class="row clearfix password-row">
                                             <div class="col-title">Изменить пароль</div>
                                                                                       
                                             
                                             <div class="col-content clearfix">
                                                <!-- <p>
                                                     <label>Ваш актуальный пароль*</label>
                                                     <input type="password">
                                                 </p>-->
                                                 <p>
                                                     <label><?php echo $entry_password; ?></label>
                                                     <input type="password" name="password" value="<?php echo $password; ?>" />
                                                     <?php if ($error_password) { ?>
                                                    <span class="error"><?php echo $error_password; ?></span>
                                                    <?php } ?>
                                                 </p>
                                                 <p>
                                                     <label><?php echo $entry_confirm; ?></label>
                                                     <input type="password" name="confirm" value="<?php echo $confirm; ?>" />
                                                     <?php if ($error_confirm) { ?>
                                                    <span class="error"><?php echo $error_confirm; ?></span>
                                                    <?php } ?>
                                                 </p>
                                                 <div class="notice">*Только символы ... такие и такие</div>
                                             </div>
                                         </div>
                                         <div class="row clearfix controls-row">
                                             <div class="col-content clearfix">
                                             <input type="submit" class="btn-submit-green" value="<?php echo $button_save; ?>" class="button" />
                                                <!-- <a href="#" class="btn-submit-green">Сохранить</a>-->
                                                 <a href="#" class="rendo">Отмена</a>
                                             </div>
                                         </div>
                                     </form>    
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


<?php echo $footer; ?>