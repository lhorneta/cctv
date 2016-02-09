<?php 
$plan = $_POST['plan-img'];
$mail = $_POST['mail'];
//echo "$mail\r\n";
//echo "$plan\r\n";
if ((isset($plan) && $plan != "") && (isset($mail) && $mail != "")) {
	//Check sending fields
	$to = 'programmer3g2@gmail.com'; // Mail address, a comma, you can specify any number of addresses
	$subject = 'Форма отправки плана для видеонаблюдения'; // Header posts
	
	$message = '
	<html>
	<head>
		<title>'.$subject.'</title>
	</head>
	<body>
		<p>План: '.$_POST['plan-img'].'</p>
		<p>Mail: '.$_POST['mail'].'</p>
	</body>
	</html>'; //Text messages
	$timestamp = time();
	$headers = "Content-type: text/html; charset=utf-8 \r\n";
	$headers .= "From: Отправитель <" . $timestamp . "from@wxample.com>\r\n";

	mail($to, $subject, $message, $headers); // Send
	echo "ok";
}
?>