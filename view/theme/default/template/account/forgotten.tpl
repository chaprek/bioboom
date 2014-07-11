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
                    <div class="main-content clearfix big-side">

<div class="content auth-container" style="text-align: left;">

  <h1><?php echo $heading_title; ?></h1>
<form class="auth-form auth-row"  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

<p><?php echo $text_email; ?></p>
    
<div class="row">
<label><?php echo $entry_email; ?></label>
<input type="text" name="email" value="" style="width: 250px;" />
</div>

<div class="row">
<input type="submit" value="<?php echo $button_continue; ?>" class="btn-submit-mid button" />
</div>
<?php if ($error_warning) { ?>
<div class="warning" style="margin: 10px 0;"><?php echo $error_warning; ?></div>
<?php } ?>
<a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>

  </form>
</div>


</div>
</div>
</div>
</div>

<div id="clear"></div>
</div>
</div>
<?php echo $footer; ?>