
<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i></i>', '<i></i>'],
	pagination: true
});
--></script>
<div class="row">
<div class="how-it-work">
  <div class="how-it-work-header">
      <h2>КАК РАБОТАЕТ БЕСПРОВОДНОЕ ВИДЕОНАБЛЮДЕНИЕ:</h2>
  </div>
  <div class="how-it-work-body">
      <div class="how-it-work-img">
        <img class="img-responsive" src="image/video_cctv.png" alt="video" title="Как работает беспроводное видеонаблюдение">
      </div>
      <div class="how-it-work-textblock">
        <p>1. Беспроводные камеры быстро и легко фиксируются на объекте</p>
        <p>2. Синхронизируются с любым мобильным устройством через бесплатное приложение</p>
        <p>3. Просматривать видео можно как в режиме реального времени, так и с записей, которые сохраняет система</p>
        <p>4. В случае необычных действий на объекте, на ваше мобильное устройство приходит моментальное оповещение</p>
        <div class="how-it-work-textblock-bottom">
          <img src="image/panda.jpg">
        </div>
        </div>
      </div>
  </div>
</div>
        <hr class="line">
        <div class="client">САМЫЕ ВОСТРЕБОВАННЫЕ КОМПЛЕКТЫ</div>