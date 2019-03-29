<?php

	//
	//init();
	//
	$servername = "localhost";
	$dbname = "quintab_project";
	//$username = "root";
	//$password = "";
	$username = "quintab";
	$password = "HA45@BMV";

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	
?>