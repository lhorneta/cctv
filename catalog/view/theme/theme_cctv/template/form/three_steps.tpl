<div class="how-it-work-header">
      <h2>ПРОСТОЙ ИНСТРУМЕНТ ИНДИВИДУАЛЬНОГО ПОДБОРА НАБЛЮДЕНИЯ</h2>
</div>
<div class="row">
  <div class="step_3_block">
    <h2>- Всего 3 шага -</h2>
    <h3>Шаг 1: Тип помещения</h3>
<form id="select_tools" action="" method="">
<input type="hidden" name="form" value="Форма: 3 шага">
    <div class="cctv_step1">
      <p>Для того, что бы мы подобрали оптимальные комплектующие, отметьте в помещении какого типа вы устанавливаете видеонаблюдение:</p>
      <div class="csb1"><div class='csb_img1'></div>
      <label><p>Офис</p>
      <input class="step-check" name="office" type="checkbox" value="office"> </label>
      </div>
      <div class="csb2"><div class='csb_img2'></div>
      <label><p>Дом/Квартира</p>
      <input class="step-check" name="house" type="checkbox" value="house" id="house"></label>
      </div>
      <div class="csb3"><div class='csb_img3'></div>
      <label><p>Торговая точка</p>
      <input class="step-check" name="trade" type="checkbox" value="trade"></label>
      </div>
      <div class="csb4"><div class='csb_img4'></div>
      <label><p>Склад/База</p>
      <input class="step-check" name="baza" type="checkbox" value="baza"></label>
      </div>
      <div class="csb5"><div class='csb_img5'></div>
      <label><p>Другое</p>
      <input class="step-check" name="other" type="checkbox" value="other"></label>
      </div>
    </div>
    <h3>Шаг 2: Важный функционал</h3>
    <div class="cctv_step2">
      <p>Отметьте опции, которыми должен обладать ваш комплект видеонаблюдения:</p>
      <div class="csb1"><div class='csb_img6'></div>
      <label><p>Запись на носитель</p>
      <input class="step-check" name="disk" type="checkbox" value="disk"> </label>
      </div>
      <div class="csb2"><div class='csb_img7'></div>
      <label><p>Моментальные оповещения</p>
      <input class="step-check" name="alert" type="checkbox" value="alert"></label>
      </div>
      <div class="csb3"><div class='csb_img8'></div>
      <label><p>Датчик движения</p><br>
      <input class="step-check" name="sensor" type="checkbox" value="sensor"></label>
      </div>
      <div class="csb4"><div class='csb_img9'></div>
      <label><p>Автоматическое подключение</p>
      <input class="step-check" name="connection" type="checkbox" value="connection"></label>
      </div>
      <div class="csb5"><div class='csb_img10'></div>
      <label><p>Беспроводное соединение</p>
      <input class="step-check" name="compound" type="checkbox" value="compound"></label>
      </div>
    </div>
    <h3>Шаг 3: Цель установки</h3>
    <div class="cctv_step3">
      <p>Для того, что бы мы верно определили тип и класс камер, укажите цели, для которых вам необходимо видеонаблюдение:</p>
      <div class="csb1"><div class='csb_img11'></div>
      <label><br><p>Охрана объекта</p>
      <input class="step-check" name="security" type="checkbox" value="security"> </label>
      </div>
      <div class="csb2"><div class='csb_img12'></div>
      <label><p>Поимка расхитителей</p>
      <input class="step-check" name="capture" type="checkbox" value="capture"></label>
      </div>
      <div class="csb3"><div class='csb_img13'></div>
      <label><p>Контроль сотрудников</p>
      <input class="step-check" name="control" type="checkbox" value="control"></label>
      </div>
      <div class="csb4"><div class='csb_img14'></div>
      <label><br><p>Забота о близких</p>
      <input class="step-check" name="care" type="checkbox" value="care"></label>
      </div>
      <div class="csb5"><div class='csb_img5'></div>
      <label><br><p>Другое</p>
      <input class="step-check" name="oher2" type="checkbox" value="oher2"></label>
      </div>
    </div>
      <div class="cctv_step3_button">
        <button class="btn_step3_cctv">Оставить заявку на подбор видеонаблюдения</button>
      </div>
</form>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function($) {

        $('.btn_step3_cctv').click(function(event) {
          event.preventDefault();
          /* Act on the event */
          var 
			post = $('form input:checked'),
			length = $('form input:checked').length,
			str = '',
			form = $('#select_tools input[name=form]').val();	
			
			console.log("length",length);
			
			
			post.each(function(index, el){
				var 
					pr = $(el).val();
					console.log("index",index);
					if(length===index+1){
						str += pr+'\n';
					}else{
						str += pr+','+'\n';
					}
			});
			
			$.ajax({
			  url: 'google.php',
			  type: 'POST',
			  data: {form:form,additional:str},
			  success: function(){
				alert('Спасибо! Наши менеджеры свяжутся с вами в течение 5 минут и ответят на все вопросы');
				$('input:checked').removeAttr('checked');
			  }
			});
         });
  });
</script>