    <a class="mini-cart full" href="<?php echo $cart; ?>">
        <i class="cart-icon"></i><?php echo $text_items; ?> 
     </a>
     
     <div class="recipe-products popup-window" id="cart_pop_up">
        <a href="#" class="close"></a>
        
        <?php if ($products || $vouchers) { ?>
        
        <div class="container clearfix">
            <h2>Товар добавлен в корзину</h2>
            <table class="products-list hidden480">
                <tbody>
                <?php foreach ($products as $product) { ?>
                    <tr><!--(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : -->
                        <td class="dlt"><a class="remove" data-key="<?php echo $product['key']; ?>" ></a></td>
                        <td class="preview">
                            <div class="preview-wrap">
                                <div class="trades-wrap">
                                    <?php if ($product['thumb']) { ?>
                                        <ul class="trades-list">
                                            <li><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"></a></li>
                                        </ul>
                                    <?php } ?>
                                </div>
                            </div>
                        </td>
                        <td class="name"><?php echo $product['name']; ?></td>
                        <td class="count">
                            <div class="trade-count">
                            <form>
                                <input type="text" name="quantity[<?php echo $product['key']; ?>]" class="quantity" value="<?php echo $product['quantity']; ?>" />
                                <input type="hidden" value="<?= $product['key']?>" name="key" />
                                <input type="hidden" value="1" name="min_cart" />
                                <button type="button" class="inc inc_min"></button>
                                <button type="button" class="dec dec_min"></button>
                                </form>
                            </div>
                        </td>
                        <td class="price"><?php echo $product['total']; ?></td>
                    </tr>
<?php } ?>
 <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image"></td>
          <td class="name"><?php echo $voucher['description']; ?></td>
          <td class="quantity">x&nbsp;1</td>
          <td class="total"><?php echo $voucher['amount']; ?></td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
        </tr>
        <?php } ?>
    </tbody>
    </table>
            <div class="products-480">
            <?php foreach ($products as $product) { ?>
                <div class="item clearfix">
                    <div class="dlt col">
                        <a href="#" class="remove"></a>
                    </div>
                    <div class="preview col">
                        <div class="preview-wrap">
                            <div class="trades-wrap">
                            <?php if ($product['thumb']) { ?>
                                <ul class="trades-list">
                                    <li><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></li>
                                </ul>
                                  <?php } ?>
                            </div>
                        </div>
                    </div>
                    <div class="name col">
                        <?php echo $product['name']; ?>
                    </div>
                    <div class="count col">
                        <div class="trade-count">
                        <form>
                            <input type="text" class="quantity" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>">
                            <input type="hidden" value="<?= $product['key']?>" name="key" />
                            <input type="hidden" value="1" name="min_cart" />
                            <button type="button" class="inc inc_min"></button>
                            <button type="button" class="dec dec_min"></button>
                            </form>
                        </div>
                    </div>
                    <div class="price col"><?php echo $product['total']; ?></div>
                    <div class="to-cart col"><a href="#" class="add-to-cart"></a></div>
                </div>
            <?php } ?>
            </div>
           <a class="btn-gray add-alll" style="padding: 0 18px;" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> 
           <a href="<?php echo $checkout; ?>" class="add-all btn-green"><?php echo $text_checkout; ?></a>
        </div>
<?php } ?>
    </div>