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
                    
                    <?php if(isset($sertificates_info)) { ?>
                    
                     
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
                                
                                <? foreach($sertificates_data as $sert){?>
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


<script type="text/javascript"><!--
/*-$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});-*/
//--></script>

<?php echo $footer; ?>
                
<!--
	
		<div class="content-sertificates">
			<div class="sertificates" <?php if($image) { echo 'style="min-height:' . $min_height . 'px;"'; } ?>>
				<?php if ($image) { ?>
					<div class="image">
					<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
					</div>
				<?php } ?>
				<h3><?php echo $heading_title; ?></h3>
				<?php echo $description; ?>
			</div>
			<div class="addthis">
			<?php if($addthis) { ?>
			
				<div class="addthis_toolbox addthis_default_style ">
				<a class="addthis_button_email"></a>
				<a class="addthis_button_print"></a>
				<a class="addthis_button_preferred_1"></a>
				<a class="addthis_button_preferred_2"></a>
				<a class="addthis_button_preferred_3"></a>
				<a class="addthis_button_preferred_4"></a>
				<a class="addthis_button_compact"></a>
				<a class="addthis_counter addthis_bubble_style"></a>
				</div>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
			
			<?php } ?>
			</div>
		</div>
		<div class="buttons">
			<div class="right">
				<a onclick="location='<?php echo $sertificates; ?>'" class="button"><span><?php echo $button_sertificates; ?></span></a>
				<a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a>
			</div>
		</div>
	<?php //} elseif (isset($sertificates_data)) { ?>
		<?php foreach ($sertificates_data as $sertificates) { ?>
			<div class="panelcollapsed">
				<h2><?php echo $sertificates['title']; ?></h2>
				<div class="panelcontent">
					<p>
					<?php echo $sertificates['description']; ?> .. <br />
					<a href="<?php echo $sertificates['href']; ?>"> <?php echo $text_more; ?></a>
					</p>
					<a href="<?php echo $sertificates['href']; ?>"><img style="vertical-align: middle;" src="catalog/view/theme/default/image/message-sertificates.png" alt="" /></a> <b><?php echo $text_posted; ?></b><?php echo $sertificates['posted']; ?>
				</div>
			</div>
		<?php } ?>
		<div class="buttons">
			<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
		</div>
	<?php //} ?>
	<?php echo $content_bottom; ?>
</div>-->
