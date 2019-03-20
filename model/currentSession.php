<?php

	include "../bin/connectDatabase.php";
	
	//
	// Current Session
	//
	$result = $conn->prepare( "SELECT sessione.idsessione FROM sessione ORDER BY sessione.idsessione DESC LIMIT 1" );
	$result->execute();
	$row = $result->fetch();
	echo $row[0];
?>