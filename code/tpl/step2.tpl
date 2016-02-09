<div class="popup_header">
	<h2>Ваш промокод:</h2>

</div>
<div class="box-gifts" style="display: none;">
	<div class="gifts">
		<img src="img/gift1.png" alt="0gift" id="001" class="">
	</div>
	<div class="gifts active_gift"> <a href="https://3gstar.com.ua/evdo-modem-franklin-u210-nozhkoj-sharnire-p-86.html" target="_blank"><img src="img/modem.png" alt="1gift" id="002" class=""></a>

	</div>
	<div class="gifts">
		<img src="img/gift3.png" alt="2gift" id="003" class="">
	</div>
</div>
<div class="popup_footer step3">
	<p style="display: none;">Ваш промокод для получения подарка:</p> <span><h3 class="footer_step3"></h3></span>
	<br>
	<img src="img/uzor.png" alt="uzor">
	<br>
	<div class="info-gift">
		<p>Ваш подарок: <a id="present-link" href="" target="_blank"></a> 
		</p>
		<p>Для того, чтобы забрать подарок, назовите промокод нашему менеджеру.</p>
		<br>
		<p>Если у вас возникли вопросы, вы можете получить бесплатную консультацию.
			<br>Для этого оставьте свой контактный номер:</p>
	</div>
</div>
<div class="thanksgiving">
	<h3>Спасибо, ваша заявка обрабатывается</h3>
</div>
<div class="box-phone-mail" style="display: block;">
	<form action="">
		<input type="text" name="phone" class="popup-phone" placeholder="+38 (___) __-__-___" required="">
		<br>
		<input type="text" name="mail" class="popup-mail" placeholder="Ваш email">
		<br>
	</form>
</div> <span class="step2" style="display: none;">Получить подарок</span>

<button class="close" title="Закрыть" onclick="document.getElementById('overlay').style.display='none';"></button>

<script type="text/javascript">
$(document).ready(function(){
if(!$.cookie('popupGiftPhone')){
	$('.step2').show();
}else{
	$('input.popup-phone').attr('disabled', true);
	$('input.popup-mail').attr('disabled', true);
	$('.step2').hide();
}
	$('.popup-phone').keyup(function(e) {
				if (e.keyCode == 13) {
					$('.popup-mail').focus();
				}
			});
			$('.popup-mail').keyup(function(e) {
				if (e.keyCode == 13) {
					$('.step2').trigger('click');
				}
			});

	$('.step2').click(function () {
				var phone = $('.popup-phone').val();
				var mail = $('.popup-mail').val();
				
				if(phone != ''){
					$.cookie('popupGiftPhone', phone, { // записываем код в куки
						expires: 30,
						path: '/',
					});
					$.cookie('popupGiftEmail', mail, { // записываем код в куки
						expires: 30,
						path: '/',
					});

					$.ajax({
						type: "POST",
						url: "/newyearpopup.php",
						data: { phone:phone , mail:mail },
						beforeSend: function() {
							$('.step2').fadeOut(100);
						},
						success: function() {
							$('.box-phone-mail').fadeOut();  /* $('.step2').fadeOut(); */
							//setTimeout($('.thanksgiving').fadeIn(), 1500);
							setTimeout(function() { $('.thanksgiving').fadeIn() }, 1500)
						},
						error: function() {
							$('.step2').fadeIn(100);
						}
					});

				} else {
				   console.warn('нет телефона');
				   $('input.popup-phone').addClass('error-gift-input');
				}
			});
	

});
	var nameGift = $.cookie('href').replace(/\.(png)\b/, '');
	$("#present-link").text(nameGift);
	$("#present-link").attr('href', giftHref($.cookie('href')));
	$(".footer_step3").text($.cookie('saveCode'));
	$('.popup-phone').mask("+38 (999) 99-99-999");
	if ($.cookie('popupGiftPhone')) {
		$('.popup-phone').val($.cookie('popupGiftPhone'));
	}
	if ($.cookie('popupGiftEmail')) {
		$('.popup-mail').val($.cookie('popupGiftEmail'));
	}
</script>