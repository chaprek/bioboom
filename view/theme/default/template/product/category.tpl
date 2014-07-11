<?php echo $header; ?><?php echo $column_right; ?>


    <div id="main">
        <div class="wrapper" role="main">
            <div class="container">
                <div class="page">
                    <div class="breadcrumbs">
                          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                            <?php echo $breadcrumb['separator']; ?><a  <? if(!empty($breadcrumb['href'])){ ?> href="<?php echo $breadcrumb['href']; ?>"<? } ?> class="crumb"><?php echo $breadcrumb['text']; ?></a>
                          <?php } ?>
                    </div>
                    <div class="main-content clearfix">
                        <?php echo $column_left; ?>
                        <div class="big-side">
                        <?php echo $content_top; ?>
                            <div class="category-pict">
                                <?php if (!empty($thumb)) { ?>
                                <img src="<?php echo $thumb; ?>" alt=""/>
                                <?php } ?>
                            </div>
                            
                            <div class="cat-title"><h1><?php echo ($second_title)?$second_title:$heading_title; ?></h1> <span class="count">(<?= $product_total?>)</span></div>
                            <div class="catalog-filters">
                                <div class="view-mode">
                                    <a href="#" class="list" id="list"></a>
                                    <a href="#" class="grid active" id="grid"></a>
                                </div>
                                <div class="sort-type c-select">
                                    <div class="pointer"></div>
                                    <select id="sort-type"  onchange="location = this.value;">
                                       <?php foreach ($sorts as $sorts) { ?>
                                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                                   
                                        
                                    </select>
                                </div>
                                <div class="per-page">
                                    <span class="text"><?php echo $text_limit; ?></span>
                                    <div class="c-select pager">
                                        <div class="pointer"></div>
                                        <select id="per-page"  onchange="location = this.value;">
                                                <?php foreach ($limits as $limits) { ?>
                                                <?php if ($limits['value'] == $limit) { ?>
                                                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                        </select>
                                                                                
                                    </div>
                                </div>
                            </div>
                            
                            <div class="pagenav">
                              <?php echo $pagination; ?>
                              </div>
                              
                            <div class="catalog grid catalog-page">
                                <div class="items">
                                <?php foreach ($products as $product) { ?>
                                    <article class="item">
                                    <?php if ($product['thumb']) { ?>
                                        <a href="<?php echo "/".str_replace( HTTP_SERVER,"",$product['href']); ?>" class="thumb">
                                            <div>
                                            
                                    <div class="<?= $product['mark']?>"></div>
                                            <img src="<?php echo $product['thumb']; ?>"  title="<?php echo $product['name']; ?> в БиоБутике" alt="<?php echo $product['name']; ?>" />
                                            </div>
                                        </a>
                                    <?php } ?>
                                    
                                        <div class="content">
                                            <span><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
                                            <div class="excerpt"><?php echo $product['description']; ?></div>
                                            <div class="price">
                                            <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                            <?php } else { ?>
                                            <span class="through"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                            <?php } ?>
                                            
                                            </div>
                                            <? if($product['in_stock']){?>
                                            <a onclick="addToCart('<?php echo $product['product_id']; ?>'); ga('send', 'event', 'Buy', 'Catalog', '<?= $product['name']; ?>');" class="add-to-cart" title="<?php echo $button_cart; ?>"></a>
                                            <? } else {?>
                                            <a href="<?php echo $product['href']; ?>" class="add-to-cart disable" title="<?php echo $button_cart; ?>"></a>
                                            <? }?>
                                        </div>
                                        <div class="clear"></div>
                                    </article>
                               <?php } ?>     
                                    
                                </div>
                              </div>
                              <div class="pagenav clearfix">
                              <?php echo $pagination; ?>
                                                            
                                                        </div>
                                                        
                                                        <?php if (!$categories && !$products) { ?>
                              <div class="content"><?php echo $text_empty; ?></div>
                              <div class="buttons">
                                <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
                              </div>
                              <?php } ?>
                              
                              <div class="good_text">
                              <?= $description_seo?>
                              </div>
                              
                              <?php echo $content_bottom; ?></div>
                            </div>
                                 </div>
            </div>
        </div>
        <div id="clear"></div>
    </div>
</div>

<?php echo $footer; ?>