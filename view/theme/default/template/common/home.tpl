<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="main">
            <div class="wrapper" role="main">
                <div class="container">

<?php echo $content_top; ?>
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<?php echo $content_bottom; ?>

  <div class="bottom-sections clearfix">
                        <section class="food-articles index-promo">
                            <h2>Готовим органично</h2>
                            <article class="s-article">
                                <a href="#" class="thumb"><img src="images/articles/img-1.jpg" alt=""></a>
                                <div class="description">
                                    <h3><a href="#">Каша из топора</a></h3>
                                    <div class="excerpt">Приготовьте томаты, базилик, петрушку, чеснок и сыр, как указано в инструкции. Приготовьте томаты,</div>
                                </div>
                            </article>
                        </section>
                        <section class="articles index-promo">
                            <h2>Статьи</h2>
                            <article class="s-article">
                                <a href="<?= $news_data['href']?>" class="thumb"><img src="<?= $news_data['thumb']?>" alt=""></a>
                                <div class="description">
                                    <h3><a href="<?= $news_data['href']?>"><?= $news_data['title']?></a></h3>
                                    <div class="excerpt"><?= $news_data['description']?></div>
                                </div>
                            </article>
                        </section>
                        <section class="feedbacks index-promo hidden480">
                            <div class="fake-title visible768">СЧАСТЛИВЫЕ ПОКУПАТЕЛИ</div>
                            <div class="fake-title visible1024">ОТЗЫВЫ</div>
                            <div class="feedbacks-slider" id="feedbacks-slider">
                                <div class="slides clearfix">
                                <? echo "AAAAAAAAAAA"?>
                                <? foreach($reviews as $review){?>
                                <? echo "SSSSSSSSSSSS"?>
                                    <div class="item">
                                        <div class="title"><i class="cite-icon"></i><span class="name"><?= $review['author']?></span></div>
                                        <div class="comment"><? 
                                        
                                        if(strlen($review['text']) > 200){
                                            
                                            echo substr($review['text'], 0, 200)."(...)";
                                        } else {
                                            echo $review['text'];
                                        }
                                        ?>
                                        </div>
                                    </div>
                                    
                                    
                                    <? }?>
                                    
                                    
                                </div>
                                <span class="control prev" title=""></span>
                                <span class="control next" title=""></span>
                            </div>
                        </section>
                        <section class="index-promo some-cite hidden480">
                            “I FINALLY FOUND YOU!!! ... Your product speaks for itself. My family has been coming to your shop for several generations. I remember when Poppy would usher us into the shop with all these wonderful smells in the early 70's. Nuts, coffee, and fruit from all over the world. The smell of fresh peanuts roasting every saturday morning. The hustle and bustle of Mulberry Market at 8am. Deliveries in large trucks in and out all morning long. Everyone wanted the first batch. Thank you for keeping Poppy's dream alive, the business thriving and the product the same. (EXCELLENT) Now that I've found you, I will spread the word. ”
                        </section>
                    </div>
                </div>
            </div>
            <div id="clear"></div>
        </div>
    </div>
<?php echo $footer; ?>