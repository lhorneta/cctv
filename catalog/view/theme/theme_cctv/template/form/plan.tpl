<!-- Plan form -->
<div class="container">
  <div class="plan-box">
    <div class="img-plan">
      <img src="image/plan.png" alt="План видео наблюдения">
    </div>
    <div class="content-plan">
    <h1>Создайте индивидуальный комплект, загрузив схему (план) здания:</h1>
     <div class="content-text">
      <p>Наш инженер составит базовый комплект видеонаблюдения, исходя из планировки объекта.</p>
      <p>Для этого загрузите план в данную форму и отправьте заявку.</p>
      <p>Услуга бесплатна для всех жителей Украины!</p>
    </div>
    <div class="content-input">
      <form enctype="multipart/form-data" id="form_plan" >
        <div class="type_file">
          <input type="file" size="28" class="inputFile" onchange='document.getElementById("fileName").value=this.value' required="required" />
          <div class="fonTypeFile"></div>
          <input type="text" class="inputFileVal"  placeholder="Ваше изображение" name="plan-img" accept="image/jpeg,image/png,image/jpg" readonly="readonly" id="fileName" /><br>
        </div>
        <input type="text" class="mail-input" name="mail" placeholder="Введите E-mail для получения КП" required="required"><br>
        <input value="Отправить заявку" class="plan-button" type="submit"><br>
      </form>
    </div>
    </div>
  </div>
</div>

<script type="text/javascript">

  $(document).ready(function(){
      var files;
      $('input[type=file]').change(function(){
             files = this.files;
      });

      $("#form_plan").submit(function(e) {
        e.preventDefault();
          var form_data = $(this).serialize();
          var data = new FormData();
          var img = document.querySelector('.inputFile');
          var format = $('#fileName').val();
            $.each( files, function( key, value ){
            if(!format.match(/(.png)|(.jpeg)|(.jpg)|(.gif)$/i) || (img.files[0].size / 1024).toFixed(0) > 15240){
               alert('Файл слишком большой или не является картинкой. Максимальный размер картинки - 1,5 мегабайта!');
               return false;
          }else{
          data.append( key, value );

         
          console.log(form_data);
          $.ajax({
            type: "POST",
            url: "send_plan.php",
            data: form_data,
            success: function() {
            console.log('Сообщение отправлено!');
            }
          });
			var 
				filename = $('#fileName').val();
				email = $('.mail-input').val();
				
          $.ajax({
            type: 'POST',
            url: './submit.php?uploadfiles',
            data: data,
            cache: false,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (respond, textStatus, jqXHR){
              if(typeof respond.error === 'undefined'){
                // Файлы успешно загружены, делаем что нибудь здесь
				
				$.ajax({
				  url: 'google.php',
				  type: 'POST',
				  data: {form:'Форма: План здания + email',additional:'Имя файла: '+filename+'\n'+'email: '+email},
				  success: function(){
					console.log('success');
				  }
				});
				
              // выведем пути к загруженным файлам в блок '.ajax-respond'
              $('.request-plan').click();
              $('div.content-input').html('<img src="image/news37.png" alt="send"><h3>Прикрепленный файл удачно отправлен!</h3>');
              var files_path = respond.files;
              var html = '';
              $.each( files_path, function( key, val ){ html += val +'<br>'; } )
              $('.ajax-respond').html( html );
              }else{
              console.log('ОШИБКИ ОТВЕТА сервера: ' + respond.error );
              }
            },
            error: function( jqXHR, textStatus, errorThrown ){
              console.log('ОШИБКИ AJAX запроса: ' + textStatus );
            }
              });
            }
           });
      });
  });
</script>

<!-- Plan form and -->