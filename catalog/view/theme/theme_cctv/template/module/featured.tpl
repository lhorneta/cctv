<!-- <h3><?php /* $heading_title;*/ ?></h3> -->
<br>
<br>
<br>
<div class="row">

  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="holder-hover">
        <img src="image/zoom.png" width="30" height="30" alt="<?php echo 'alt '.$product['name']; ?>" title="<?php echo 'title '.$product['name']; ?>" class="img-zoom" />
        <img src="image/phone.png" data-toggle="modal" data-target="#myCCTV" width="30" height="30" alt="<?php echo 'alt '.$product['name']; ?>" title="<?php echo 'title '.$product['name']; ?>" class="img-callback" />

        <?php if ($images) { ?>
        <ul data-id="<?php echo $product['product_id'];?>" class="images_<?php echo $product['product_id'];?> imgs">
          <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>

      </div>
      
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <!-- <p><?php //echo $product['description']; ?></p> -->
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price cctv_price"><span class="wrap_cctv_price">от</span>
          <?php if (!$product['special']) { ?>
          <?php $price = str_replace("грн"," ", $product['price']);?>
          <?php echo $price; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        <span class="wrap_cctv_price"> грн</span></p>
        <?php } ?>
      </div>
      <div class="new_button-group">
      <a href="<?php echo $product['href']; ?>" class="btn request-a-call detail">Подробнее >></a>
        <!-- <button type="button" onclick="cart.add('<?php //echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php //echo $button_cart; ?></span></button> -->
        <!-- <button type="button" data-toggle="tooltip" title="<?php //echo $button_wishlist; ?>" onclick="wishlist.add('<?php //echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php //echo $button_compare; ?>" onclick="compare.add('<?php //echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> -->
      </div>
    </div>
  </div>
  <?php } ?>
</div>
