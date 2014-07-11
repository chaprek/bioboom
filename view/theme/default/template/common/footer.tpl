
<footer id="footer">
        <div class="wrapper">
            <div class="container">
                <div class="footer-inner clearfix">
                    <div class="f-col">
                        <div class="f-col-title">ИНТЕРНЕТ-МАГАЗИН “БИОБУМ”</div>
                        <div class="footer-work-time-container">
                        
                            <div class="work-time-container">
                                <div class="call-us">позвонить нам</div>
                                <div class="phones">
                                    <div>
                                        <div>
                                            <a href="tel:0443532339" class="home">(044) 353-23-39</a>
                                            <a href="tel:0989413232" class="ks">(098) 941-32-32</a>
                                            <a href="tel:0953163232" class="mts">(095) 316-32-32</a>
                                            <a href="tel:0939013232" class="life">(093) 901-32-32</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="footer-work-time">пн-пт: 09:00-18:00</div>
                        </div>
                        <div class="footer-newsletter">
                            <div class="f-col-title">ПОДПИСАТЬСЯ НА РАССЫЛКУ</div>
                            <div class="footer-newsletter-in">
                                <form enctype="multipart/form-data" method="post" action="/newsletter" onkeypress="if(event.keyCode == 13) return false;">
                                    <input type="text" placeholder="e-mail" name="newsletter" class="footer-newsletter_field" />
                                    <a class="footer-newsletter_button" data-subs="foot">ok</a>
                                </form>
                            </div>
                                <div class="success" style="color: green;"></div>
                                <div class="error" style="color: red;"></div>
                        </div>
                    </div>
                    <div class="f-col">
                        <div class="f-col-title">Сервис</div>
                        <div class="service-cols">
                            <ul class="service-col">
                                <li class="service-col-item"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <li class="service-col-item"><a href="<?php echo $feedback; ?>"><?php echo $text_feedback; ?></a></li>
                                <li class="service-col-item"><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
                            </ul>
                            <ul class="service-col">
                                <li class="service-col-item"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                <li class="service-col-item"><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
                                <li class="service-col-item"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                            </ul>
                        </div>
                        <div class="f-col-title"><a href="<?php echo $sitemap; ?>">КАРТА САЙТА</a></div>
                    </div>
                    <div class="f-col">
                        <div class="f-col-title">МЫ В СОЦСЕТЯХ</div>
                        <div class="footer-social-wrap">
                            <a href="https://www.facebook.com/BioButikBioBoom"  target="_blank" class="footer-social-item fb"></a>
                            <a href="http://vk.com/bioboom"  target="_blank" class="footer-social-item vk"></a>
                            <a href="https://plus.google.com/u/0/b/101249172607821808812/101249172607821808812/posts?tab=XX"  target="_blank" class="footer-social-item gplus"></a>
                            <a href="http://www.youtube.com/user/bioboomshop" target="_blank" class="footer-social-item youtube"></a>
                            <a href="http://shoop-bioboom.livejournal.com/" target="_blank" class="footer-social-item livej"></a>
                            <a href="https://twitter.com/ShopBioboom" target="_blank" class="footer-social-item twitter"></a>
                            <!--<a href="#" target="_blank" class="footer-social-item instagram"></a>-->
                        </div>
                    </div>
                    <p class="copyright">©2013 Интернет-магазин БиоБум<sup><small>TM</small></sup></p>
					<!--<p class="copyright"><a class="mobox" href="http://www.mobox.kiev.ua/">Сделано в MOBOX</a></p>-->
                </div>
            </div>
        </div>
<div class="ya_m">	
	
		<!-- Yandex.Metrika informer -->
<a href="https://metrika.yandex.ua/stat/?id=24252901&amp;from=informer"
target="_blank" rel="nofollow"><img
src="//bs.yandex.ru/informer/24252901/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
style="width:88px; height:31px; border:0; position:absolute; left:-9999px;" alt="Яндекс.Метрика"
title="Яндекс.Метрика: дані за сьогодні  (перегляди, візити та унікальні
відвідувачі)"
onclick="try{Ya.Metrika.informer({i:this,id:24252901,lang:'ua'});return
false}catch(e){}"/></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter24252901 = new Ya.Metrika({id:24252901,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") +
"//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/24252901"
style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

</div>
    </footer>
    <script>
    $(document).ready(function(){
        $('.footer-newsletter_button, .home_newsletter_button').bind('click', function(event) {
            var that = $(this);
            var error = $(this).parent().parent().nextAll('.error');
            var success = $(this).parent().parent().nextAll('.success');
            var attr = $(this).attr('data-subs');
            
            event.preventDefault();
        	$.ajax({
        		url: 'index.php?route=account/newsletter',
        		type: 'post',
        		data: $(this).parent().find('input[name=\'newsletter\']'),
        		dataType: 'json',
        		success: function(json){
        			if (json['success']) {
        			 if(attr == 'home'){
        			     ga('send', 'event', 'SubscribeMain', 'Button', 'Main');
        			 } else {
        			     ga('send', 'event', 'Subscribe', 'Button', location.href);
        			     
        			 }
                     that.css('backgroundColor', '#999999');
                         error.text('');
        			     success.text(json['success']);
        			} else {
        			     success.text('');
        			     error.text(json['error']);
        			}	
        		}
        	});
        });
    });
    
    </script>
    
   <?/* <!--
    <div class="ask-question hidden480">
        <a href="#" class="q-link"></a>
        <form   action="<?php echo $action_back; ?>" method="post" enctype="multipart/form-data" class="question-form">
            <h2>Задать вопрос специалисту</h2>
            <div class="row"><input type="text" name="name"  placeholder="Имя"></div>
            <div class="row"><input type="text" name="email" placeholder="e-mail"></div>
            <div class="row">
                <label>Задать вопрос</label>
                <textarea name="enquiry" ></textarea>
            </div>
            <div class="row"><input type="submit" class="btn-submit-gray"></div>
        </form>
    </div>-->*/?>
    <div id="scroll-top">наверх</div>


<!--CHAT FOR CITE-->

<!-- BEGIN JIVOSITE CODE {literal} 
<script type='text/javascript'>
(function(){ var widget_id = '155997';
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);})();</script>
 {/literal} END JIVOSITE CODE -->


</body>
</html>