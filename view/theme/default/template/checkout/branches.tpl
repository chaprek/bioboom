    <div class="pointer"></div>
    <select name="number">
        <option>Выберите № склада</option>
        <? if($warens){?>
            <? foreach($warens as $war){?>
            <option value="<?= $war?>"><?= $war?></option>
            <? }?>
        <? }?>
    </select>