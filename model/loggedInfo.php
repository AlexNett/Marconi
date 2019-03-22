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
		
		echo '<b>Nome:</b>  '.$row["nome"]."<br>";
		echo '<b>Cognome:</b>  '.$row["cognome"]."<br>";
		echo '<b>Email:</b> '.$row["email"]."<br>";
	
	}
?>