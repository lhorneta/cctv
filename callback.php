<?php
	$callback_footer = $_POST['phone'];
	$callback_plan = $_POST['plan'];

	echo "$callback_footer\r\n";

	if (isset($callback_footer) && $callback_footer != ''){
		$to = 'programmer3g2@gmail.com';
		$subject = !isset($callback_plan) ? 'CCTV Вам перезвонить (header or footer)' : 'Отправка плана помещения (plan)'; // Footer pop
	
	$message = '
	<html>
	<head>
		<title>'.$subject.'</title>
	</head>
	<body>
		<p>Мой номер телефона: '. $callback_footer . '</p>
	</body>
	</html>'; //Text messages
	$timestamp = time();
	$headers = "Content-type: text/html; charset=utf-8 \r\n";
	$headers .= "From: Отправитель <" . $timestamp . "from@wxample.com>\r\n";

	mail($to, $subject, $message, $headers); // Send
	echo "ok";
	}
 ?>