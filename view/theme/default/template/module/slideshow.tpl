

  <div class="slider-container" id="main-slider">
                        <div class="slides">
                        <?php foreach ($banners as $banner) { ?>
                            <div class="item">
                                <span data-picture data-alt="">
                                    <span data-src="<?php echo $banner['image']; ?>"></span>
                                    <span data-src="<?php echo $banner['image']; ?>" data-media="(max-width: 480px)"></span>
                                        <!--[if (lt IE 9) & (!IEMobile)]>
                                        <span data-src="images/slider/img-1_full.jpg"></span>
                                        <![endif]-->
                                    <noscript>
                                        <img src="<?php echo $banner['image']; ?>" alt="">
                                    </noscript>
                                </span>
                            </div>
                           
                            <?php } ?>
                            
                        </div>
                        <span class="control prev" title="Предыдущий слайд"></span>
                        <span class="control next" title="Следущий слайд"></span>
                        <div class="pagination"></div>
                    </div>
                    
<div class="slogan"><i class="logo-flower"></i><span>Делаем жизнь более органичной</span></div>