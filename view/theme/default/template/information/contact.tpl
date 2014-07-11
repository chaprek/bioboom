<?php echo $header; ?>

    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?sensor=true">
    </script>

    <script>
    $(document).ready(function() {
    
    
        /*-MAP-*/
        
        var myLatlng = new google.maps.LatLng(50.496838, 30.519568);
        var mapOptions = {
          zoom:17,
          center: myLatlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map"),
        mapOptions);
        
        var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title:"Bioboom"
        });
    });
    
    </script>


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
                        <h1 class="personal-title"><?= $heading_title ?></h1>
                        <div class="content">
                            <div class="contacts-container">
                                <div class="row">
                                    <div class="c-img">
                                        <img src="images/contacts/house.jpg" alt="">
                                    </div>
                                    <div class="c-content">
                                        <h4><span><?= $text_graf ?></span></h4>
                                        <div class="info">
                                            С понедельника по пятницу<br>
                                            09:00 - 18:00<br>
                                            <br>
                                            
                                            <div class="work-time-container">
                                                <div class="call-us">Наши телефоны</div>
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
                                            </div>
                                            
                                            <br>
                                            info@bioboom.ua<br>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="c-content">
                                        <h4><?= $text_adres_bio ?></h4>
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
                                        <h4><?= $text_adver ?></h4>
                                        <div class="info">
                                            Дармограй Светлана - ведущий специалист<br>
                                            (044) 229-05-03<br>
                                            marketing@bioboom.ua<br>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="c-img">
                                        <img src="images/contacts/care.png" alt="">
                                    </div>
                                    <div class="c-content">
                                        <h4><?= $text_adres_opt ?></h4>
                                        <div class="info">
                                            Компания «Babycare»<br>
                                            г. Киев, пер. Делегатский, 12, оф. 2<br>
                                            partnership@babycare.com.ua<br>
                                        </div>
                                    </div>
                                </div>
                                <div class="map-container">
                                    <h3>Посмотреть на карте</h3>
                                    <div class="map" id="map">
                                    <!--   
                                        <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?q=50.496838,30.519568&amp;num=1&amp;hl=ru&amp;ie=UTF8&amp;ll=50.497521,30.518507&amp;spn=0.002757,0.005842&amp;t=m&amp;z=14&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?q=50.496838,30.519568&amp;num=1&amp;hl=ru&amp;ie=UTF8&amp;ll=50.497521,30.518507&amp;spn=0.002757,0.005842&amp;t=m&amp;z=14&amp;source=embed" style="color:#0000FF;text-align:left">Просмотреть увеличенную карту</a></small>
                                    -->
                                    
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