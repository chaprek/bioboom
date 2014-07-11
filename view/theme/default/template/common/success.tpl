<?php echo $header; ?>

<?

if(isset($order_info) && isset($order_id)){

//print_r($order_info);

foreach($order_info['totals'] as $o_inf){
    if($o_inf['code'] == "sub_total"){
        $total = $o_inf['value']; 
    }
     if($o_inf['code'] == "shipping"){
        $shipping = $o_inf['value']; 
    }
}

?>


<script>

ga('ecommerce:addTransaction', {
  'id': '<?= $order_id?>',                     // Transaction ID. Required.
  'revenue': '<?= $total?>',               // Grand Total.
  'shipping': '<?= $shipping?>'
});


<? foreach($order_info['products'] as $product){?>
ga('ecommerce:addItem', {
  'id': <?= $order_id?>,                     // Transaction ID. Required.
  'name': '<?= $product['name']?>',    // Product name. Required.
  'sku': '<?= $product['product_id']?>',
  'price': '<?= $product['price']?>',                 // Unit price.
  'quantity': '<?= $product['quantity']?>'                   // Quantity.
});
<? }?>

ga('ecommerce:send');

</script>

<?
}
?>

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
                            <div class="post-content">
                                <img src="images/newsletter.png" alt="" style="margin: 0 20px 20px 0; float: left">
                                <h2></h2>
                                <?php echo $text_message; ?>
                               <!-- <p style="text-indent: 0;">На указанный Вами адрес выслано сообщение с активационной ссылкой. </p>
                                <p style="font-size: 12px; text-indent: 0;">Если вы не обнаружили письмо в течении 2 минут, проверьте папку спам.</p>-->
                                <p><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></p>
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