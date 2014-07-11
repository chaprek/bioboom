<?php
// News Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)
?>

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
                        
                           <? if (isset($news_data)) { ?>
                            <div class="category-pict">
                                <img src="images/ecology/banner.jpg" alt="">
                            </div>
                            <div class="archive">
                            
                    		<?php foreach ($news_data as $news) { ?>
                            
                            <div class="item">
                                    <a href="<?php echo $news['href']; ?>" class="thumb">
                                        <img src="<?= $news['thumb']?>" alt="<?php echo $news['title']; ?>"/>
                                    </a>
                            
                                    <div class="description">
                                        <h3><a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a></h3>
                                        <div class="excerpt"><?php echo $news['description']; ?>  (...)</div>
                                    </div>
                                </div>
                    		<?php } ?>
                    		<?php } else if(isset($news_info)) { ?>
                            
                            <div class="category-pict">
                                <img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"/>
                            </div>
                            <h1><?php echo $heading_title; ?></h1>
                            <div class="post-content">
                            <?php echo $description; ?>
                                   </div>
                            
                    	<?php } ?>
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