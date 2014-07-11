<div class="feedback-form">
    <div class="row">
        <label>Имя</label>
        <input  type="text" name="name" value="" />
        <input type="hidden" name="parent_id" value="<?= $parent_id?>" />
        <input type="hidden" name="rating" value="<?= $rating?>" />
    </div>
  <!--  <div class="row">
        <label>e-mail</label>
        <input type="text"/>
    </div>-->
    <div class="row">
        <label>Ваш отзыв</label>
        <textarea  name="text"></textarea>
    </div>
    <div class="row">
        <label class="setrew">Оцените товар</label>
        <div class="raiting"><div></div></div>
    </div>
    <div class="row">
        <div class="btn-submit-gray" data-id="<?= $review_id?>">Отправить</div>
    </div>
</div>
