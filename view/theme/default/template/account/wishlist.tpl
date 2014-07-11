<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>


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
                            <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                            <div class="content">
                                <div class="catalog grid catalog-page catalog-wishes">
                                    <div class="items">
                                    
                                    
                                    <?php if ($products) { ?>
                                    <?php foreach ($products as $product) { ?>
                                    <article class="item"  id="wishlist-row<?php echo $product['product_id']; ?>">
                                    <?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>" class="thumb">
                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                                        <a href="<?php echo $product['remove']; ?>" class="delete"></a>
                                        </a>
                                    <?php } ?>
                                    <div class="content">
                                                <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                                <div class="price"><?php echo $product['price']; ?></div>
                                                <div class="excerpt">
                                                    <p>номер: <?php echo $product['product_id']; ?></p>
                                                    <p>цвет: перламутровые пуговки</p>
                                                    <p>размер: 36</p>
                                                </div>
                                                <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="add-to-cart" title="Добавить в корзину"></a>
                                            </div>
                                        </article>
                                    
                                     <?php } ?>
                                    <?php } else { ?>
                                     <div class="content"><?php echo $text_empty; ?></div>
                                      <div class="buttons">
                                        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
                                      </div>
                                      <?php } ?>
                                      
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="clear"></div>
    </div>
</div>

<?php echo $footer; ?>