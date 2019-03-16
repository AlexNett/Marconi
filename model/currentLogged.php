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
	// Current Logged
	//
	$logged = $_COOKIE["logged"];
	$result = $conn->prepare( "SELECT * FROM docente WHERE iddocente = ?" );
	$result->execute([$logged]);
	$row = $result->fetch();
	echo json_encode($row);
?>