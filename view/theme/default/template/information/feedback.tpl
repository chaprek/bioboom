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
                        <h1 class="personal-title">Обратная связь</h1>
                        <div class="content">
                            <div class="category-pict">
                                <img src="images/feedback_banner.jpg" alt="">
                            </div>
                            <div class="post-content">
                                <p>Если у Вас возникли технические неполадка на сайте, есть вопросы по товару, доставке, работе магазина или другое - напишите нам. Мы приложим все усилия, чтобы ответить Вам максимально быстро.</p>
                                

  
             <form class="feedback-page"  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                
                                    <div class="row">
                                        <label><?php echo $entry_name; ?>*</label>
                                        <input type="text" name="name" value="<?php echo $name; ?>" />
                                         <?php if ($error_name) { ?>
                                        <span class="error"><?php echo $error_name; ?></span>
                                        <?php } ?>
                                    </div>
                                    <div class="row">
                                        <label><?php echo $entry_email; ?>*</label>
                                        <input type="text" name="email" value="<?php echo $email; ?>" />
                                        <?php if ($error_email) { ?>
                                        <span class="error"><?php echo $error_email; ?></span>
                                        <?php } ?>
                                    </div>
                                    <div class="row">
                                        <label><?php echo $entry_enquiry; ?></label>
                                        <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
                                        <?php if ($error_enquiry) { ?>
                                        <span class="error"><?php echo $error_enquiry; ?></span>
                                        <?php } ?>
                                    </div>
                                    <div class="notice">* <?= $entry_captcha?></div>
                                    <div class="row"><input type="submit" onclick="ga('send', 'event', 'Feedback', 'Button');" class="btn-green" value="Отправить"></div>
                                </form>
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