<div class="form-holder">

    <div class="content-title"><?php echo $form_title_main;?></div>

    <div class="form-success">

        <div class="content-form-text">
          <?php echo $form_text;?>
        </div>
        <div class="content-title"><?php echo $form_title_bottom;?></div>
        <div class="form-input">
          <form class="woman-consultant">
            <input type="hidden" class="hidden_form" value="<?php echo $form_hidden;?>" />
            <input type="tel" class="tel-input" name="phone" placeholder="+38( - - - ) - -  - -  - - - " required="required"><br>
            <input value="<?php echo $form_submit_button;?>" class="send-button" type="submit"><br>
          </form>
        </div>
    </div>

    <div class="img-woman">
      <img src="image/woman-consult.png" alt="<?php echo $form_img_alt;?>">
    </div>

</div>