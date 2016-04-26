<?php
	$to = "francotirador.cl@gmail.com"

	$name = $_POST["name"];
	$email = $_POST["email"];
	$phone = $_POST["phone"];
	$subject = $_POST["subject"];
	$message = $_POST["message"];

	$body = "Nombre: " . $name  "\nEmail: " . $mail "\nTeléfono: " . $phone "\nAsunto: " . $subject "\nMensaje: " . $message;

	mail($to, "Contacto", $body);

	header("Location:index.html");

?>