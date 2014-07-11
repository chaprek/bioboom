
                    <div class="wrap_main_slider">
                        <div class="slider-container" id="main-slider">
                            <div class="slides">
                            <?php foreach ($banners as $banner) { ?>
                                <div class="item">
                                <a href="<?php echo $banner['link']; ?>">
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
                                    </a>
                                </div>
                               
                                <?php } ?>
                                
                            </div>
                            <span class="control prev" title="Предыдущий слайд"></span>
                            <span class="control next" title="Следущий слайд"></span>
                            <div class="pagination"></div>
                        </div>
                    </div>
                    <div class="main_right_block">
                        <div class="m_deliv">
                            <a href="http://bioboom.ua/oplata-i-dostavka">
                            <p>Быстрая доставка в любой город Украины</p>
                            </a>
                        </div>
                        <div class="m_garant">
                            <a href="http://bioboom.ua/pochemu-organik">
                            <p>100% гарантия качества и безопасности продукции</p>
                            </a>
                        </div>
                        <div class="m_shop">
                            <a href="#">
                            <p>Более 1000 наименований органических товаров</p>
                            </a>
                        </div>
                        <div class="m_actions">
                            <a href="#">
                            <p>Постоянные акции, скидки и бонусы</p>
                            </a>
                        </div>
                        <div class="m_badprod">
                            <a href="http://bioboom.ua/moneyback">
                            <p>Не понравился продукт? Вернем деньги!</p>
                            </a>
                        </div>
                    </div>
                    <div class="subscribe_band">
                        <div class="subs_text">Узнайте первыми обо всех акциях и лучших предложениях</div>
                        <form class="subs_band_form"  enctype="multipart/form-data" method="post" action="/newsletter" onkeypress="if(event.keyCode == 13) return false;">
                            <input type="text" placeholder="Ваш e-mail" name="newsletter"/><a class="footer-newsletter_button" data-subs="home" >Ок</a>
                        </form>
                    </div>
                    <div class="success info_box" style="color: green;"></div>
                    <div class="error info_box" style="color: red;"></div>
                    <div style="clear: both"></div>