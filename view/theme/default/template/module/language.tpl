<?php if (count($languages) > 1) { ?>
<form  class="lang pull-right" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
<div class="lang pull-right">

    <?php foreach ($languages as $language) { ?>
        <a href="<?php echo $language['redirect']?>"><?php echo $language['name']; ?></a>
    <?php } ?>

</div>
</form>
<?php } ?>