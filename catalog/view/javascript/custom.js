jQuery(function($){
	$('.form-control.footer-popap').mask("(999) 99-99-999",{placeholder:"(___) __-__-___ "});
	$('.input-fastbox').mask("(999) 99-99-999",{placeholder:"(___) __-__-___ "});
  $('.input_fastbox_plan').mask("(999) 99-99-999",{placeholder:"(___) __-__-___ "});
	$('.tel-input').mask("(999) 99-99-999",{placeholder:"(___) __-__-___ "});
});

$(document).ready(function(){

    $('#callback_footer').click(function(){
      var number = $('.input-fastbox').val();
      var form = $('.navbar-form input[name=form]').val();
      if(number != ''){
        $.ajax({
          url: 'callback.php',
          type: 'POST',
          data: {phone:number},
          success: function(){
            $.ajax({
			  url: 'google.php',
			  type: 'POST',
			  data: {phone:number,form:form},
			  success: function(){
				console.log('success');
			  }
			});
          }
        });
      }else{
        // false
      }
  	});

    $('#callback_plan').click(function(){
      var number = $('.input_fastbox_plan').val();
      if(number != ''){
        $.ajax({
          url: 'callback.php',
          type: 'POST',
          data: {phone:number, plan:'plan'},
          success: function(){
            $.ajax({
			  url: 'google.php',
			  type: 'POST',
			  data: {phone:number,form:'Заявка: Создать индивидуальный комплект'},
			  success: function(){
				console.log('success');
			  }
			});
          }
        });
      }else{
        // false
      }               
    });

    $('.img-zoom').click(function(e){
        var 
          that = $(this),
          product_id = that.parents('.holder-hover').find('.imgs').attr('data-id'),
          obj = '.images_' + product_id;

        $(obj).magnificPopup({
          type:'image',
          delegate: 'a',
          gallery: {
            enabled:true
          }
        });

         that.parents('.holder-hover').find('ul.imgs li:first-child a').click();
        
    });

    $('.woman-consultant').submit(function(e){

        e.preventDefault();

        var 
          number = $('.tel-input').val(),
          form = $('.hidden_form').val();

        if(number != ''){
          $.ajax({
            url: 'google.php',
            type: 'POST',
            data: {phone:number,form:form},
            success: function(){
              $('.form-success').html('<p>Спасибо! Наши менеджеры свяжутся с вами в течение <br/>5 минут и ответят на все вопросы</p>');
            }
          });
        }
    });

    /*nav-tabs li плавный скроллинг*/
      $(document).on("click", ".product-tabs li a", function(e){

        e.preventDefault();   
        var 
          id  = $(this).attr('href'),
          top = $(id).offset().top-75;
          
        $('body,html').animate({scrollTop: top}, 1500);
        $('div'+id).focus();
      });
    /*end плавный скроллинг*/

    /*rating a плавный скроллинг*/
      $(document).on("click", ".rating a", function(e){

        e.preventDefault();   
        var 
          id  = $(this).attr('href'),
          top = $(id).offset().top-75;
          
        $('body,html').animate({scrollTop: top}, 1500);
        $('div'+id).focus();
      });
    /*end плавный скроллинг*/
    
    $('.product_carousel').owlCarousel({
      items: 3,
      autoPlay: false,
      responsive: true,
      navigation: true,
      navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
      pagination: false
    });

    /*credit popup*/
      /*начало Купить в кредит */
      $('#credit1, #credit2, #credit3, #credit4').click(function() {
        $('#credit-forma').show();
        $('#credit-main').hide();
      });

      /* Сбор кредит */
      $('#creditbutton').click(function(e){

        //берем из формы метод передачи данных

        var 
			form=$('.credit-forma-block input[name=form]').val(),
			name=$('#name').val(),
			phone=$('#phone').val(),
			inn=$('#inn').val(),
			bir=$('#bir').val(),
			city=$('#city').val();

        $('#creditform').html($('#loader').html());

          $.ajax({
            type: "post",
            url: "google.php",
            data: {
				form:form,
				name:name,
				phone:phone,
				additional:'Индентификационный номер: '+inn+'\n'+'Дата рождения: '+bir+'\n'+'Город: '+city},
            success: function(data){
              $('#creditform').html($('#resultcredit').html());
            },
            error:function(data){
              console.log("error",data);
            }
          });  
        });
      /* end кредит */

      /* кредит приватбанк*/
      var priceprivat= $("#credit-summa").text();

      $("#myselect").change(function(){
        var creditmount = $(this).val();
        var everymounth = ((+priceprivat)/(+creditmount))+((+priceprivat)*0.025);
        everymounth = everymounth.toFixed(2);
        $(".itog-privat").html(everymounth);
      });

      /* кредит приватбанк*/
    /*end credit popup*/

 /*frontent product.tpl recalculate price*/
    var startPrice = $('.main_price').attr('data-price'),
		currency = ' грн',
		sum = null;
		
	function gap(str, separator) {
		return str.replace(/\d(?=(?:\d{3})+\b)/g, "$&" + (separator||' ')) ;
	}
	
    function recalculate(){
	
		var sum = null;
		$('.options_selects select').each(function(){
	  
			var selected = $(this).val();
			
			if(selected !== null && selected > 0 && selected !== ''){
				var option = $(this).parents('.options_selects').find('option[value='+selected+']').attr('data-price-select');
			}
			
			if(option !== null && option > 0 && option !== '')
			{sum += (+option);}else{option = 0;}
			
			$('.main_price').text(sum);
		});
	  var separate = (+sum)+(+startPrice);
      $('.main_price').text([gap(separate.toString())]).append('<span>'+currency+'</span>');

    }
	
	function start(){
      
		var sum = null;
      $('.options_selects option:selected').each(function(){
	  
        var	option = $(this).attr('data-price-select');

        if(option !== null && option > 0 && option !== '')
        {sum += (+option);}else{option = 0;}
        
		$('.main_price').text(sum);
		  
      });
	  
	  var separate = (+sum)+(+startPrice);

      $('.main_price').text([gap(separate.toString())]).append('<span>'+currency+'</span>');

    }

    start();

    $('select.form-control').change(function(){
      recalculate();
    });   
	
    /*end frontent product.tpl recalculate price*/

});