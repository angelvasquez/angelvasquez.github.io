<?php
	$to = "paola.paredes@broteverde.cl";

	$name = $_POST["name"];
	$email = $_POST["email"];
	$phone = $_POST["phone"];
	$subject = $_POST["subject"];
	$message = $_POST["message"];

	$body = "Nombre: " . $name  . "\nEmail: " . $email . "\nTelefono: " . $phone . "\nAsunto: " . $subject . "\nMensaje: " . $message;

	$headers = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset= iso-8859-1\r\n";
	$headers .= "From: $email\r\n";
	$headers .= "To: $to; Subject: $subject\r\n";

	mail($to, $subject, $body);
	header("Location:gracias.html");

?>