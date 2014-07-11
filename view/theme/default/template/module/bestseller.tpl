    <section class="catalog catalog-slider index-promo" id="top-slider">
                        <h2>ТОП БИО-ТОВАРОВ<?php //echo $heading_title; ?></h2>
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
                                <div class="clearfix mb10">
                                    <div class="raiting">
                                        <div style="width: <?= $product['rating']*20?>%"></div>
                                    </div>
                                <span class="raiting-count rews_top">Отзывов: <?php echo $product['reviews']; ?></span>
                                </div>
                             <? }?>
                                <span><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
                                <?php if ($product['price']) { ?>
                                <div class="price"><?php echo $product['price']; ?></div>
                                <?php } ?>
                                
                                <a class="add-to-cart" onclick="addToCart('<?php echo $product['product_id']; ?>'); ga('send', 'event', 'Buy', 'Top', '<?= $product['name']; ?>');" title="<?php echo $button_cart; ?>"></a>
                            </div>
                       <?php } ?>
                        </div>
                        <span class="control prev" title=""></span>
                        <span class="control next" title=""></span>
                    </section>

