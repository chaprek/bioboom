<?php
// sertificates Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)
?>

<?php if ($sertificates) { ?>
<?php if($box) { ?>
	<div class="box">
		<div class="box-heading">
			<?php if($icon) { ?>
				<div style="float: left; margin-right: 8px;"><img src="catalog/view/theme/default/image/message.png" alt="" /></div>
			<?php } ?>
			<?php if($customtitle) { ?>
				<?php echo $customtitle; ?>
			<?php } ?>
		</div>
		<div class="box-content">
		<?php foreach ($sertificates as $sertificates_story) { ?>
			<div class="box-sertificates">
				<?php if ($show_headline) { ?>
					<h4><?php echo $sertificates_story['title']; ?></h4>
				<?php } ?>
			<p><a href="<?php echo $sertificates_story['href']; ?>"><img style="vertical-align: middle;" src="catalog/view/theme/default/image/message-sertificates.png" alt="" /></a> 
				<span><?php echo $sertificates_story['posted']; ?></span></p>
				<p><?php echo $sertificates_story['description']; ?> .. </p>
				<p><a href="<?php echo $sertificates_story['href']; ?>"> <?php echo $text_more; ?></a></p>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $sertificateslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
		</div>
	</div>
<?php } else { ?>
	<div style="margin-bottom:10px;">
		<?php foreach ($sertificates as $sertificates_story) { ?>
			<div class="box-sertificates">
				<?php if ($show_headline) { ?>
					<h4><?php echo $sertificates_story['title']; ?></h4>
				<?php } ?>
				<?php echo $sertificates_story['description']; ?> .. <br />
				<a href="<?php echo $sertificates_story['href']; ?>"> <?php echo $text_more; ?></a>
				</p>
				<a href="<?php echo $sertificates_story['href']; ?>"><img src="catalog/view/theme/default/image/message-sertificates.png" alt="" /></a> 
				<span><b><?php echo $text_posted; ?></b> <?php echo $sertificates_story['posted']; ?></span>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $sertificateslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
	</div>
<?php } ?>
<?php } ?>