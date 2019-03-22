<?php
	//
	//init();
	//
	$host = "localhost";
	$db = "quintab_project";
	//$user = "root";
	//$password = "";
	$user = "quintab";
	$password = "HA45@BMV";
			
	try { $conn = new PDO("mysql:host=$host;dbname=$db", $user, $password); }
	catch(PDOException $e) { echo $e->getMessage(); }
?>