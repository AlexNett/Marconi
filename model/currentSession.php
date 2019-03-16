<?php

	//
	//init();
	//
	$host = "localhost";
	$db = "quintab_project";
	$user = "root";
	$password = "";
			
	try { $conn = new PDO("mysql:host=$host;dbname=$db", $user, $password); }
	catch(PDOException $e) { echo $e->getMessage(); }
	

	//
	// Current Section
	//
	$result = $conn->prepare( "SELECT sessione.idsessione FROM sessione ORDER BY sessione.idsessione DESC LIMIT 1" );
	$result->execute();
	$row = $result->fetch();
	echo $row[0];
?>