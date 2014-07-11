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
                        <h1 class="personal-title">Знаки сертификации</h1>
                        <div class="content">
                            <div class="post-content">
                    
                    <?php if(isset($accii_info)) { ?>                    
                     
                                <div class="cerificate-article">
                                    <div>
                                        <?php if ($image) { ?>
                                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                        				<?php } ?>
                                    </div>
                                    <div class="m-title">
                                        <h2><?php echo $heading_title; ?></h2>
                                        <span class="region"><?php echo $cantry; ?></span>
                                    </div>
                                    <div class="c-content">
                                        <?php echo $description; ?>
                                    </div>
                                </div>
                              
                    <? }?>
                
                  <ul class="certificates-list">
                                
                                <? foreach($accii_data as $sert){?>
                                    <li>
                                        <a href="<?= $sert['href']?>"></a>
                                        <img src="<?= $sert['image']?>" alt="">
                                        <div class="description">
                                            <h4><?= $sert['title']?></h4>
                                            <span><?= $sert['cantry']?></span>
                                        </div>
                                    </li>
                                <? }?>
                                
                                    </ul>
                     
                     
                      </div>
                        </div>
                    </div>
                
                     </div>
                </div>
            </div>
        </div>
        <div id="clear"></div>
    </div>
    
    
	<?php echo $content_bottom; ?>


<?php echo $footer; ?>
 
