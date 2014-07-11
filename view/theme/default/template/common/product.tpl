<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>


 <div id="main">
        <div class="wrapper" role="main">
            <div class="container">
                <div class="page">
                
                    <div class="breadcrumbs">
                      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                    </div>
                    
<?php echo $content_top; ?>

   <div class="main-content clearfix single">
                        <div class="top-single clearfix">
                            <div class="trade-gallery" id="gallery">
                                                    
                            <?php if ($thumb || $images) { ?>
                                <div class="preview">
                                <?php if ($thumb) { ?>
                                    <a href="<?php echo $thumb; ?>" rel="fancybox">
                                        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                    </a>
                                  <?php } ?>  
                                </div>
                                <div class="thumbs-list" id="thumbs">
                                    <div class="thumbs-wrap">
                                    <?php if ($images) { ?>
                                        <ul class="thumbs">
                                            <?php foreach ($images as $image) { ?>
                                                <li>
                                                    <a href="<?php echo $image['popup']; ?>" rel="fancybox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                                                </li>
                                            
                                            <?php } ?>
                                             <?php if ($thumb) { ?>
                                             <li>
                                                <a href="<?php echo $thumb; ?>" rel="fancybox">
                                                    <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                                </a>
                                             </li>
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


                            <div class="rside-detail">
                                <h1><?php echo $heading_title; ?></h1>
                                <div class="size">
                                <? if($chunk){?>
                                <?php foreach($chunk['attribute'] as $attr){
                                    echo $attr['text'];
                                } ?>
                                <? }?>
                                </div>
                                <div class="clearfix">
                                    <div class="availability <?= ($in_stock)?"yes":""; ?>"><?php echo $stock; ?></div>
                                    <? if(!$in_stock){?>
                                        <? if($islogin){?>
                                            <a onclick="addToWaitlist('<?php echo $product_id; ?>');" class="add-to-wait">+ в лист ожидания</a>
                                        <? } else {?>
                                            <a class="wait_show">Сообщить когда появится</a>
                                        <? }?>
                                    <? }?>
                                    <?php if ($review_status) { ?>
                                    
                                    <div class="raiting"><div style="width: <?= $rating*20?>%"></div></div>
                                    <span class="raiting-count"><?php echo $reviews_w; ?></span>
                                    
                                      <?php } ?>
                                    
                                    
                                </div>
                                <div class="price"><?php echo $price; ?></div>
                                <div><?php echo $short_description; ?>...</div>
                                <div class="social clearfix">
                                    <div class="item vk">
                                       <!-- <div id="vk_like"></div>
                                        <script type="text/javascript">
                                            VK.Widgets.Like("vk_like", {type: "mini"});
                                        </script>     -->
                                    </div>
                                    <div class="item gplus">
                                        <div class="g-plusone" data-size="medium"></div>
                                        <script type="text/javascript">
                                            (function() {
                                                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                                po.src = 'https://apis.google.com/js/plusone.js';
                                                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                                            })();
                                        </script>
                                    </div>
                                    <div class="item twitter"><a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
                                        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></div>
                                    <div class="item fb">
                                        <div id="fb-root"></div>
                                        <script>(function(d, s, id) {
                                            var js, fjs = d.getElementsByTagName(s)[0];
                                            if (d.getElementById(id)) return;
                                            js = d.createElement(s); js.id = id;
                                            js.src = "//connect.facebook.net/ru_RU/all.js#xfbml=1";
                                            fjs.parentNode.insertBefore(js, fjs);
                                        }(document, 'script', 'facebook-jssdk'));</script>

                                        <div class="fb-like" data-href="http://developers.facebook.com/docs/reference/plugins/like" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
                                    </div>
                                </div>
                                
                                
                                   <div class="trade-features">
                                    <form>
                                    <div class="active">
                                    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
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
                                            
                                            <?php if ($options) { ?>
                                            <?php foreach ($options as $option) { ?>
                                            
                                            <?php if ($option['type'] == 'select') { ?>
                                            <li class="feature">
                                                <div class="title"><?php echo $option['name']; ?></div>
                                                <div class="content clearfix">
                                                    <div class="div-select" id="color">
                                                        <div class="current">
                                                        <span class="text">
                                                        <? if($option['option_value'][0]['image']){?>
                                                            <img  width="20" src="<? echo $option['option_value'][0]['image']?>"/>
                                                            <span>
                                                                <? echo $option['option_value'][0]['name']?>
                                                            </span>
                                                        <? } else {?>
                                                            <? echo $option['option_value'][0]['name']?>                                                        
                                                        <? }?>
                                                        </span>
                                                        <span class="pointer"></span></div>
                                                        <ul class="options"  id="option-<?php echo $option['product_option_id']; ?>">
                                                        <? $y=0;?>
                                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                
                                                                <li class="<?= ($y == 0)?'active':''?>">
                                                                <? if($option_value['image']){?>
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
                                            <!--<li class="feature">
                                                <div class="title">Комплект</div>
                                                <div class="content clearfix">
                                                    <div class="div-select" id="complect">
                                                        <div class="current"><span class="text">майка+леггинсы</span><span class="pointer"></span></div>
                                                        <ul class="options">
                                                            <li><span>майка+леггинсы</span></li>
                                                            <li class="active">
                                                            
          
                                                            <span>трусы+носки</span></li>
                                                            <li><span>валенки</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>-->
                                        </ul>
                                    </form>
                                </div>
                                <div class="clearfix single-controls">         
          
                                    <a class="add-to-cart"  id="button-cart" >+ моя био-корзина</a>
                                    <a onclick="addToWishList('<?php echo $product_id; ?>');" class="add-to-favorite">+ в мои желания</a>
                                </div>
                            </div>
                        </div>
                        <div class="mid-single">
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
                                    <a href="#" class="title">Отзывы (<?= $review_total ?>)</a>
                                    <div class="tab-content">
                                        <div class="clearfix">
                                            <span class="feed-count"><?= $review_total ?> отзывов</span>
                                            <a href="#" class="add-feedback" data-id="0">Оставить отзыв</a>
                                        </div>
                                        <div id="review-title">
                                        </div>
                                        <ul class="feedbacks-list" id="review">
                                        <?php if ($revs) { ?>
                                            <?= $revs ?>
                                            <div class="pagination" style="text-align: center;"><?php echo $pagination; ?> <a href="<?php echo $all_review; ?>" class="all_review">Все отзывы</a></div>
                                        <?php } else { ?>
                                            <div class="content"><?php echo $text_no_reviews; ?></div>
                                        <?php } ?>
                                        </ul>
                                    </div>
                                </li>
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
                            </ul>
                        </div>
                   <!-- <section class="index-promo">
                            <h2>ГОТОВИМ ОРГАНИЧНО</h2>
                            <div class="recipes noslide-list">
                                <div class="item">
                                    <a href="#" class="thumb">
                                        <img src="images/articles/img-1.jpg" alt="">
                                    </a>
                                    <div class="desc">
                                        <h3><a href="#">Каша из топора</a></h3>
                                        <div class="excerpt">Приготовьте томаты, базилик, петрушку, чеснок и сыр, как указано в инструкции. Приготовьте томаты,</div>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="#" class="thumb">
                                        <img src="images/articles/img-1.jpg" alt="">
                                    </a>
                                    <div class="desc">
                                        <h3><a href="#">Каша из топора</a></h3>
                                        <div class="excerpt">Приготовьте томаты, базилик, петрушку, чеснок и сыр, как указано в инструкции. Приготовьте томаты,</div>
                                    </div>
                                </div>
                                <div class="item">
                                    <a href="#" class="thumb">
                                        <img src="images/articles/img-1.jpg" alt="">
                                    </a>
                                    <div class="desc">
                                        <h3><a href="#">Каша из топора</a></h3>
                                        <div class="excerpt">Приготовьте томаты, базилик, петрушку, чеснок и сыр, как указано в инструкции. Приготовьте томаты,</div>
                                    </div>
                                </div>
                            </div>
                        </section>-->
                        <?php echo $content_bottom; ?>
                    </div>
                </div>
            </div>
        </div>
        <div id="clear"></div>
        <div class="pop_up">
        <h3>Сообщить, <br /> когда появится в продаже</h3>
        <form action="" >
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
             /*-
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');-*/
			}	
		}
	});
});

$('#button-cart').bind('click', function() {
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
                
                $('.mini-cart').load('index.php?route=module/cart *');
                
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		} 
	});
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

<script type="text/javascript"><!--
/*-$('#tabs a').tabs();-*/
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
/*-if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});-*/
//--></script> 
<?php echo $footer; ?>