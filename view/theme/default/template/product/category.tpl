<?php echo $header; ?><?php echo $column_right; ?>



    <div id="main">
        <div class="wrapper" role="main">
            <div class="container">
                <div class="page">
                    <div class="breadcrumbs">
                          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"  class="crumb"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
                    </div>
                    <div class="main-content clearfix">
                        <?php echo $column_left; ?>
                        <div class="big-side">
                        <?php echo $content_top; ?>
                            <div class="category-pict">
                                <img src="<?php echo $thumb; ?>" alt="">
                            </div>
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
                            <h2 class="cat-title"><?php echo $heading_title; ?> <span class="count">(56)</span></h2>
                            <div class="catalog grid catalog-page">
                                <div class="items">
                                <?php foreach ($products as $product) { ?>
                                    <article class="item">
                                    
                                    <?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>" class="thumb">
                                            <img src="<?php echo $product['thumb']; ?>"  title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                                        </a>
                                    <?php } ?>
                                    
                                        <div class="content">
                                            <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                            <div class="excerpt"><?php echo $product['description']; ?></div>
                                            <div class="price"><?php echo $product['price']; ?></div>
                                            <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="add-to-cart" title="<?php echo $button_cart; ?>"></a>
                                        </div>
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
                              
                              <?php echo $content_bottom; ?></div>
                            </div>
                                 </div>
            </div>
        </div>
        <div id="clear"></div>
    </div>
</div>

<?php echo $footer; ?>