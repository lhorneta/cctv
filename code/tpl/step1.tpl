<div class="popup_header">
	<h2>Выиграй подарок к Новому году!</h2>

</div>
<div class="box-gifts">
	<div class="gifts"> <a href="#" target="_blank"><img src="img/gift1.png" alt="0gift" id="001"></a>

	</div>
	<div class="gifts"> <a href="#" target="_blank"><img src="img/gift2.png" alt="1gift" id="002"></a>

	</div>
	<div class="gifts"> <a href="#" target="_blank"><img src="img/gift3.png" alt="2gift" id="003"></a>

	</div>
</div>
<div class="popup_footer">
	 <h3>Кликни на любую коробку и получи подарок от 3GStar</h3>
	<br>
	<img src="img/uzor.png" alt="uzor">
	<br>
</div>
<div class="box-phone-mail">
	<form action="">
		<input type="text" name="phone" class="popup-phone" placeholder="+38 (___) __-__-___" required>
		<br>
		<input type="text" name="mail" class="popup-mail" placeholder="Ваш email">
		<br>
	</form>
</div> <span class="button-gift">Получить подарок</span>

<script type="text/javascript">
	var imgs = $('.gifts img');
	var img = $('.box-gifts img');

	$(document).ready(function() {
		$('.gifts').hover(function() { // mouse enter element
			var thisElement = this;
			$('a img', this).addClass('wibro');
			window.giftsHoverTimeout = setTimeout(function() {
				$('a img', thisElement).removeClass('wibro');
			}, 500);
		}, function() { // mouse leave
			window.giftsHoverTimeout = null;
			$('a img', this).removeClass('wibro');
		});
	});

	$('.gifts').click(function (e) {
		var index = parseInt((e.target).alt);
		imgs[index].src = getLink();
		$('.gifts')[index].setAttribute("class", "gifts active_gift");
		// $('img.wibro').removeClass('wibro');
		$('.popup_header h2').text('Поздравляем! Вы выиграли подарок:');
		$(".popup_footer").prepend("<p>Ваш промокод для получения подарка:</p>");
		$('.popup_footer h3').wrap('<span></span>');
		var href = img[index].src.replace(/^.*[\\\/]/, '');
		$('.box-gifts a')[index].setAttribute('href', giftHref(href));
		$('.button-gift').show();

		var pole = $('.popup_footer span h3'); // поле для промо кода
		var cookiePromocode = $.cookie('saveCode');
		if (cookiePromocode) {
			pole.text(cookiePromocode);
		} else {
			var code = getPromo();
			$.cookie('saveCode', code, { // записываем код в куки
				expires: 30,
				path: '/',
			});
			$.cookie('href', href, { // записываем link в куки
				expires: 30,
				path: '/',
			});
			pole.text(code);
		}
		
		$('.gifts').unbind('click');
		var emptyLinks = document.querySelectorAll("a[href='#']");
		$.each(emptyLinks, function (index, value) {
			value.outerHTML = $(value).html();
		});
		return false;
	});
	
	

	$('.button-gift').click(function () {
		console.log('step2');
		// $('.popup_header h2').text('Ваш промокод:');
		// $('.box-gifts').hide();
		// $('.popup_footer p').hide();
		// $('.popup_footer').addClass('step3');
		// $('.popup_footer span h3').addClass('footer_step3');
		// $('.box-phone-mail').show();
		// $('.button-gift').unbind('click');
		// $('.button-gift').addClass('step2').removeClass('button-gift');



		// load template
		loadTemplate('tpl/step2.tpl', function(data) {
			$("#popup-gift-content").html(data);
			$(".step2").css('display', 'inline');
		});



	});
</script>