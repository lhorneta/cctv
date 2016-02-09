<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <div class="forms-for-purchases">
    <h1>Оформление заказа:</h1>
        <ul class="nav nav-tabs shop-tabs">
          <li class="active"><a href="#fast" data-toggle="tab">Быстрый заказ</a></li>
          <li><a href="#detail" data-toggle="tab">Развернутый заказ</a></li>
        </ul>

        <div class="tab-content shop-tabs-content" id="customer-information">
            <div class="tab-pane active" id="fast">
              <div class="box-fast">
                <p>Пожалуйста, введите номер, по которому мы сможем с вами связаться. 
                Оператор гарантированно перезвонит в течение 5 минут.</p>
                <form onsubmit="return checkForm(this)" action="/index.php?route=checkout/confirm/quick" method="POST" >
                  <input id="phone" type="text" name="single_phone" class="input-fastbox" placeholder="+38 ( - - - ) - -   - -   - - -" required>
                  <div class="button-fast-box">
                    <input type="submit" value="Оформить заказ" class="button-fast">
                    <a href="http://cctv-3gstar.1gb.ua/" class="continue-link">Продолжить покупки</a>
                  </div>
                </form>
              </div>
              <p>*Оформление заказа не обязывает вас к покупке.</p> 

              <p>Наши менеджеры свяжутся с вами для подтверждения и согласования заказа.<br> 
              В ходе телефонного разговора можно внести изменения в заказ или отменить его.</p>

              <p>Для того чтобы оформить заказ, введите ваш номер телефона и нажмите кнопку "Оформить заказ".<br> 
              Наш менеджер свяжется с вами и уточнит детали.</p>

              <p>Также вы можете оформить заказ самостоятельно, нажав на кнопку "Развернутый заказ".</p>
            </div>
            <!-- @end #fast -->
            <div class="tab-pane" id="detail">
              <div class="box-detail">
                <p>1. Оставьте свои контактные данные для подтверждения заказа</p>
                <p>2. Поля, помеченные звездочкой, обязательны к заполнению</p>
                <p>3. Ваши персональные данные защищены и не подлежат разглашению</p>
               <form onsubmit="return checkForm(this)" action="/index.php?route=checkout/confirm/quick" method="POST">
                    <div class="wrap-input"><label for="fio">Ваше ФИО:<span>*</span></label><br><input id="fio" name="fio" type="text" required></div>
                    <div class="wrap-input"><label for="phone2">Контактный телефон:<span>*</span></label><br><input id="phone2" name="phone" type="text" required></div>
                    <div class="wrap-input"><label for="email">Email (Если есть):</label><br><input id="email" name="email" type="text"></div>
                    <div class="wrap-input"><label for="city">Город доставки:</label><br><input id="city" name="city" type="text" ></div>
                    <div class="wrap-input"><label for="delivery">Метод доставки:</label><br><input id="delivery" name="delivery" type="text"></div>
                    <div class="wrap-input"><label for="payment">Способы оплаты:</label><br><input id="payment" name="payment" type="text"></div>
                    <div class="wrap-input"><label for="comment">Комментарий к заказу:</label><br><input id="comment" name="comment" type="text"></div>
                    <div class="button-fast-box">
                      <input type="submit" value="Оформить заказ" class="button-fast">
                      <a href="http://cctv-3gstar.1gb.ua/" class="continue-link">Продолжить покупки</a>
                    </div> 
                </form>
                    <script type="text/javascript">
                        // $('#customer-information form').submit(function( event ) {
                        //         console.log('addClass4');
                        //     event.preventDefault();

                        //     $.each($('input[required]', '#customer-information .tab-pane.active'), function(index, inputItem) {
                        //       if ($(inputItem).val() === '') {
                        //         $(inputItem).addClass('error_cctv');
                        //         console.log('addClass55');
                        //       } else {
                        //         $(inputItem).removeClass('error_cctv');
                        //         console.log('addClass5');
                        //         $('#customer-information form').unbind('submit');
                        //         $(this).submit();
                        //       }
                        //     });
                        // });
                        //});
                    </script>
                  <div class="text-detail">
                  <p>Оформление заказа не обязывает вас к покупке! Наш менеджер 
                  свяжется с вами для подтверждения и согласования заказа. 
                  В ходе телефонного разговора можно внести изменения в заказ 
                  или отменить его.</p></div>
              </div>
            </div>
            <!-- @end #detail -->
        </div>
    </div>
     

      <!--<h1><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        <?php /*echo $weight;*/ ?>
        <?php } ?>-->
      </h1>
      <br>
      <br>
      <br>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table table-bordered cart-table">
            <thead>
              <tr>
                <td class="text-center">Товары:</td>
                <td class="text-center">Кол-во:</td>
                <td class="text-center">Цена:</td>
                <td class="text-center"></td>
                <!-- <td class="text-left"><?php /*echo $column_name;*/ ?></td> -->
                <!-- <td class="text-left"><?php /*echo $column_model;*/ ?></td> -->
                <!-- <td class="text-left"><?php /*echo $column_quantity;*/ ?></td> -->
                <!-- <td class="text-right"><?php /*echo $column_price;*/ ?></td> -->
                <!-- <td class="text-center"><?php /*echo $column_total;*/ ?></td> -->
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center cart-checkout" ><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" height='70' width='70' alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail img-item" /></a>
                  <?php } ?>
				  
				  <div class="holder-checkout">
				  
					  <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

					  <?php if (!$product['stock']) { ?>
					  <span class="text-danger">***</span>
					  <?php } ?>
					  <?php if ($product['option']) { ?>
					  <?php foreach ($product['option'] as $option) { ?>
					  <br />
					  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
					  <?php } ?>
					  <?php } ?>
					  <?php if ($product['reward']) { ?>
					  <br />
					  <small><?php echo $product['reward']; ?></small>
					  <?php } ?>
					  <?php if ($product['recurring']) { ?>
					  <br />
					  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
					  <?php } ?>
				  </div>
                </td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 75px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="close_cctv"><img src="image/cancel_cctv.png"></button>
                    </span></div></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
               <!--  <td class="text-right"><?php /*echo $product['price'];*/ ?></td> -->
                <td class="text-right"><spam class="close_cctv" data-toggle="tooltip" title="<?php echo $button_remove; ?>"  onclick="cart.remove('<?php echo $product['key']; ?>');"><img src="image/close_cctv.png"></span></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
            <tfoot>
            <?php foreach ($totals as $total) { ?>
            <?php if ($total['title'] == 'Сумма к оплате'){ ?>
            <tr>
              <td class="text-right" colspan=4><strong><?php echo $total['title']; ?>: <?php echo $total['text']; ?></strong></td>

            </tr>
            <?php } ?>
            <?php } ?>
            </tfoot>
          </table>
        </div>
      </form>
      
      <br />
     <!--  <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered">
            <?php /*foreach ($totals as $total) {*/ ?>
            <tr>
              <td class="text-right"><strong><?php /*echo $total['title'];*/ ?>:</strong></td>
              <td class="text-right"><?php /*echo $total['text'];*/ ?></td>
            </tr>
            <?php /*}*/ ?>
          </table>
        </div>
      </div> -->
      <!--<div class="buttons">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary"><?php echo $button_checkout; ?></a></div>
      </div>-->
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>