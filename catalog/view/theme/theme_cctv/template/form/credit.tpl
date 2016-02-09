<?php $price = str_replace(' грн', '', $price); ?>
<div id="credit" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header popup-credit">


                  <div class="credit-title">Кредитный отдел 3GStar</div>

                  <div id="credit-main">
                        <div class="credit-cart">
                            <div class="credit-photo">
                                <div class="credit-cart-title">Фото</div>
                                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
                            </div>
                            <div class="credit-product">
                                <div class="credit-cart-title">Наименование</div>
                                <span><?php echo $heading_title; ?></span>
                            </div>
                            <div class="credit-summa">
                                <div class="credit-cart-title">Цена</div>
                                <span id="credit-summa"><?php echo $price; ?></span> грн.
                            </div> 
                        </div>
                        <div class="clear"></div>
                        
                        <div class="choise-credit">Выберите кредитный пакет</div>
                        
                        <div class="privat">
                            <img src="image/pvlogo.png" alt="кредит приватбанк">
                            <div class="type-privat">
                                <div class="title-privat">Выберите тип кредита:</div>
                                <select class="select-privat">
                                    <!--<option>Мгновенная рассрочка</option>-->
                                    <option>Оплата по частям</option>
                                </select>
                            </div>
                            <div class="type-privat">
                                <div class="title-privat">Укажите требуемый срок кредитования:</div>
                                <select id="myselect" class="select-privat">
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                </select>

                            </div>

                            <div class="privat-cost">
                                <div class="title-privat">Ежемесячный платеж составит:</div>
                                <div class="itog-privat"><?
                                $price2= ($price/2+ $price * 0.025);
                                $price2=number_format($price2, 2, '.', '');
                                echo $price2;?> </div>
                                <div class="button-privat" id="credit1">Оформить</div>
                            </div>
                        
                        </div>

                        <div class="kmarket">
                            <img src="image/kmlogo.png" alt="кредит от кредитмаркета">
                            <div class="km-block">
                                <div class="km-left">
                                    <div class="b-name">Кредит "6"</div>
                                    <div class="b-desc">на 6 месяцев 6 платежей по</div>
                                </div>
                                <div class="km-right">
                                    <div class="b-price">
                                        <?
                                        $price6= ($price/6+ $price * 0.025);
                                        $price6=number_format($price6, 2, '.', '');
                                        $price12= $price/12+ $price * 0.025;  
                                        $price12=number_format($price12, 2, '.', '');
                                        $price24= $price/24+ $price * 0.025;  
                                        $price24=number_format($price24, 2, '.', '');
                                        echo $price6; ?>
                                         грн.
                                    </div>
                                    <div class="b-calc-submit" id="credit2">КУПИТЬ В КРЕДИТ</div>
                                </div>
                            </div>
                            <div class="km-block">
                                <div class="km-left">
                                    <div class="b-name">Кредит "12"</div>
                                    <div class="b-desc">на 1 год 12 платежей по</div>
                                </div>
                                <div class="km-right">
                                    <div class="b-price"><?=$price12?> грн.</div>
                                    <div class="b-calc-submit" id="credit3">КУПИТЬ В КРЕДИТ</div>
                                </div>
                            </div>
                            <div class="km-block">
                                <div class="km-left">
                                    <div class="b-name">Кредит "24"</div>
                                    <div class="b-desc">на 2 года 24 платежа по</div>
                                </div>
                                <div class="km-right">
                                    <div class="b-price"><?=$price24?> грн.</div>
                                    <div class="b-calc-submit" id="credit4">КУПИТЬ В КРЕДИТ</div>
                                </div>
                            </div>
                        </div>
                  </div>

                  <div id="credit-forma">
                    <form id="creditform">
                        <div class="credit-forma-block">
                            <p>Для оформления кредита заполните пожалуйста анкету и нажмити кнопку "Отправить заявку на получения кредита". После этого с вами свяжется сотрудник кредитного отдела и сообщит о решении в отношении выдачи кредита.</p>
                            <input name="form" type="hidden" value="Заявка: Кредит">
                            <div class="fleft">
                                <div class="credit-field">
                                    <label for="name">ФИО<span class="requiredsp"> (указывать полностью)</span></label>
                                    <input type="text" value="" id="name" name="name" required title="Меня зовут">
                                </div>
                                <div class="credit-field">
                                    <label for="inn">Идентификационный код<span class="requiredsp"> (Формат 1234567890)</span></label>
                                    <input  type="text" maxlength="10" value="" id="inn" name="inn" required title="ИНН">
                                </div>
                                <div class="credit-field">
                                    <label for="bir">Дата рождения<span class="requiredsp"> (формат 01.01.1901)</span></label>
                                    <input  type="text" maxlength="10" value="" id="bir" name="bir" required title="Дата рождения">
                                </div>
                                <div class="credit-field">
                                    <label for="phone">Мобильный телефон<span class="requiredsp"> (формат ХХХ1234567)</span></label>
                                    <input  type="text" maxlength="13" value="" id="phone" name="phone" required title="Мобильный телефон">
                                </div>
                                <div class="credit-field">
                                    <label for="city">Город<span class="requiredsp"> (в котором вы прописаны)</span></label>
                                    <input type="text" value="" id="city" name="city" required title="Город">
                                </div>
                                <div class="button-privat" id="creditbutton" style="width: 432px;">Отправить заявку на получение кредита</div>
                            </div>
                            <img src="image/creditc.jpg" class="creditc" alt="кредитный консультант">
                        </div>
                    </form>
                  </div>
                
                
            </div>
          
            <div id="resultcredit">Спасибо! Ваша заявка принята, мы свяжемся с вами в ближайшее время!</div>
      
        </div>
    </div>

</div>