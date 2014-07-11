<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="main">
            <div class="wrapper" role="main">
			<?/*<h1>Интернет-магазин натуральных продуктов БиоБум™</h1>*/?>
			    <div class="container">

<?php echo $content_top; ?>
                             <!--   <div class="video recipe-products" id="video-popup"  style="display: none">
                                    <a href="#" class="close"></a>
                                    <div class="container clearfix" id="videoY">
                                        <?= $video?>
                                    </div>
                                </div>
                                <div style="display: none;">
                                <? print_r($recipes)?>
                                </div>

                                <a class="video-link" data-ob="lightbox" href="http://www.youtube.com/embed/EPo5wWmKEaI<?= ($mobile)?'?autoplay=1':''?>">d</a>
                                -->
                                
                                
                <div class="middle-section">
                        <section class="videos index-promo">
                            <h2 class="videos-title"><?= $title?></h2>
                            <article class="s-article">
                                <a data-ob="lightbox" href="<?= $video?><?= ($mobile)?'?autoplay=1':''?>"  class="thumb video-thumb fancy-thumb video-link"><img src="images/video.png" alt=""></a>
                               
                                <div class="description">
                                    <div class="excerpt"><?= $description?></div>
                                </div>
                            </article>
                        </section>
                        <section class="food-articles index-promo">
                            <h2>ГОТОВИМ ОРГАНИЧНО</h2>
                            <article class="s-article">
                                <a href="<?= $recipes['href']?>" class="thumb"><img src="<?= $recipes['image']?>" alt=""></a>
                                <div class="description">
                                    <h3><a href="<?= $recipes['href']?>"><?= $recipes['title']?></a></h3>
                                    <div class="excerpt"><?= $recipes['description']?></div>
                                </div>
                            </article>
                        </section>
                        <section class="sales index-promo">
                            <h2 class="sales-title">ВСЕ АКЦИИ</h2>
                            <a href="http://bioboom.ua/index.php?route=information/accii" class="thumb"><img src="images/action.png" alt="" /></a>
                        </section>
                    </div>
                <?php echo $content_bottom; ?>
                
                <section class="social_widgets">
                <div>
                <div class="fb-like-box" data-href="https://www.facebook.com/BioButikBioBoom" data-width="472" data-height="216" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="true"></div>
                </div>
                <div class="vk_widg">
                <script type="text/javascript" src="//vk.com/js/api/openapi.js?112"></script>

                <!-- VK Widget -->
                <div id="vk_groups"></div>
                <script type="text/javascript">
                VK.Widgets.Group("vk_groups", {mode: 0, width: "472", height: "200", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 49667008);
                </script>
                
                </div>
                  <div class="clear"></div>             
                </section>
                
                
                  <div class="bottom-sections clearfix">
                      <!--  <section class="food-articles index-promo">
                            <h2>Готовим органично</h2>
                            <article class="s-article">
                                <a href="#" class="thumb"><img src="images/articles/img-1.jpg" alt=""></a>
                                <div class="description">
                                    <h3><a href="#">Каша из топора</a></h3>
                                    <div class="excerpt">Приготовьте томаты, базилик, петрушку, чеснок и сыр, как указано в инструкции. Приготовьте томаты,</div>
                                </div>
                            </article>
                        </section>-->
                        <section class="articles index-promo">
                            <h2>Статьи</h2>
                            <article class="s-article">
                                <a href="<?= $news_data['href']?>" class="thumb"><img src="<?= $news_data['image']?>" alt=""></a>
                                <div class="description">
                                    <h3><a href="<?= $news_data['href']?>"><?= $news_data['title']?></a></h3>
                                    <div class="excerpt"><?= $news_data['description']?></div>
                                </div>
                            </article>
                        </section>
                        <section class="feedbacks index-promo hidden480">
                            <div class="fake-title">СЧАСТЛИВЫЕ ПОКУПАТЕЛИ</div>
                            <div class="feedbacks-slider" id="feedbacks-slider">
                                <div class="slides clearfix">
                                    <? $i=1; ?>
                                <? foreach($reviews as $review){?>

                                    <div class="item <?= ($i%2 != 0)?"odd":"" ?>">
                                        <div class="title"><i class="cite-icon"></i><span class="name"><?= $review['author']?></span></div>
                                        <div class="comment">
                                        <a style="text-decoration: none; color: #666;" href="<?= $review['href']?>">
                                        <?= $review['text'] ?>
                                        </a>
                                        </div>
                                    </div>
                                    <? $i++;?>
                                    <? }?>
                                    
                                </div>
                                <span class="control prev" title=""></span>
                                <span class="control next" title=""></span>
                            </div>
                        </section>
                        <section class="index-promo some-cite hidden480">
                            Био-бутик «БіоБум»- уникальный магазин органических продуктов питания, косметики, бытовых товаров, средств личной гигиены, а также натуральной и органической одежды для детей, взрослых и подростков. Био-бутик «БіоБум»- берет свое название от греческого слова «БИОС»- жизнь, ведь мудрое сотрудничество человека с природой дает жизнь качественной продукции под названием «органическая», «био», «эко» продукция. Товары, создателем которых есть сама природа, являются безопасными, полезными и эффективными.
                        </section>
                    </div>
                </div>
            </div>
            <div id="clear"></div>
        </div>
    </div>
<?php echo $footer; ?>