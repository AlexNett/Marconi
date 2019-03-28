<?php
	//
	//init();
	//
	$host = "localhost";
	$db = "quintab_project";
	global $conn;
	$user = "root";
	$password = "root";
	//$user = "quintab";
	//$password = "HA45@BMV";
			
	try { $conn = new PDO("mysql:host=$host;dbname=$db", $user, $password);}
	catch(PDOException $e) { echo $e->getMessage(); }
?>