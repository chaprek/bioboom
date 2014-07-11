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

                        <ul class="catalog-menu service-menu">
                            <li class="top-level">
                                <a class="top-level" href="#">МОЙ ПРОФИЛЬ</a>
                                <ul>
                                    <li><a href="#">Персональные данные</a></li>
                                    <li><a href="#">Заказы через интернет</a></li>
                                    <li><a href="#">Истории посылок</a></li>
                                    <li><a href="#">Возвраты и невручения</a></li>
                                    <li><a href="#">Купоны</a></li>
                                    <li><a href="#">Мои желания</a></li>
                                    <li><a href="#" class="underlink">Лист ожидания</a> <span class="count">(1)</span></li>
                                </ul>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#">О нас</a>
                                <ul>
                                    <li><a href="begining.html">Как все началось</a></li>
                                    <li><a href="believe.html">Во что мы верим?</a></li>
                                    <li><a href="#">Почему organic?</a></li>
                                    <li><a href="#">Знаки сертификации</a></li>
                                    <li><a href="contacts.html">Контакты</a></li>
                                    <li><a href="#">Вакансии</a></li>
                                </ul>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#">ЭТИКА</a>
                                <ul>
                                    <li><a href="#">Как мы относимся к природе?</a></li>
                                    <li><a href="#">Как  мы относимся к животным?</a></li>
                                    <li><a href="#">Цепочка доставки</a></li>
                                </ul>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#">ОБСЛУЖИВАНИЕ КЛИЕНТОВ</a>
                                <ul>
                                    <li><a href="#">Обратная связь</a></li>
                                    <li><a href="#">Оплата и доставка</a></li>
                                    <li><a href="#">Возврат и обмен</a></li>
                                    <li><a href="#">Защита персональных данных</a></li>
                                </ul>
                            </li>
                            <li class="top-level active">
                                <a class="top-level" href="#">РАССЫЛКА</a>
                            </li>
                            <li class="top-level">
                                <a class="top-level" href="#">СТАТЬИ</a>
                            </li>
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
                    </aside>
                    <div class="big-side">
                        <h1 class="personal-title"><?php echo $heading_title; ?></h1>
                        <div class="content">
                            <div class="post-content">
                                <img src="images/newsletter.png" alt="" style="margin: 0 20px 20px 0; float: left">
                                <h2></h2>
                                <?php echo $text_message; ?>
                               <!-- <p style="text-indent: 0;">На указанный Вами адрес выслано сообщение с активационной ссылкой. </p>
                                <p style="font-size: 12px; text-indent: 0;">Если вы не обнаружили письмо в течении 2 минут, проверьте папку спам.</p>-->
                                <p><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></p>
                            </div>
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