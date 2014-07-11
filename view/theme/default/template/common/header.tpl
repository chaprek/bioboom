<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width" name="viewport"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="telephone=no" name="format-detection"/>
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="<?php echo $og_url; ?>" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/css3-mediaqueries.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/jquery.fancybox.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/style.css"/>
    <script src="catalog/view/javascript/jquery-1.8.1.min.js"></script>
    <script src="catalog/view/javascript/picturefill.js"></script>
    <script src="catalog/view/javascript/jquery.scrollTo.js"></script>
    
    <script src="catalog/view/javascript/jquery.fancybox.pack.js"></script>
    <script src="catalog/view/javascript/jquery.TouchSwipe.min.js"></script>
    <script src="catalog/view/javascript/jquery.carouFredSel-6.1.0-packed.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
    <script src="catalog/view/javascript/ti_custom_checkbox.js"></script>
    <script src="catalog/view/javascript/jquery/jquery.loadmask.min.js"></script>
    <script src="catalog/view/javascript/scripts.js"></script>
</head>
<body>
    <div id="page">
        <header id="header">
            <div class="wrapper">
                <div class="container clearfix">
                    <div class="row-fluid">
                        <div class="top-section">
                            <a class="pull-right hidden480" href="#">Сервис</a>
                            <?php echo $language; ?>
                            
                            <?php if (!$logged) { ?>
    <div class="auth pull-right"><?php echo $text_welcome; ?></div>
                            
    <?php } else { ?>
      <div class="personal-links pull-right">
            <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a> / <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
      </div>
    <?php } ?>
                          
                            
                        </div>
                        <a class="logo" href="#"></a>
                        <div class="bottom-section">
                        <a class="mini-cart full" href="<?php echo $shopping_cart; ?>">
                        <?php echo $cart; ?>
                           </a>
  
                                <div class="search-form">
                                    <input type="text"  name="filter_name" value="<?php echo ($filter_name)?$filter_name:$text_search; ?>" class="search-field"/>
                                    <div class="button-search"><i class="search-icon"></i></div>
                                </div>
                        </div>
<? 
//echo "<pre>";
//print_r($categories);
//echo "</pre>";
?>
                      
  <?php if ($categories) { ?>                 
     <nav id="main-menu">
                            <a href="#" class="menu-toggle hidden" ontouchstart=""><i class="menu-icon"></i></a>                  
    <ul class="menu row-fluid">
    <?php foreach ($categories as $category) { ?>
    <li class="top-level">
     <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
     <div class="divider"></div>
    
    
    <?php if ($category['children']) { ?>
    <div class="submenu">
    <div class="submenu-inner">
    <div class="main-col">
    <?php for ($i = 0; $i < count($category['children']); $i++) { ?>
    <div class="s-col">
    
    <? if(isset($category['children'][$i]['children']) && count($category['children'][$i]['children']) > 0){?>
        <div class="sub-title"><?= $category['children'][$i]['name']?></div>
        <ul>
        <? foreach($category['children'][$i]['children'] as $child){ ?>
        
              <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
        
        <? }?>
        
        </ul>
    <? } else {?>
        <div class="sub-title"><a href="<?php echo $category['children'][$i]['href']; ?>"><?= $category['children'][$i]['name']?></a></div>    
    <? }?>
    </div>
    
    
    <?php } ?>
    </div>
       <div class="small-col clearfix">
       
       <? if($category['rand_product']){?>
       
                                                <a class="item" href="<?= $category['rand_product']['href']?>">
                                                    <div class="thumb"><img src="<?= $category['rand_product']['thumb']?>" alt=""></div>
                                                    <div class="desc">
                                                        <div class="i-title"><?= $category['rand_product']['name']?></div>
                                                        <div class="price"><?= $category['rand_product']['price']?> грн</div>
                                                    </div>
                                                </a>
        <? }?>
                                                <a class="item even" href="#">
                                                    <div class="thumb"><img src="images/articles/img-2.jpg" alt=""></div>
                                                    <div class="desc">
                                                        <div class="i-title">Рецепт</div>
                                                    </div>
                                                </a>
                                            </div>
    </div>
    </div>
    
    
     <?php } ?>
    </li>
    <?php } ?>
     </ul>
    </nav> 
    <?php } ?>
              </div>
                </div>
            </div>
        </header>
    
        
  
