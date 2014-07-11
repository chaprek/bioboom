<?php echo $header; ?>




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
                        <h1 class="personal-title">Купоны</h1>
                        <div class="content">
                            <div class="coupons-side">
                                <img src="images/coupons.png" alt="">
                            </div>
                            <div class="coupons-main">
                                <p>Если Вы являетесь  зарегистрированным пользователем интернет-магазина БіоБум, то Вы гарантированно получаете дополнительную привилегию на самые разнообразные скидки и акции именно для Вас.</p>
                                <p><strong>Чтобы получить дополнительные бонусы, участвуйте в наших конкурсах.</strong><br>
                                Актуальную информацию о них Вы всегда найдете на наших страницах в Facebook и Вконтакте.</p>
                                <table class="table-coupons">
                                    <thead>
                                        <tr>
                                            <th>Код купона*</th>
                                            <th>Предоставляемая скидка</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <? if(isset($coupons)){?>
                                    
                                    <? foreach($coupons as $coupon){?>
                                        <tr>
                                            <td><?= $coupon['code']?></td>
                                            <td><?= $coupon['name']?></td>
                                        </tr>
                                        <? }?>
                                    <? }?>
                                    </tbody>
                                </table>
                                <p>*скопируйте этот код и вставте его в соответстующее окно в сформированной корзине</p>
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