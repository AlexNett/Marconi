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
	// Loggin in
	//
	$result = $conn->prepare( "SELECT iddocente FROM docente WHERE email = ? AND password = ?" );
	$result->execute([$_POST["email"],$_POST["password"]]);
	$row = $result->fetch();
	
	//
	// Saving cookie
	//
	setcookie("logged", $row["iddocente"], time() + (86400 * 30), "/"); // 86400 = 1 day
	
	Header('Location: Home.html');
?>