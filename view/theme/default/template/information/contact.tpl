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
                        <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                        <div class="content">
                            <div class="contacts-container">
                                <div class="row">
                                    <div class="c-img">
                                        <img src="images/contacts/house.jpg" alt="">
                                    </div>
                                    <div class="c-content">
                                        <h4><span><?php echo $text_graf;?></span></h4>
                                        <div class="info">
                                            С понедельника по пятницу<br>
                                            10:00 - 19:00<br>
                                            Call-центр: (044) 353-23-38<br>
                                            bioboom@com.ua<br>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="c-content">
                                        <h4><?= $text_adres_bio?></h4>
                                        <div class="info">
                                            г. Киев, пр-т. Героев Сталинграда, 8 (корпус 7)<br>
                                            Ежедневно<br>
                                            10:00 - 20:00<br>
                                            Без выходных и перерывов<br>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="c-content">
                                        <h4><?= $text_adver?></h4>
                                        <div class="info">
                                            Дармограй Светлана - ведущий специалист<br>
                                            (044) 353-23-39<br>
                                            sveta@babycare.com.ua<br>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="c-img">
                                        <img src="images/contacts/care.png" alt="">
                                    </div>
                                    <div class="c-content">
                                        <h4><?= $text_adres_opt?></h4>
                                        <div class="info">
                                            Компания «Babycare»<br>
                                            г. Киев, пер. Делегатский, 12, оф. 2<br>
                                            (044) 229-05-02,  (044) 229-05-03,  (093) 306-08-18<br>
                                            E-mail: partnership@babycare.com.ua<br>
                                        </div>
                                    </div>
                                </div>
                                <div class="map-container">
                                    <h3>Посмотреть на карте</h3>
                                    <div class="map">
                                        <iframe src="http://mapsengine.google.com/map/embed?mid=zB-Lta_ynMtY.kQyPeQRJN8RU" width="640" height="480"></iframe>
                                    </div>
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

<!--

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
   
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  
  
  -->
<?php echo $footer; ?>