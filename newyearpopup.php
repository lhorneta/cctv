<?php 
	require('sms.php');
	require('SendToGoogleDocs.php');


	$googleDocsSender = new GoogleDocsSender();
	$googleDocsSender->setFormID('1sEDq43Hw2_9vK76fFe_gGTS2RVxenn-HH9xyzYKBA38');



// end
	//$alphasms = new SMSclient('login', 'pass');
	//$alphasms->sendSMS($sender, $sendto, $text);
 
 $mail = $_POST['mail'];
 $phone = $_POST['phone'];

 if (isset($phone) && $phone != '') {
 		//Check sending fields
		$to = 'programmer3g2@gmail.com'; // Mail address, a comma, you can specify any number of addresses
		$subject = 'Форма отправки плана для видеонаблюдения'; // Header posts
		
 		$googleDocsSender->addField('entry.782278901', $phone);
 		$googleDocsSender->addField('entry.1723019917', 'Попап подарок к новому году');
 		$googleDocsSender->addField('entry.1346706896', 'email '.$mail);
 		$googleDocsSender->addField('entry.5199687', $_SERVER['HTTP_REFERER']);
 		$googleDocsSender->send();

		//var_dump($googleDocsSender->success);
		//echo "<br>";
		//var_dump($googleDocsSender->resultText);
 }

// ОП/Заказы
	// $tableFields = array(
	// 	'shopName'					=> 'entry.2181931',
	// 	'orderNumber' 				=> 'entry.2181931.other_option_response',
	// 	'clientFullName' 			=> 'entry.1000003',
	// 	'deliveryAdress' 			=> 'entry.1000005',
	// 	'clientPhone' 				=> 'entry.1000002',
	// 	'orderContents' 			=> 'entry.1000001',
	// 	'paymentMethod' 			=> 'entry.1000014',
	// 	'paymentAmount' 			=> 'entry.1000014.other_option_response',
	// 	'deliveryCost' 				=> 'entry.1000017',
	// 	'manager' 					=> 'entry.1000007',
	// 	'customManager' 			=> 'entry.1000007.other_option_response',
	// 	'orderSource' 				=> 'entry.1000011',
	// 	'customOrderSource' 		=> 'entry.1000011.other_option_response',
	// 	'additionalProducts' 		=> 'entry.1000013',
	// 	'customAdditionalProducts' 	=> 'entry.1000013.other_option_response',
	// 	'declarationNumber' 		=> 'entry.1000016',
	// 	'whoPickedOrder' 			=> 'entry.1000012',
	// 	); 
	// $googleDocsSender->addField($tableFields['shopName'], '__other_option__');
	// $googleDocsSender->addField($tableFields['orderNumber'], '3gstar, 123456789');
	// $googleDocsSender->addField($tableFields['clientFullName'], 'Иванов Иван Иванович');
	// $googleDocsSender->addField($tableFields['deliveryAdress'], 'ПУШКИНСКАЯ');
	// $googleDocsSender->addField($tableFields['clientPhone'], '0990000000');
	// $googleDocsSender->addField($tableFields['orderContents'], 'стопиццот модемов');
	// $googleDocsSender->addField($tableFields['paymentMethod'], '__other_option__');
	// $googleDocsSender->addField($tableFields['paymentAmount'], 'Оплата на карту, 100500 uhy');
	// $googleDocsSender->addField($tableFields['deliveryCost'], 'много денег');
	// $googleDocsSender->addField($tableFields['manager'], '__other_option__');
	// $googleDocsSender->addField($tableFields['customManager'], 'Василий');
	// $googleDocsSender->addField($tableFields['orderSource'], '__other_option__');
	// $googleDocsSender->addField($tableFields['customOrderSource'], 'ВООБРАЖЕНИЕ');
	// $googleDocsSender->addField($tableFields['additionalProducts'], '__other_option__');
	// $googleDocsSender->addField($tableFields['customAdditionalProducts'], 'и гарантию, и удлиннитель, и всё');
	// $googleDocsSender->addField($tableFields['declarationNumber'], '');
	// $googleDocsSender->addField($tableFields['whoPickedOrder'], '');
?>