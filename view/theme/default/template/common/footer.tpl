
<footer id="footer">
        <div class="wrapper">
            <div class="container">
                <div class="footer-inner clearfix">
                    <div class="footer-row">
                        <h3><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></h3>
                    </div>
                    <div class="footer-row">
                        <h3>О нас</h3>
                        <ul>
                          <? $i=0; 
                          foreach ($informations as $information) { 
                            if($i < 5){
                                ?>
                              <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                              <?php
                              } 
                              if($i == 3){
                                ?>
                                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                                <?
                              }
                              $i++;
                              } 
                              ?>
                        </ul>
                    </div>
                    <div class="footer-row">
                        <h3>ЭТИКА</h3>
                        <ul>
                            <? foreach ($etic as $et) {  ?>
                                      <li><a href="<?php echo $et['href']; ?>"><?php echo $et['title']; ?></a></li>
                                <?php } ?>
                        </ul>
                    </div>
                    <div class="footer-row">
                        <h3><?php echo $text_information; ?></h3>
                            <ul>
                            <li><a href="<?php echo $feedback; ?>"><?php echo $text_feedback; ?></a></li>
                            <? $j=0;
                            foreach ($informations as $information) { 
                                if($j >4){
                                ?>
                              <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                              <?php
                              } 
                              $j++;
                              } 
                              ?>
                            </ul>                           
                        
                    </div>
                    <div class="footer-row">
                        <h3><a href="#">РАССЫЛКА</a></h3>
                        <h3><a href="#">СТАТЬИ</a></h3>
                        <h3><a href="#">РЕЦЕПТЫ</a></h3>
                        <h3><a href="#">БОНУСЫ И АКЦИИ</a></h3>
                        <h3><a href="#">ЧАСТЫЕ ВОПРОСЫ</a></h3>
                    </div>
                    <div class="footer-row">
                        <h3>ИНТЕРНЕТ-МАГАЗИН “БИОБУМ”</h3>
                        <p>График работы:</p>
                        <p>Пн-Пт: с 10:00 до 20:00</p>
                        <p>тел. (044) 353-23-39</p>
                    </div>
                    <div class="footer-row">
                        <h3>МЫ В СОЦСЕТЯХ</h3>
                        <div class="social">
                            <a href="#"><img src="images/social/fb.png" alt=""></a>
                            <a href="#"><img src="images/social/vk.png" alt=""></a>
                            <a href="#"><img src="images/social/twitter.png" alt=""></a>
                            <a href="#"><img src="images/social/youtube.png" alt=""></a>
                        </div>
                    </div>
                    <div class="footer-row">
                        <h3>КАРТА САЙТА</h3>
                    </div>
                    <div class="footer-row newsletter">
                        <h3>ПОДПИСАТЬСЯ НА РАССЫЛКУ</h3>
                        <p>Новинки, лучшие предложения и скидки</p>
                        <form class="newsletter-form">
                            <div><input type="text" placeholder="e-mail"></div>
                            <input type="submit" class="btn-submit-dark" value="Подписаться">
                        </form>
                        <p>Мы защищаем вашу конфиденциальность</p>
                    </div>
                    <div class="footer-row pay-systems">
                        <img src="images/paysystem/mastercard.png" alt="">
                        <img src="images/paysystem/visa.png" alt="">
                        <img src="images/paysystem/monexy.png" alt="">
                    </div>
                    <div class="footer-row copyright">©2013 Интернет-магазин БиоБум™</div>
                </div>
            </div>
        </div>
    </footer>
    <div class="ask-question hidden480">
        <a href="#" class="q-link"></a>
        <form class="question-form">
            <h2>Задать вопрос специалисту</h2>
            <div class="row"><input type="text" placeholder="Имя"></div>
            <div class="row"><input type="text" placeholder="e-mail"></div>
            <div class="row">
                <label>Задать вопрос</label>
                <textarea></textarea>
            </div>
            <div class="row"><input type="submit" class="btn-submit-gray"></div>
        </form>
    </div>
    <div id="scroll-top">наверх</div>
</body>
</html>