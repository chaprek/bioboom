<li class="top-level">
    <a class="top-level" ><?php echo $heading_title ?></a>
    <?php if ($logged) { ?>
    <ul>
        <?php if (!$logged) { ?>
            <li class="<?= (strpos($login, $reques) === false)?"":"active"?>" ><a class="<?= (!$logged)?"fancy-login":""?>" href="<?php echo $login; ?>"><?php echo $text_login; ?></a> / <a class="<?= (!$logged)?"fancy-reg":""?>" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li class="<?= (strpos($forgotten, $reques) === false)?"":"active"?> <?= (!$logged)?"fancy-login":""?>"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
        <?php } ?>
        
        <li class="<?= (strpos($account, $reques) === false)?"":"active"?> <?= (!$logged)?"fancy-login":""?>"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
        <li class="<?= (strpos($order, $reques) === false)?"":"active"?> <?= (!$logged)?"fancy-login":""?>"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <!--<li class="<?= (strpos("#", $reques) === false)?"":"active"?>"><a href="#">Истории посылок</a></li>-->
        <li class="<?= (strpos($return, $reques) === false)?"":"active"?> <?= (!$logged)?"fancy-login":""?>"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li class="<?= (strpos("http://bioboom.ua/index.php?route=account/coupons", $reques) === false)?"":"active"?> <?= (!$logged)?"fancy-login":""?>"><a href="http://bioboom.ua/index.php?route=account/coupons">Купоны</a></li>
        <li class="<?= (strpos($wishlist, $reques) === false)?"":"active"?> <?= (!$logged)?"fancy-login":""?>"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
        <li class="<?= (strpos($waitlist, $reques) === false)?"":"active"?> <?= (!$logged)?"fancy-login":""?>"><a href="<?php echo $waitlist; ?>">Лист ожидания</a> <span class="count">(<?= $wait_count?>)</span></li>
        
        <?php if ($logged) { ?>
            <li class="<?= (strpos($logout, $reques) === false)?"":"active"?>"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
        <?php } ?>
        
        <!--<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            -->                            
    </ul>
    
    <? }?>        
</li>