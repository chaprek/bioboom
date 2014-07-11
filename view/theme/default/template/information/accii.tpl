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
                    
                    <div class="big-side" style="margin-left: 0;">
                        <h1 class="personal-title"><?= (isset($accii_info))?$heading_title:'Все акции' ?></h1>
                        <div class="content">
                            <div class="post-content">
                    
                            <div class="accii-list">
                                <?php if(isset($accii_info)) { ?>     
                                            <div>
                                                <div>
                                                    <?php if ($image) { ?>
                                                       <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                                        			<?php } ?>
                                                    <h4><?php echo $heading_title; ?></h4>
                                                    <div class="description">
                                                        <?php echo $description; ?>
                                                    </div>
                                                </div>
                                            </div>
                                <? } else {?>
                
                                
                                <? foreach($accii_data as $sert){?>
                                
                                    <div>
                                        <div>
                                            <a >
                                            <img src="<?= $sert['image']?>" alt="">
                                            </a>
                                            <h4><?= $sert['title']?></h4>
                                            <div class="description">
                                               <?= $sert['description']?>
                                            </div>
                                        </div>
                                    </div>
                                <? }?>
                                
                     
                            <? }?>
                            
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
    
    
	<?php echo $content_bottom; ?>


<?php echo $footer; ?>
                

