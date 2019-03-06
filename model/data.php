<?php

	//
	//init();
	//
	$host = "localhost";
	$db = "project";
	$user = "quintab";
	$password = "HA45@BMV";
			
	try { $conn = new PDO("mysql:host=$host;dbname=$db", $user, $password); }
	catch(PDOException $e) { echo $e->getMessage(); }
	

	//
	//example of usage
	//
	$result = $conn->prepare( "SELECT sessione.idsessione FROM sessione" );
	$result->execute();
	$row = $result->lastInsertId();
	echo $row;
?>