 <?php if ($review) { ?>
 <li>
     <div class="feedback">
         <div class="feed-header clearfix">
             <span class="qoutes"></span>
             <div class="date"><?php echo $review['date_added']; ?></div>
             <div class="name"><?php echo $review['author']; ?></div>
             <div class="raiting"><div style="width: <?= $review['rating']*20?>%"></div></div>
         </div>
         <div class="feed-content"><?= (isset($review['parent_author']))?'<span>'.$review['parent_author'].',</span>':"" ?><?php echo $review['text']; ?></div>
         <div class="feed-footer clearfix">
         
             <div class="useful">Отзыв полезен? 
             <a  data-useful="<?= $review['useful']?>" data-use="1" data-id="<?= $review['review_id'] ?>">
             Да (<span><?= $review['useful']?></span>)</a> / 
             <a data-use="0" data-id="<?= $review['review_id'] ?>" data-useful="<?= $review['nouseful']?>">
             Нет (<span><?= $review['nouseful']?></span>)</a>
             </div>
             
            <? if(!isset($review['parent_author']) && isset($review['childs'])){?>
                <div class="show_answers">смотреть ответы</div>
            <? }?>
             <a href="#" data-id="<?= $review['review_id'] ?>" class="reply">ответить</a>
         </div>
         <div>New tag</div>
     </div>
     <?php if(!empty($review['childs'])){ ?>
     <ul>
        <?= $this->tree($review['childs'])?>
     </ul>
     <? } ?>
 </li>
 <?php } ?>
