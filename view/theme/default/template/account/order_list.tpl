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
                        <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                        <div class="content">
                        
                        <?php if ($orders) { ?>
                        
                            <div class="visible1024 table-enormous-wrap">
                                <table class="table-emormous-head">
                                    <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th class="date">Дата</th>
                                            <th class="numb">Номер</th>
                                            <th>Название</th>
                                            <th>Кол-во</th>
                                            <!--<th>Размер</th>-->
                                            <th>Стоимость</th>
                                            <th>Оплата</th>
                                            <th>Статус</th>
                                            <th>Доставка</th>
                                        </tr>
                                    </thead>
                                </table>
                                <?php foreach ($orders as $order) { ?>
                                <div class="table-item">
                                    <table class="table-shortinfo">
                                        <tr>
                                            <td><a href="#" class="t-collapse"></a></td>
                                            <td class="date"><?php echo $order['date_added']; ?></td>
                                            <td class="numb"> #<?php echo $order['order_id']; ?></td>
                                            <td>&nbsp;</td>
                                            <td><?php echo $order['product']; ?></td>
                                           <!-- <td>&nbsp;</td>-->
                                            <td><?php echo $order['total']; ?></td>
                                            <td><?php echo $order['payment']; ?></td>
                                            <td><?php echo $order['status']; ?></td>
                                            <td><?php echo $order['shipping']; ?></td>
                                        </tr>
                                        <tr>
                                            <td colspan="9">
                                                <table class="table-collapsed">
                                                <? $f=0?>
                                                <?php foreach ($order['products'] as $product) { ?>
                                                    <tr>
                                                        <td class="numb"></td>
                                                        <td class="name"><?php echo $product['name']; ?></td>
                                                        <td><?php echo $product['quantity']; ?></td>
                                                       <!-- <td>36/38</td>-->
                                                        <td><?php echo $product['total']; ?></td>
                                                        <? if($f==0){?>
                                                        <td rowspan="2" class="dark paytype"></td>
                                                        <? }?>
                                                        <td><a href="#" class="dark status"></a></td>
                                                        <td class="dark"></td>
                                                    </tr>
                                                    <? $f++;?>
                                                    <?php } ?>
                                                   <tr>
                                                        <td class="dark numb foot">Бонусы</td>
                                                        <td colspan="3">&nbsp;</td>
                                                        <td class="dark"><?php echo $order['discount']; ?></td>
                                                        <td colspan="3">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dark numb foot">Стоимость доставки</td>
                                                        <td colspan="3">&nbsp;</td>
                                                        <td class="dark"><?php echo $order['shipping_price']; ?></td>
                                                        <td colspan="3">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            <?php } ?>
                            </div> 


                            <div class="visible768 table-emormous-wrap">
                            <?php foreach ($orders as $order) { ?>
                                <div class="table-item">
                                    <table class="table-shortinfo">
                                        <tr>
                                            <td><a href="#" class="t-collapse"></a></td>
                                            <td class="date-t">Дата</td>
                                            <td class="date"><?php echo $order['date_added']; ?></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" class="collapse-wrap">
                                                <div class="table-collapsed">
                                                    <div class="total"><?php echo $order['total']; ?></div>
                                                    
                                                    <?php foreach ($order['products'] as $product) { ?>
                                                    <div class="item">
                                                        <div class="row clearfix">
                                                            <div class="title">Номер заказа</div>
                                                            <div class="r-content">#<?php echo $order['order_id']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">Название</div>
                                                            <div class="r-content"><?php echo $product['name']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">Количество</div>
                                                            <div class="r-content"><?php echo $product['quantity']; ?></div>
                                                        </div>
                                                        <!--<div class="row clearfix">
                                                            <div class="title">Размер</div>
                                                            <div class="r-content">36/38</div>
                                                        </div>-->
                                                        <div class="row clearfix">
                                                            <div class="title">Стоимость</div>
                                                            <div class="r-content"><?php echo $product['total']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">Оплата</div>
                                                            <div class="r-content"><?php echo $order['payment']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">Статус</div>
                                                            <div class="r-content"><?php echo $order['status']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">Доставка</div>
                                                            <div class="r-content"><?php echo $order['shipping']; ?></div>
                                                        </div>
                                                    </div>
                                                   <?php } ?>
                                                   
                                                   
                                                    <div class="bonuses">
                                                         <div class="titles">
                                                             <div class="row">Бонусы</div>
                                                             <div class="row">Стоимость доставки</div>
                                                         </div>
                                                        <div class="costs">
                                                            <div class="row">- 170 грн</div>
                                                            <div class="row">0</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            <?php } ?>
                            </div>

                            <?php } else { ?>
                              <div class="content"><?php echo $text_empty; ?></div>
                            <?php } ?>
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