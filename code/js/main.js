$(document).ready(function () {
	
	if (!$.cookie('saveCode')) {
	var delay_popup = 1000;
	setTimeout("document.getElementById('overlay').style.display='block'", delay_popup);
		loadTemplate('tpl/step1.tpl', function(data) {
			$("#popup-gift-content").html(data);
		});
	} else {
		loadTemplate('tpl/step2.tpl', function(data) {
			$("#popup-gift-content").html(data);
		});
		$('#x').show();
		$('#x').click(function(){
		$('#overlay').show();
			
		});
	}

	

});



function getRandomInt(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getPromo() {
	var promo = [
		'34215',
		'77836',
		'45217',
		'45203',
		'48008',
		'20153',
		'63219',
		'77322'];

	return promo[getRandomInt(0, promo.length - 1)];
}

function getLink() {
	var promo = [
		'img/modem.png',
		'img/modem2.png',
		];

	return promo[getRandomInt(0, promo.length - 1)];
}

function giftHref(href) {
	var dataHref = {
		"modem.png": "https://3gstar.com.ua/evdo-modem-franklin-u210-nozhkoj-sharnire-p-86.html",
		"modem2.png": "https://3gstar.com.ua/evdo-modem-franklin-u210-nozhkoj-sharnire-p-86.html",
	};
	return dataHref[href];
}





// silenko 2015-11-26 / load template method
function loadTemplate(path, callback) {
	$.get(path, function(data) {
		callback.call(0, data);
	});
}