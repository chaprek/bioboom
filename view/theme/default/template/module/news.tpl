<?php
// News Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)
?>

<?php if ($news) { ?>
<?php if($box) { ?>

        <li class="top-level">

			<?php if($icon) { ?>
				<div style="float: left; margin-right: 8px;"><img src="catalog/view/theme/default/image/message.png" alt="" /></div>
			<?php } ?>
			<?php if($customtitle) { ?>
                <a class="top-level" href="#"><?php echo $customtitle; ?></a>
			<?php } ?>
        <ul>
		<?php foreach ($category as $cat) { ?>
        <li class="<?= (strpos($cat['href'], $reques) === false)?"":"active"?>"><a href="<?php echo $cat['href']; ?>"><?php echo $cat['title']; ?></a></li>
    
		<?php } ?>
        </ul>
</li>
<?php } else { ?>
	<div style="margin-bottom:10px;">
		<?php foreach ($news as $news_story) { ?>
			<div class="box-news">
				<?php if ($show_headline) { ?>
					<h4><?php echo $news_story['title']; ?></h4>
				<?php } ?>
				<?php echo $news_story['description']; ?> .. <br />
				<a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a>
				</p>
				<a href="<?php echo $news_story['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a> 
				<span><b><?php echo $text_posted; ?></b> <?php echo $news_story['posted']; ?></span>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
	</div>
<?php } ?>
<?php } ?>