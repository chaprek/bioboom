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
                        
                        <?php if ($returns) { ?>
                        
                            <div class="visible1024 table-enormous-wrap">
                                <table class="table-emormous-head">
                                    <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th class="date">����</th>
                                            <th class="numb">�����</th>
                                            <th>��������</th>
                                            <th>���-��</th>
                                            <th>������</th>
                                            <th>���������</th>
                                            <th>������</th>
                                            <th>������</th>
                                            <th>��������</th>
                                        </tr>
                                    </thead>
                                </table>
                                <?php foreach ($returns as $return) { ?>
                                <div class="table-item">
                                    <table class="table-shortinfo">
                                        <tr>
                                            <td><a href="#" class="t-collapse"></a></td>
                                            <td class="date"><?php echo $return['date_added']; ?></td>
                                            <td class="numb"> #<?php echo $return['order_id']; ?></td>
                                            <td>&nbsp;</td>
                                            <td><?php echo $return['product']; ?></td>
                                            <td>&nbsp;</td>
                                            <td><?php echo $return['total']; ?></td>
                                            <td>�/�</td>
                                            <td><?php echo $return['status']; ?></td>
                                            <td>����� �����</td>
                                        </tr>
                                        <tr>
                                            <td colspan="10">
                                                <table class="table-collapsed">
                                                <? $f=0?>
                                                <?php foreach ($return['products'] as $product) { ?>
                                                    <tr>
                                                        <td class="numb">922 640138</td>
                                                        <td class="name"><?php echo $product['name']; ?></td>
                                                        <td><?php echo $product['quantity']; ?></td>
                                                        <td>36/38</td>
                                                        <td><?php echo $product['total']; ?></td>
                                                        <? if($f==0){?>
                                                        <td rowspan="2" class="dark paytype">����������� ������ ����� ������ ����</td>
                                                        <? }?>
                                                        <td><a href="#" class="dark status">����������</a></td>
                                                        <td class="dark">����� �����</td>
                                                    </tr>
                                                    <? $f++;?>
                                                    <?php } ?>
                                                    <tr>
                                                        <td class="dark numb foot">������</td>
                                                        <td colspan="3">&nbsp;</td>
                                                        <td class="dark">-70 ���</td>
                                                        <td colspan="3">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="dark numb foot">��������� ��������</td>
                                                        <td colspan="3">&nbsp;</td>
                                                        <td class="dark">0 ���</td>
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
                            <?php foreach ($returns as $return) { ?>
                                <div class="table-item">
                                    <table class="table-shortinfo">
                                        <tr>
                                            <td><a href="#" class="t-collapse"></a></td>
                                            <td class="date-t">����</td>
                                            <td class="date"><?php echo $return['date_added']; ?></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" class="collapse-wrap">
                                                <div class="table-collapsed">
                                                    <div class="total"><?php echo $return['total']; ?></div>
                                                    <a href="<?php echo $return['href']; ?>">
                                <img src="catalog/view/theme/default/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" />
                                </a>
                                                    <?php foreach ($return['products'] as $product) { ?>
                                                    <div class="item">
                                                        <div class="row clearfix">
                                                            <div class="title">�����</div>
                                                            <div class="r-content">922 640138</div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">��������</div>
                                                            <div class="r-content"><?php echo $product['name']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">����������</div>
                                                            <div class="r-content"><?php echo $product['quantity']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">������</div>
                                                            <div class="r-content">
                            
                            </div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">���������</div>
                                                            <div class="r-content"><?php echo $product['total']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">������</div>
                                                            <div class="r-content">����������� ������ ����� �����������</div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">������</div>
                                                            <div class="r-content"><?php echo $order['status']; ?></div>
                                                        </div>
                                                        <div class="row clearfix">
                                                            <div class="title">��������</div>
                                                            <div class="r-content">����� �����</div>
                                                        </div>
                                                    </div>
                                                   <?php } ?>
                                                   
                                                   
                                                    <div class="bonuses">
                                                         <div class="titles">
                                                             <div class="row">������</div>
                                                             <div class="row">��������� ��������</div>
                                                         </div>
                                                        <div class="costs">
                                                            <div class="row">- 170 ���</div>
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