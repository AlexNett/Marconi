<?php

	include "../bin/connectDatabase.php";
	

	//
	// Current Logged
	//
	$logged = $_COOKIE["logged"];
	$result = $conn->prepare( "SELECT * FROM docente WHERE iddocente = ?" );
	$result->execute([$logged]);
	$row = $result->fetch();
	echo json_encode($row);
?>