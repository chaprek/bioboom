<?php if ($modules) { ?>

                        <ul class="catalog-menu service-menu">
                            
                            <?php echo $modules[0]; ?>
                            <li class="top-level">
                                <a class="top-level" href="#">О нас</a>
                                <ul>
                            <? $i=0; 
                              foreach ($informations as $information) { 
                                if($i < 5){
                                    ?>
                                  <li class="<?= (strpos($information['href'], $reques) === false)?"":"active"?>"><a href="<?php echo $information['href']; ?>" ><?php echo $information['title']; ?></a></li>
                                  
                                  <?php
                                  } 
                                  if($i == 3){
                                    ?>
                                        <li class="<?= (strpos($contact, $reques) === false)?"":"active"?>"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                                    <?
                                  }
                                  $i++;
                              } 
                              ?>
                                
                                </ul>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#">ЭТИКА</a>
                                <ul>
                                <? foreach ($etic as $et) {  ?>
                                      <li class="<?= (strpos($et['href'], $reques) === false)?"":"active"?>"><a href="<?php echo $et['href']; ?>"><?php echo $et['title']; ?></a></li>
                                <?php } ?>
                                </ul>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#"><?php echo $text_information; ?></a>
                                <ul>
                                <li class="<?= (strpos($feedback, $reques) === false)?"":"active"?>"><a href="<?php echo $feedback; ?>"><?php echo $text_feedback; ?></a></li>
                                    <? $j=0;
                            foreach ($informations as $information) { 
                                if($j >4){
                                ?>
                              <li class="<?= (strpos($information['href'], $reques) === false)?"":"active"?>"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                              <?php
                              } 
                              $j++;
                              } 
                              ?>
                                </ul>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="<?= $subscr?>">РАССЫЛКА</a>
                            </li>
                            <? if(isset($modules[1])){?>
                             <?php echo $modules[1]; ?>
                             <? }?>
                            <li class="top-level">
                                <a class="top-level" href="#">РЕЦЕПТЫ</a>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#">БОНУСЫ И АКЦИИ</a>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#">ЧАСТЫЕ ВПОРОСЫ</a>
                            </li>
                        </ul>


<?php } ?>
