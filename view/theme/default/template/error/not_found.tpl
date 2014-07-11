<?php echo $header; ?>




<div id="main">
    <div class="wrapper" role="main">
        <div class="container">
            <div class="page ">
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
 <div class="content ">
  <h1><?php echo trim($text_error); ?></h1>
  <div>Предлагаем вам:</div>
  <ul>
	<li><a href="javascript:history.go(-1)"  class="button">Вернутся на предыдущую страницу</a></li>
	<li><a href="<?php echo $continue; ?>" class="button">Перейти на главную</a></li>
	<li><a href="<?=$this->url->link("information/sitemap");?>" class="button">Посмотреть карту сайта</a></li>
  </ul>
</div>
  </div>
  
</div>

<?php echo $content_top; ?>


<?php echo $content_bottom; ?>
</div>
</div>
</div>
</div>

    <div id="clear"></div>
</div>
</div>
<?php echo $footer; ?>