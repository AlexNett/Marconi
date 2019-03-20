<?php
	//
	//init();
	//
	$host = "localhost";
	$db = "quintab_project";
	$user = "quintab";
	$password = "HA45@BMV";
	//$user = "quintab";
	//$password = "HA45@BMV";
			
	try { $conn = new PDO("mysql:host=$host;dbname=$db", $user, $password); }
	catch(PDOException $e) { echo $e->getMessage(); }
?>