<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<script type="text/javascript">
    $(document).ready(function(){
        var ua = navigator.userAgent.toLowerCase();
        var isMobile = ua.indexOf("mobile") > -1;

        function createZoom() {
            $("<link/>",{
                href:'catalog/view/theme/default/stylesheet/magiczoom.css',
                rel:'stylesheet'
            }).insertAfter("link:last");

            $("<script/>",{
                src:'catalog/view/javascript/magiczoom.js'
            }).appendTo("body");
        }

        if (!isMobile) {
            createZoom();
        } else if ($(window).width() >= 700) {
            createZoom();
        }

    });
</script>
<!-- <script src="catalog/view/javascript/magiczoom.js"></script>
<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/magiczoom.css"> -->
 <div id="main">
        <div class="wrapper" role="main">
            <div class="container">
                <div class="page">
                
                    <div class="breadcrumbs">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a <? if(!empty($breadcrumb['href'])){ ?> href="<?php echo $breadcrumb['href']; ?>"<? } ?>><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                    </div> 
                    
                    <?php echo $content_top; ?>

                    <div class="main-content clearfix single">
                        <div class="top-single clearfix" id="product_content">
                            <div class="trade-gallery" id="gallery">
                                                    
                            <?php if ($thumb || $images) { ?>
                                <div class="preview">
                                <div class="<?= $mark?> <?= ($special)?"sale":"" ?>"></div>
                                <?php if ($thumb) { ?>
                                    <a href="<?=$big_img;?>" rel="fancybox" class="MagicZoom" rel="zoom-width:500px; zoom-height:500px;" id="MagicZoom">
                                    
                                        <img id="im" src="<?=$thumb;?>" title="<?php echo $heading_title; ?>  в БиоБутике" alt="<?php echo $heading_title; ?>" />
                                    </a>
                                  <?php } ?>  
                                </div>
                                <div class="thumbs-list" id="thumbs">
                                    <div class="thumbs-wrap">

                                    <?php if ($images) { ?>
                                        <ul class="thumbs">
                                            <?php 
											$foto_n=0;
											foreach ($images as $image) { $foto_n++;?>
                                                <li> 
                                                    <a rel="zoom-id:MagicZoom" href="<?php echo $image['big_img']; ?>" rel="fancybox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>  в БиоБутике фото <?=$foto_n;?>" alt="<?php echo $heading_title; ?> фото <?=$foto_n;?>" /></a>
                                                </li>
                                            
                                            <?php } ?>
                                             <?php if ($thumb) { $foto_n++; ?>
                                             <li>
                                                <a rel="zoom-id:MagicZoom" href="<?=$big_img;?>" rel="fancybox">
                                                    <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>  в БиоБутике фото <?=$foto_n;?>" alt="<?php echo $heading_title; ?> фото <?=$foto_n;?>" />
                                                </a>
                                             </li>
                                             <?php } ?>
                                             <?php for ($i = 1; $i <= 2 - count($images); $i++) { ?>
                                                <li></li>
                                             <?php } ?>
                                        </ul>
                                         <?php } ?>  
                                        <div class="controls">
                                            <span class="prev"><</span>
                                            <span class="next">></span>
                                        </div>
                                    </div>
                                </div>
                                <?php } ?> 
                            </div>
<!-- <div id="im_zoom" style="position:absolute;width:70%;height:96%;float:right;top:0px;right:0px;"></div>  -->

                            <div class="rside-detail">
                                <h1><?php echo $heading_title; ?></h1>
                                <div class="size">
                                <? if($chunk){?>
                                    <?php foreach($chunk['attribute'] as $attr){
                                        echo $attr['text'];
                                    } ?>
                                <? }?>
                                </div>
                                <div class="price">
                                <?php if (!$special) { ?>
                                    <?php echo $price; ?>
                                <?php } else { ?>
                                    <span class="through"><?php echo $price; ?> </span><span class="price-new"><?php echo $special; ?></span>
                                    <span class="percent" style="display: none;"><?= ($special/$price)  ?></span>
                                <?php } ?>
                                </div>
                                <div class="clearfix">
                                    <div class="availability <?= ($in_stock)?"yes":""; ?>" style="<?= ($review_status && $rating > 0)?'':'float: none; text-align: left' ?>;"><?php echo $stock; ?></div>
                                    <? if(!$in_stock){?>
                                        <? if($islogin){?>
                                            <a onclick="addToWaitlist('<?php echo $product_id; ?>');" class="add-to-wait">+ в лист ожидания</a>
                                        <? } else {?>
                                            <a class="wait_show">Сообщить когда появится</a>
                                        <? }?>
                                    <? }?>
                                    <?php if ($review_status && $rating > 0) { ?>
                                    
                                    <div class="raiting"><div style="width: <?= $rating*20?>%"></div></div>
                                    <span class="raiting-count rews_top"><?php echo $reviews_w; ?></span>
                                    
                                      <?php } ?>
                                    
                                </div>
                                
                                
                               <? if(!empty($description_act)){?>
                                   <div class="desc_act">
                                   <?= $description_act?>
                                   </div>
                               <? }?>
                               <? if($deliv_plus == 1){?>
                                   <div class="deliv_rule">
                                    Данный товар доставляется по Киеву и Киевской области
                                   </div>
                               <? }?>
                                
                                   <div class="trade-features">
                                    <form>
                                    <div class="active">
                                    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                                    <input type="hidden" name="price_opt" class="price_opt" value="0" />
                                     </div>
                                        <ul>
                                            <li class="feature">
                                                <div class="title">Количество</div>
                                                <div class="content clearfix">
                                                    <div class="trade-count">
                                                        <input type="text" id="count"  name="quantity" value="<?php echo $minimum; ?>" />
                                                        <button type="button" class="inc"></button>
                                                        <button type="button" class="dec"></button>
                                                    </div> 
                                                </div>
                                            </li>
                                            <input type="hidden" name="pure_price" id="pure_price" size="2" value="<?php echo $price_pure; ?>" />
                                            <input type="hidden" name="pure_price_spec" id="pure_price_spec" size="2" value="<?php echo $price_pure_spec; ?>" />
                                            <input type="hidden" name="pref" id="pref" size="2" value="<?php echo $pref; ?>" />
                                            <div id="opt">
                                            <?php if ($options) { ?>
                                            <?php foreach ($options as $option) { ?>
                                            <?php if ($option['type'] == 'select') { ?>
                                            <li class="feature">
                                                <div class="title"><?php echo $option['name']; ?></div>
                                                <div class="content clearfix">
                                                    <div class="div-select" id="<?= ($option['option_id'] == 8)?"size":"color"?>">
                                                        <div class="current">
                                                        <span class="text">
                                                        
                                                        <?php foreach ($option['option_value'] as $opt_val) { ?>
                                                        
                                                            <? if($opt_val['price'] == 0){?>
                                                            
                                                                <? if(isset($opt_val['image'])){?>
                                                                    <? if($option['option_id'] == 5 && strpos($opt_val['image'], 'no_image') == false){?>
                                                                        <img  width="20" src="<? echo $opt_val['image']?>"/>
                                                                    <? }?>
                                                                    <span>
                                                                        <?  if(isset($opt_val['name'])){echo $opt_val['name'];}?>
                                                                    </span>
                                                                <? } else {?>
                                                                    <? if(isset($opt_val['name'])){echo $opt_val['name'];} ?>                                                        
                                                                <? }?>
                                                                
                                                            <? 
                                                            break;
                                                            }
                                                            ?>
                                                            
                                                        <?php } ?>
                                                        
                                                        </span>
                                                        <span class="pointer"></span></div>
                                                        <ul class="options" id="option-<?php echo $option['product_option_id']; ?>">
                                                        <? $y=0;?>
                                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                
                                                                    <li data-pref="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price']; ?>" data-povid="<?php echo $option_value['option_value_id']; ?>" class="<?= ($y == 0)?'active':''?>">
                                                                    <? if($option_value['image'] && $option['option_id'] == 5  && strpos($option['option_value'][0]['image'], 'no_image') == false){?>
                                                                    <img  width="20" src="<?php echo $option_value['image']; ?>"/>
                                                                    <? }?>
                                                                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" 
                                                                      value="<?php echo $option_value['product_option_value_id']; ?>" 
                                                                      id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                                      
                                                                    <span><?php echo $option_value['name'] ?></span></li>
                                                                        
                                                                      <? $y++;?>
                                                                                                                                  
                                                                <?php } ?>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            
                                            <?php } ?>
                                             <?php } ?>
                                              <?php } ?>
                                              </div>
                                        </ul>
                                    </form>
                                </div>
                                <div class="clearfix single-controls">         
          
                                    <a class="add-to-cart <?= (!$in_stock)?"grey":""?>"  id="button-cart" onclick="ga('send', 'event', 'Buy', 'Product', '<?= $heading_title; ?>');" ><?= $cart_button?></a>
                                    <a  <? if($islogin){?>onclick="addToWishList('<?php echo $product_id; ?>');"<? } else {?> href="/login" <? }?> class="add-to-favorite <?= ($islogin)?"":"fancy-login"?> <?= ($inWish)?'inWish':'' ?>" ><?= $wish_button?></a>
                                </div>
                                
                                 <div class="social clearfix">
                                    <div class="item vk">
                                       <script type="text/javascript">
                                      VK.init({apiId: 4004003, onlyWidgets: true});
                                    </script>
                                    
                                    <!-- Put this div tag to the place, where the Like block will be -->
                                   <div id="vk_like"></div>
                                    <script type="text/javascript">
                                    VK.Widgets.Like("vk_like", {type: "mini"});
                                    </script>
                                    </div>
                                    <div class="item gplus">
                                        <!--<div class="g-plusone" data-size="medium"></div>
                                       <script type="text/javascript">
                                            (function() {
                                                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                                po.src = 'https://apis.google.com/js/plusone.js';
                                                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                                            })();
                                        </script>-->
                                        <!-- Разместите этот тег в том месте, где должна отображаться кнопка +1 -->
                                        <g:plusone></g:plusone>
                                        <script type="text/javascript">
                                          gapi.plusone.go("product_content");
                                        </script>

                                    </div>
                                    <!--<div class="item twitter"><a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
                                        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></div>
                                    -->
                                    
                                    
                                   <div class="item fb">
                                    
                                    <div class="fb-like" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
                                     </div>
                                </div>
                                <!--<div class="social_share">
                                
                                <p>Рассказать друзьям</p>
                                
                                  <script type="text/javascript">(function() {
                                  if (window.pluso)if (typeof window.pluso.start == "function") return;
                                  if (window.ifpluso==undefined) { window.ifpluso = 1;
                                    var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
                                    s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
                                    s.src = ('https:' == window.location.protocol ? 'https' : 'http')  + '://share.pluso.ru/pluso-like.js';
                                    var h=d[g]('body')[0];
                                    h.appendChild(s);
                                  }})();</script>
                                <div class="pluso" data-background="#ffffff" data-options="medium,square,line,horizontal,nocounter,theme=04" data-services="facebook,vkontakte,google,twitter"></div> 
                                </div>-->
                                
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="mid-single">
                            <script type="text/javascript">
                                $(document).ready(function(){
                                        if ($(document).find("ul.strange-tabs").length > 0 && ($(window).width() > 480)){
        strangeTabs();
    }
                                });
                            </script>
                            <ul class="strange-tabs">
                                <li class="tab">
                                    
                                    <?php //foreach ($attribute_groups as $attribute_group) {  } //атрибуты?>
                                    
                                     <?php if ($composition) { ?>
                                                                              
                                          <a href="#" class="title"><?php echo $composition['name']; ?></a>
                                          
                                        <div class="tab-content">
                                          
                                          <? $i=0; ?>
                                            <?php foreach ($composition['attribute'] as $attribute) { ?>
                                            
                                            <? if($i==0){?>  
                                            <div class="big-text"><?= $attribute['text']; ?></div>
                                            <? } else if($i==1){?>
                                            <div class="notice"><?= $attribute['text']; ?></div>
                                             <div class="blue-text">Пищевая ценность на 100 г</div>
                                            <table class="food-table">
                                            <? } else {?>
                                            <tr>
                                                <td><?= $attribute['name']; ?></td>
                                                <td><?= $attribute['text']; ?></td>
                                            </tr>
                                        
                                            <? }?>
                                             
                                             <? $i++;?>
                                            <?php } ?>
                                           </table>
                                        </div>
                                      <?php } ?>
                                    
                                    
                                    
                                </li>
                                <li class="tab active">
                                    <a href="#" class="title">ОПИСАНИЕ</a>
                                    <div class="tab-content">
                                        <?= $description_clear?>
                                    </div>
                                </li>
                                
                                    <?php if($care){?>
                                     <li class="tab">
                                    <a href="#" class="title">
                                     <?= $care['name']; ?>
                                      </a>
                                    <div class="tab-content">
                                        <p><?= $care['attribute'][0]['text']; ?></p>
                                        
                                    </div>
                                </li>
                                     <?} ?>
                                   
                                <li class="tab">
                                    <a href="#" class="title">Сертификаты</a>
                                    <div class="tab-content">
                                    
                                    <? if($certificates){?>
                                         <?php foreach ($certificates['attribute'] as $certificate) { ?>
                                            <img src="image/data/certificate/<?php echo $certificate['attribute_id'] ?>.jpg" alt="<?php echo $certificate['name'] ?>" title="<?php echo $certificate['name'] ?>" />
                                        <? }?>
                                    <? }?>
                                     <?php if ($options) { ?>
                                            <?php foreach ($options as $option) { ?>
                                            
                                            <?php if ($option['type'] == 'image') { ?>
                                            
                                            
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                
                                            <img src="<?php echo $option_value['image'] ?>" alt="<?php echo $option_value['name'] ?>" title="<?php echo $option_value['name'] ?>" />
                                            
                                           <?php } ?>
                                                 
                                            
                                            <?php } ?>
                                             <?php } ?>
                                              <?php } ?>
                                    
                                    </div>
                                </li>
                                <li class="tab">
                                    <a href="#" id="rews" class="title">Отзывы (<?= $review_total ?>)</a>
                                    <div class="tab-content">
                                        <div class="clearfix">
                                            <span class="feed-count">отзывов: <?= $review_total ?> </span>
                                            <a href="#" class="add-feedback" data-id="0">Оставить отзыв</a>
                                        </div>
                                        <div id="review-title">
                                        </div>
                                        <ul class="feedbacks-list" id="review">
                                        <?php if ($revs) { ?>
                                            <?= $revs ?>
                                            <div class="pagination" style="text-align: center;"><?php echo $pagination; ?> 
											<div data-href="<?php echo $all_review; ?>" class="all_review">Все отзывы</div>
											</div>
                                        <?php } else { ?>
                                            <div class="content"><?php echo $text_no_reviews; ?></div>
                                        <?php } ?>
                                        </ul>
                                    </div>
                                </li>
                                <? if($is_tables == 1){?>
                                <li class="tab">
                                    <a href="#" class="title">Таблица размеров</a>
                                    <div class="tab-content">
                                        <ul class="size-tabs clearfix">
                                            <li class="size-tab active">
                                                <a href="#" class="top-level">Женские</a>
                                                <div class="content">
                                                    <div class="inner">
                                                        <div class="notice">Все размеры в сантиметрах</div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Одежда</div>
                                                            <div class="toggle-content">
                                                                <table class="table-responsive dark-table women">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Размер</th>
                                                                        <th>Обхват груди</th>
                                                                        <th>Обхват талии</th>
                                                                        <th>Обхват бедер</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td data-title="Размер">32</td>
                                                                        <td data-title="Обхват груди">74-77</td>
                                                                        <td data-title="Обхват талии">60-62</td>
                                                                        <td data-title="Обхват бедер">84-87</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">34</td>
                                                                        <td data-title="Обхват груди">78-81</td>
                                                                        <td data-title="Обхват талии">63-65</td>
                                                                        <td data-title="Обхват бедер">88-91</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">34</td>
                                                                        <td data-title="Обхват груди">78-81</td>
                                                                        <td data-title="Обхват талии">63-65</td>
                                                                        <td data-title="Обхват бедер">88-91</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Бюстгалтеры</div>
                                                            <div class="toggle-content">
                                                                <table class="table-responsive dark-table">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Размер</th>
                                                                        <th>Обхват под грудью</th>
                                                                        <th>Чашка В Обхват груди</th>
                                                                        <th>Чашка С Обхват груди</th>
                                                                        <th>Чашка D Обхват груди</th>
                                                                        <th>Чашка E Обхват груди</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td data-title="Размер">70</td>
                                                                        <td data-title="Обхват под грудью">68-72</td>
                                                                        <td data-title="Чашка В Обхват груди">84-86</td>
                                                                        <td data-title="Чашка С Обхват груди">86-88</td>
                                                                        <td data-title="Чашка D Обхват груди">88-90</td>
                                                                        <td data-title="Чашка E Обхват груди">90-92</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">75</td>
                                                                        <td data-title="Обхват под грудью">73-77</td>
                                                                        <td data-title="Чашка В Обхват груди">89-91</td>
                                                                        <td data-title="Чашка С Обхват груди">91-93</td>
                                                                        <td data-title="Чашка D Обхват груди">93-95</td>
                                                                        <td data-title="Чашка E Обхват груди">95-97</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="size-tab">
                                                <a href="#" class="top-level">Мужские</a>
                                                <div class="content">
                                                    <div class="inner">
                                                        <div class="notice">Все размеры в сантиметрах</div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Одежда</div>
                                                            <div class="toggle-content">
                                                                <table class="table-responsive dark-table women">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Размер</th>
                                                                            <th>Рост</th>
                                                                            <th>Обхват груди</th>
                                                                            <th>Обхват талии</th>
                                                                            <th>Боковая длина</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td data-title="Размер">40</td>
                                                                            <td data-title="Рост">160-164</td>
                                                                            <td data-title="Обхват груди">78-81</td>
                                                                            <td data-title="Обхват талии">66-69</td>
                                                                            <td data-title="Боковая длина">96-99</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td data-title="Размер">42</td>
                                                                            <td data-title="Рост">164-166</td>
                                                                            <td data-title="Обхват груди">82-85</td>
                                                                            <td data-title="Обхват талии">70-73</td>
                                                                            <td data-title="Боковая длина">98-100</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="size-tab">
                                                <a href="#" class="top-level">Подростки</a>
                                                <div class="content">
                                                    <div class="inner">
                                                        <div class="notice">Все размеры в сантиметрах</div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Одежда</div>
                                                            <div class="toggle-content">
                                                                <table class="table-responsive dark-table women">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Размер</th>
                                                                        <th>Возраст</th>
                                                                        <th>Рост</th>
                                                                        <th>Обхват груди</th>
                                                                        <th>Обхват талии</th>
                                                                        <th>Обхват бедер</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td data-title="Размер">128</td>
                                                                        <td data-title="Возраст">7-8 лет</td>
                                                                        <td data-title="Рост">123-135</td>
                                                                        <td data-title="Обхват груди">63-68</td>
                                                                        <td data-title="Обхват талии">57-61</td>
                                                                        <td data-title="Обхват бедер">67-73</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">140</td>
                                                                        <td data-title="Возраст">9-10 лет</td>
                                                                        <td data-title="Рост">135-147</td>
                                                                        <td data-title="Обхват груди">68-74</td>
                                                                        <td data-title="Обхват талии">61-65</td>
                                                                        <td data-title="Обхват бедер">73-79</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">152</td>
                                                                        <td data-title="Возраст">11-12 лет</td>
                                                                        <td data-title="Рост">147-152</td>
                                                                        <td data-title="Обхват груди">74-77</td>
                                                                        <td data-title="Обхват талии">65-67</td>
                                                                        <td data-title="Обхват бедер">79-82</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="size-tab">
                                                <a href="#" class="top-level">Детские</a>
                                                <div class="content">
                                                    <div class="inner">
                                                        <div class="notice">Все размеры в сантиметрах</div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Одежда</div>
                                                            <div class="toggle-content">
                                                                <table class="table-responsive dark-table women">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Размер</th>
                                                                        <th>Возраст</th>
                                                                        <th>Рост</th>
                                                                        <th>Обхват груди</th>
                                                                        <th>Обхват талии</th>
                                                                        <th>Обхват бедер</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td data-title="Размер">50</td>
                                                                        <td data-title="Возраст">1-2 мес.</td>
                                                                        <td data-title="Рост">40-50</td>
                                                                        <td data-title="Обхват груди">41-43</td>
                                                                        <td data-title="Обхват талии">41-43</td>
                                                                        <td data-title="Обхват бедер">41-43</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">56</td>
                                                                        <td data-title="Возраст">1-2 мес.</td>
                                                                        <td data-title="Рост">51-56</td>
                                                                        <td data-title="Обхват груди">43-45</td>
                                                                        <td data-title="Обхват талии">43-45</td>
                                                                        <td data-title="Обхват бедер">43-45</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">62</td>
                                                                        <td data-title="Возраст">3-7 мес.</td>
                                                                        <td data-title="Рост">57-62</td>
                                                                        <td data-title="Обхват груди">45-47</td>
                                                                        <td data-title="Обхват талии">45-47</td>
                                                                        <td data-title="Обхват бедер">45-47</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Недоношенные детки</div>
                                                            <div class="toggle-content">
                                                                <div class="subtitle">Одежда</div>
                                                                <table class="table-responsive dark-table women">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Размер</th>
                                                                        <th>Вес, кг</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td data-title="Размер">26</td>
                                                                        <td data-title="Вес, кг">0,5-1,0</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">33</td>
                                                                        <td data-title="Вес, кг">1-1,5</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">38</td>
                                                                        <td data-title="Вес, кг">1-2</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">44</td>
                                                                        <td data-title="Вес, кг">2-2,5</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">50</td>
                                                                        <td data-title="Вес, кг">2,5-3,5</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Многоразовые подгузники</div>
                                                            <div class="toggle-content">
                                                                <div class="t-description">Таблица выбора тренировочных трусиков</div>
                                                                <table class="table-responsive dark-table">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Размер</th>
                                                                        <th>Возраст</th>
                                                                        <th>Вес, кг</th>
                                                                        <th>Обхват талии</th>
                                                                        <th>Обхват ноги</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td data-title="Размер">S</td>
                                                                        <td data-title="Возраст">6-12 мес.</td>
                                                                        <td data-title="Вес, кг">6-12 кг</td>
                                                                        <td data-title="Обхват талии">41-43</td>
                                                                        <td data-title="Обхват ноги">41-43</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">M</td>
                                                                        <td data-title="Возраст">11мес.-2 года</td>
                                                                        <td data-title="Вес, кг">11-15 кг</td>
                                                                        <td data-title="Обхват талии">43-45</td>
                                                                        <td data-title="Обхват ноги">43-45</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Размер">L</td>
                                                                        <td data-title="Возраст">2-3 года</td>
                                                                        <td data-title="Вес, кг">14-19 кг</td>
                                                                        <td data-title="Обхват талии">45-47</td>
                                                                        <td data-title="Обхват ноги">45-47</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="toggle-section">
                                                            <div class="toggle-title">Таблица подбора набора многоразовых подгузников</div>
                                                            <div class="toggle-content">
                                                                <table class="table-cross dark-table">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Количество стирок</th>
                                                                        <th>Высаживающим</th>
                                                                        <th>Одноразовые + многоразовые подгузники</th>
                                                                        <th>Многоразовые подгузники</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td data-title="Количество стирок">несколько раз в день</td>
                                                                        <td data-title="Высаживающим">Пробный</td>
                                                                        <td data-title="Одноразовые + многоразовые подгузники">Пробный</td>
                                                                        <td data-title="Многоразовые подгузники">Стартовый</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Количество стирок">1р / в день</td>
                                                                        <td data-title="Высаживающим">Пробный</td>
                                                                        <td data-title="Одноразовые + многоразовые подгузники">Стартовый</td>
                                                                        <td data-title="Многоразовые подгузники">Стандартный</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Количество стирок">1р / 2 дня</td>
                                                                        <td data-title="Высаживающим">Стартовый</td>
                                                                        <td data-title="Одноразовые + многоразовые подгузники">Стандартный</td>
                                                                        <td data-title="Многоразовые подгузники">Стандартный</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td data-title="Количество стирок">1р / 2 дня + доп. аксессуары</td>
                                                                        <td data-title="Высаживающим">-</td>
                                                                        <td data-title="Одноразовые + многоразовые подгузники">Большой</td>
                                                                        <td data-title="Многоразовые подгузники">Большой</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                
                                <? }?>
                            </ul>
                        </div>
                          <?php if ($products) { ?>
                          <section class="catalog catalog-slider index-promo" id="popular-slider">
                            <h2>ПОДОБНЫЕ ТОВАРЫ</h2>
                            <div class="trades">
                            <?php foreach ($products as $product) { ?>
                            
                                <div class="item">
                                 <?php if ($product['thumb']) { ?>
                                    <div class="thumb div-link" data-href="<?php echo "/".str_replace( HTTP_SERVER,"",$product['href']); ?>">
                                        <div>
                                        <img src="<?php echo $product['thumb']; ?>" alt="">
                                        </div>
                                    </div>
                                 <?php } ?>
                                 
                                 <? if($product['rating'] > 0){?>
                                     <div class="rat_rev">
                                        <div class="raiting"><div style="width: <?= $product['rating']*20?>%"></div></div><span class="rev_min"><?= $product['reviews']?></span><br/>
                                     </div>   
                                 <? }?>
                                    
                                    <span><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
                                    <?php if ($product['price']) { ?>
                                    <div class="price"><?php echo $product['price']; ?></div>
                                    <?php } ?>
                                    
                                    <a class="add-to-cart" onclick="addToCart('<?php echo $product['product_id']; ?>'); ga('send', 'event', 'Buy', 'Cross', '<?= $product['name']; ?>');" title="<?php echo $button_cart; ?>"></a>
                                </div>
                           <?php } ?>
                            </div>
                            <span class="control prev" title=""></span>
                            <span class="control next" title=""></span>
                        </section>
                          <?php } ?>
                          
                   
                        <?php echo $content_bottom; ?>
                    </div>
                </div>
            </div>
        </div>
        <div id="clear"></div>
        <div class="pop_up">
        <h3>Сообщить, <br /> когда появится в продаже</h3>
        <form action="" >
        <span class="err_name"></span>
        <span class="err_email"></span>
        
        <label>Имя</label><br />
        <input type="text" name="name" id="name" value=""  />
        <label>Email</label><br />
        <input type="text" name="email" id="email" value=""  />
        <input type="hidden" value="<?php echo $product_id; ?>" name="product_id" />
        
        <a class="pop_click">Отправить</a>
        <a class="pop_cancel">Отмена</a>
        
        </form>
        </div>
        
    </div>
</div>


<script type="text/javascript"><!--
/*-$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});-*/
//--></script> 
<script type="text/javascript"><!--


$("#opt").load("index.php?route=product/product/product_option&product_id=<?php echo $product_id; ?>&option_1=&option_2=  > *");


$('.wait_show').click(function(){
   $('.pop_up').fadeIn(); 
});
$('.pop_cancel').click(function(){
   $('.pop_up').fadeOut(); 
});
/*-$('.trade-features input[type=\'text\'], .trade-features .active input[type=\'hidden\'], .trade-features input[type=\'radio\']:checked, .trade-features input[type=\'checkbox\']:checked, .trade-features select, .trade-features textarea').css('color', 'green');-*/
$('.pop_click').live('click', function() {
	$.ajax({
		url: 'index.php?route=account/waitlist/addLogout',
		type: 'post',
		data: $('.pop_up input[type=\'text\'], .pop_up input[type=\'hidden\']'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
			 
                $('.pop_up').delay(10).fadeOut(500);//.html(json['success'])
                $('.wait_show').css('color', '#BBD569').html('V Сообщить когда появится');
                
             /*-
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');-*/
			} else {
			 $('.err_name').html(json['name']);
             $('.err_email').html(json['email']);
			}	
		}
	});
});

$('ul.options li').live('click', function() {
    /*-$('#pure_price').val(parseFloat(parseFloat($(this).attr('data-price')) + parseFloat($('#pure_price').val())).toFixed(2));-*/
    /*-$('.price').html($(this).attr('data-price') + $(this).attr('data-pr'));-*/
}, function(){
    var val_2 = "";
    var price = parseFloat($(this).attr('data-price'));
    $('ul.options li.active').not($(this).parent().find('li')).each(function(){
        price += parseFloat($(this).attr('data-price'));
        val_2 = $(this).attr('data-povid');
    });
    
    //$('.price').html(parseFloat(price + parseFloat($('#pure_price').val())).toFixed(2) + $('#pref').val());
    if($(this).parent().parent().attr('id') == "color"){
        $("#opt").load("index.php?route=product/product/product_option&product_id=<?php echo $product_id; ?>&option_1=" + $(this).attr('data-povid') +"&option_2=" + val_2 + "  > *");
    }
    
   	$.ajax({
		url: 'index.php?route=product/product/product_option_price',
		type: 'post',
		data: 'product_id=<?php echo $product_id; ?>&option_1='  + $(this).attr('data-povid') +'&option_2=' + val_2,
		dataType: 'json',
		success: function(json) {
		
        var price_new = parseFloat(json['price']).toFixed(2);
        var pric_c = parseFloat($('#pure_price').val()).toFixed(2);
        var pric_c_s = parseFloat($('#pure_price_spec').val()).toFixed(2);
        var pric = parseFloat(1*pric_c + 1*price_new);
        
        if($('.price span').length == 0){
            $('.price').html(pric.toFixed(2) + $('#pref').val());
            $('.price_opt').val(1*price_new);
        } else {
            var pers = parseFloat($('.percent').text());
            var pric_s = parseFloat(1*pric_c_s + 1*price_new*pers);
           /*- alert(pric_s);-*/
            $('.price .through').html((1*pric_c + 1*price_new).toFixed(2) + $('#pref').val());
            $('.price .price-new').html((pric*pers).toFixed(2) + $('#pref').val());
            $('.price_opt').val((1*pric_s - pric_c_s).toFixed(2));
        }
        
               /*- $('#top_cart').load('index.php?route=module/cart > *', function(){
                    $('.recipe-products').show();
                 });-*/
         /*-through price-new percent-*/
        	
		}
	});
    
    
    
});

$('#button-cart').bind('click', function() {
    <? if($in_stock){?>
    	$.ajax({
    		url: 'index.php?route=checkout/cart/add',
    		type: 'post',
    		data: $('.trade-features input[type=\'text\'], .trade-features .active input[type=\'hidden\'], .trade-features input[type=\'radio\']:checked, .trade-features input[type=\'checkbox\']:checked, .trade-features select, .trade-features textarea'),
    		dataType: 'json',
    		success: function(json) {
    		  
    			$('.success, .warning, .attention, information, .error').remove();
    			
    			if (json['error']) {
    				if (json['error']['option']) {
    					for (i in json['error']['option']) {
    						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
    					}
    				}
    			} 
    			if (json['success']) {
                    
                    
                    /*-$('.mini-cart').load('index.php?route=module/cart *');-*/
                     $('#top_cart').load('index.php?route=module/cart > *', function(){
                        
                        $('#cart_pop_up').show(100, function(){
                            recipeProducts();                 
                        });
                     });
                    
    				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
    					
    				$('.success').fadeIn('slow');
    					
    				$('#cart-total').html(json['total']);
    				
    				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
                    
    			}	
    		} 
    	});
    <? }?>
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('.pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href, function(){
	   strangeTabs();   
	});
	
	$('#review').fadeIn('slow');
	
	return false;
});	
$('#review .pagination > .all_review').click( function() {

	$('#review').fadeOut('slow');
		
	$('#review').load($(this).attr("data-href"), function(){
	   strangeTabs();   
	});
	
	$('#review').fadeIn('slow');
	
	return false;
});	
		

/*-$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');-*/

$('.useful a').live('click', function() {
    
    var elem = $(this);
    var child = $(this).children('span');
    
	$.ajax({
		url: 'index.php?route=product/product/useful&useful='+ $(this).attr('data-useful') + '&use=' + $(this).attr('data-use') + '&rev_id=' + $(this).attr('data-id'),
		type: 'post',
		dataType: 'json',
	    success: function(data) {
	       child.html(+elem.attr('data-useful') + 1);
           
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
			/*-	$('#review-title').after('<div class="success">' + data['success'] + '</div>');-*/
				
			}
		}
	});
    
           
});




$('.btn-submit-gray').live('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>&rating=' + $('.feedback-form .raiting span').attr('data-rating'),
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&parent_id=' + encodeURIComponent($('input[name=\'parent_id\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
                $('[name=name], [name=text]').css('borderColor', '#cccccc');
                if(data['errorname']){
                    $('[name=name]').css('borderColor', '#cc3333 ');
                } else if(data['errortext']){
                    $('[name=text]').css('borderColor', '#cc3333 ');
                }
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
			}
		}
	});
});
//--></script> 


<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<?php echo $footer; ?>