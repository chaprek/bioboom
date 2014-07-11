 <?php if ($options) { ?>
                                            <? $m=0; ?>
                                            <?php foreach ($options as $option) { ?>
                                            
                                            <?php if ($option['type'] == 'select') { ?>
                                            <li class="feature">
                                                <div class="title"><?php echo $option['name']; ?></div>
                                                <div class="content clearfix">
                                                    <div class="div-select" id="<?= ($option['option_id'] == 8)?"size":"color"?>">
                                                        <div class="current">
                                                        <span class="text">
                                                        
                                                        <?php 
                                                            foreach ($option['option_value'] as $option_value) { 
                                                                if($val_1 == $option_value['option_value_id'] && (($first_base && $m == 0) || (!$first_base && $m == 1))) {
                                                                    $image = $option_value['image'];
                                                                    $name = $option_value['name'];
                                                                 } elseif(($first_base && $m == 1) || (!$first_base && $m == 0)){
                                                                    $image = $option['option_value'][0]['image'];
                                                                    $name = $option['option_value'][0]['name'];
                                                                 }
                                                             }
                                                         ?>
                                                        
                                                        <? if(isset($option['option_value'][0]['image'])){?>
                                                            <img  width="20" src="<? echo $image?>"/>
                                                            <span>
                                                                <? echo $name?>
                                                            </span>
                                                        <? } else {?>
                                                            <? echo $name?>                                                        
                                                        <? }?>
                                                        </span>
                                                        <span class="pointer"></span></div>
                                                        <ul class="options" id="option-<?php echo $option['product_option_id']; ?>">
                                                        <? $y=0;?>
                                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                
                                                                <li data-pref="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price']; ?>" data-povid="<?php echo $option_value['option_value_id']; ?>"  class="<?= ($val_1 == $option_value['option_value_id'] || $val_2 == $option_value['option_value_id'])?'active':''?>">
                                                                <? if($option_value['image']){?>
                                                                <img  width="20" src="<?php echo $option_value['image']; ?>"/>
                                                                <? }?>
                                                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" 
                                                                  value="<?php echo $option_value['product_option_value_id']; ?>" 
                                                                  id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                                  
                                                                  
                                                                <span><?php echo $option_value['name'] ?></span></li>
                                                                    
                                                                  <? $y++;?>
                                                                                                                                  
                                                                <?php } ?>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            
                                            <?php } ?>
                                            <? $m++;?>
                                             <?php } ?>
                                              <?php } ?>