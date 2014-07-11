<?php echo $header; ?>
 
  <div id="main">
        <div class="wrapper" role="main">
            <div class="container">
                <div class="page">
                    <div class="breadcrumbs">
                          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"  class="crumb"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
                    </div>
  <div class="main-content clearfix">
                    <aside class="sidemenu">
                        <?php echo $column_right; ?>
                    </aside>
            <div class="big-side">
                        <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                        <div class="content">
                            <div class="post-content">
                                <img src="images/newsletter.png" alt="" style="margin: 0 20px 20px 0; float: left">Быть в курсе всех «зеленых» новостей, лучших предложений и скидок вы можете подписавшись на рассылку.
                                <div class="newsletter-page">
                                      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                      <div class="row">
                                      <?php if ($newsletter) { ?>                                      
                                            <input type="submit"  class="btn-green" value="Отписаться" />
                                            <? } else {?>
                                            <input type="submit"  class="btn-green" value="Подписаться" />
                                            
                                            <? }?>                                                                                                                                                                                
                                        </div>
                                        <div class="row agreement">
                                            <input type="checkbox" name="newsletter" value="<? echo ($newsletter)?"0":"1"?>"/>
                                            <label> Я выражаю согласие на получение коммерческой информации, 
                                            пересылаемой мне при помощи средств электронной связи, в частности, 
                                            электронной почты.<br>
                                            Я выражаю согласие на обработку моих персональных данных в 
                                            соответствии с частью 5 статьи 6 Закона Украины «О защите персональных данных»
                                            </label>
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