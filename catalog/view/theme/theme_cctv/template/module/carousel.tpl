<hr class="line">
<div class="client">Наши клиенты</div>

<div class="row">
<div id="carousel<?php echo $module; ?>" class="owl-carousel">
  <?php
    $wrapper = true;
    foreach ($banners as $key => $banner) {
      if ($wrapper) {echo '<div class="item text-center ">';}
      echo ($banner['link'] ? "<a href=\"$banner[link]>\">" : '') . "<img src=\"$banner[image]\" alt=\"$banner[title]\" class=\"img-responsive center-block\" />" . ($banner['link'] ? "</a>" : '');
      $wrapper = !$wrapper;
      if ($wrapper) {echo '</div>';}
    }
  ?>
</div>
</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
  items: 5,
  autoPlay: 3000,
  navigation: true,
  navigationText: ['<i></i>', '<i></i>'],
  pagination: true
});
--></script>