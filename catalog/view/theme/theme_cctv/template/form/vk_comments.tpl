<div id="vk_comments"></div>
<script type="text/javascript">
  $(document).ready(function(e) {
    var size_man = $('#vk_comments').width();
    VK.Widgets.Comments("vk_comments", {limit: 10,width: size_man,autoPublish: 1, attach: "*", pageUrl: window.location.pathname});
  });
</script>