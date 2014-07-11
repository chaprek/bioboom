<li class="top-level">
    <a class="top-level" href="#"><?php echo $heading_title ?></a>
    <ul>
        <?php if (!$logged) { ?>
            <li class="<?= (strpos($login, $reques) === false)?"":"active"?>" ><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> / <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li class="<?= (strpos($forgotten, $reques) === false)?"":"active"?>"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
        <?php } ?>
        
        <li class="<?= (strpos($account, $reques) === false)?"":"active"?>"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
        <li class="<?= (strpos($order, $reques) === false)?"":"active"?>"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li class="<?= (strpos("#", $reques) === false)?"":"active"?>"><a href="#">Истории посылок</a></li>
        <li class="<?= (strpos($return, $reques) === false)?"":"active"?>"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li class="<?= (strpos("#", $reques) === false)?"":"active"?>"><a href="coupons.html">Купоны</a></li>
        <li class="<?= (strpos($wishlist, $reques) === false)?"":"active"?>"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
        <li class="<?= (strpos($waitlist, $reques) === false)?"":"active"?>"><a href="<?php echo $waitlist; ?>">Лист ожидания</a> <span class="count">(<?= $wait_count?>)</span></li>
        
        <?php if ($logged) { ?>
            <li class="<?= (strpos($logout, $reques) === false)?"":"active"?>"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
        <?php } ?>
        
        <!--<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            -->                            
    </ul>
</li>