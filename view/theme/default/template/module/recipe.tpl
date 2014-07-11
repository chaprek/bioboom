<?php
// Recipe Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)
?>

<?php if ($recipe) { ?>
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
        <li class="<?= $cat['active']?>"><a href="<?php echo $cat['href']; ?>"><?php echo $cat['title']; ?></a></li>
    
		<?php } ?>
        </ul>
        
</li>
<?php } else { ?>
	<div style="margin-bottom:10px;">
		<?php foreach ($recipe as $recipe_story) { ?>
			<div class="box-recipe">
				<?php if ($show_headline) { ?>
					<h4><?php echo $recipe_story['title']; ?></h4>
				<?php } ?>
				<?php echo $recipe_story['description']; ?> .. <br />
				<a href="<?php echo $recipe_story['href']; ?>"> <?php echo $text_more; ?></a>
				</p>
				<a href="<?php echo $recipe_story['href']; ?>"><img src="catalog/view/theme/default/image/message-recipe.png" alt="" /></a> 
				<span><b><?php echo $text_posted; ?></b> <?php echo $recipe_story['posted']; ?></span>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $recipelist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
	</div>
<?php } ?>
<?php } ?>