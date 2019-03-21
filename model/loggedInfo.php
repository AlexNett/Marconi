<?php

	include "../bin/connectDatabase.php";

	//
	// Current Logged
	//
	
	if(isset($_COOKIE["logged"])) {
	
		$logged = $_COOKIE["logged"];
		$result = $conn->prepare( "SELECT * FROM docente WHERE iddocente = ?" );
		$result->execute([$logged]);
		$row = $result->fetch();
		
		echo $row["nome"]."<br>";
		echo $row["cognome"]."<br>";
		echo $row["email"]."<br>";
	
	}
?>