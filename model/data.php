<?php

	//
	//init();
	//
	$host = "localhost";
	$db = "quintab_project";
	$user = "quintab";
	$password = "HA45@BMV";
			
	try { $conn = new PDO("mysql:host=$host;dbname=$db", $user, $password); }
	catch(PDOException $e) { echo $e->getMessage(); }
	

	//
	//example of usage
	//
	$result = $conn->prepare( "SELECT sessione.idsessione FROM sessione ORDER BY sessione.idsessione DESC LIMIT 1" );
	$result->execute();
	$row = $result->fetch();
	echo $row[0];
?>