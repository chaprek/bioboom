<?php
// Recipe Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)
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
                            <?php if(isset($recipe_info)) { ?>
                    <h1 class="recipe-title"><?php echo $heading_title; ?></h1>
                            <div class="content single-recipe">
                                <div class="description"><?php echo $description; ?></div>
                                <div class="recipe-preview">
                                    <div class="thumb">
                                        <?php if ($image) { ?>
                                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                        				<?php } ?>
                                    </div>
                                    <div class="ingredients">
                                        <? if($ingredients){?>
                                            <h3>Ингредиенты:</h3>
                                            <ul>
                                                <? foreach($ingredients as $ing){?>
                                                    <li>- <?= $ing ?></li>
                                                <? }?>
                                            </ul>
                                        <? }?>
                                       <!-- <a href="#" class="btn-green buy-ingredients">Купить ингредиенты</a>-->
                                    </div>
                                </div>
                                 <div class="detail">
                                    <h3>Приготовление</h3>
                                    <? if(isset($images)){?>
                                    <div class="catalog grid">
                                        <div class="items">
                                        <? $i=1?>
                                            <? foreach($images as $img){?>
                                                <div class="item">
                                                    <img src="<?= $img['thumb']?>" alt="">
                                                    <span class="numb"><?= $i ?></span>
                                                </div>
                                                <? $i++?>
                                            <? }?>
                                        </div>
                                    </div>
                                 <? }?>
                                 <div class="detail-content">
                                     <? if(isset($text)){?>
                                        <?= $text?>
                                    <? }?>
                                 </div>
                                    <? if(isset($author)){?>
                                        <div class="author"><?= $author?></div>
                                    <? }?>
                                </div>
                            </div>
                        </div>
                 

	<?php } elseif (isset($recipe_data)) { ?>
    
    
    
    
    
    <h1 class="personal-title"><?= $category['name']?></h1>
                        <div class="content">
                            <div class="category-pict">
                                <img src="images/recipes/banner.jpg" alt="">
                            </div>
                            <div class="catalog-filters">
                                <div class="recipe-filter">
                                    <span class="text">Тип кухни:</span>
                                    <div class="recipe-type c-select">
                                        <div class="pointer"></div>
                                        <select id="recipe-type">
                                            <? foreach($types as $typ){?>
                                                <option value="<?= $typ['type_id']?>"><?= $typ['name']?></option>
                                            <? }?>
                                        </select>
                                    </div>
                                </div>
                                <div class="recipe-filter">
                                    <span class="text">Вид кухни:</span>
                                    <div class="c-select recipe-kind">
                                        <div class="pointer"></div>
                                        <select id="recipe-kind">
                                            <? foreach($kinds as $kin){?>
                                                <option value="<?= $kin['type_id']?>"><?= $kin['name']?></option>
                                            <? }?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="catalog grid recipes-catalog">
                                <div class="items">
                                    
                                    <?php foreach ($recipe_data as $recipe) { ?>
                                    <div class="item">
                                        <a href="<?php echo $recipe['href']; ?>" class="thumb">
                                            <img src="<?php echo $recipe['image']; ?>" alt="">
                                        </a>
                                        <div class="description">
                                            <h3><a href="<?php echo $recipe['href']; ?>"><?php echo $recipe['title']; ?></a></h3>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
    
    
	<?php } ?>
    
    
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