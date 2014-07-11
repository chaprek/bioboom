    <section class="catalog catalog-slider index-promo" id="popular-slider">
                        <h2>ПОПУЛЯРНЫЕ<?php //echo $heading_title; ?></h2>
                        <div class="trades">
                        <?php foreach ($products as $product) { ?>
                        
                            <div class="item">
                             <?php if ($product['thumb']) { ?>
                                <div class="thumb div-link" data-href="<?php echo $product['href']; ?>">
                                    <img src="<?php echo $product['thumb']; ?>" alt="">
                                </div>
                             <?php } ?>
                                <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                <?php if ($product['price']) { ?>
                                <div class="price"><?php echo $product['price']; ?></div>
                                <?php } ?>
                                
                                <a class="add-to-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" title="<?php echo $button_cart; ?>"></a>
                            </div>
                       <?php } ?>
                        </div>
                        <span class="control prev" title=""></span>
                        <span class="control next" title=""></span>
                    </section>

