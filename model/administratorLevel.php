<?php

	include "../bin/connectDatabase.php";
	
	//
	// Get Administrator Level
	//
	$result = $conn->prepare( "SELECT docente.ruolo_idruolo FROM docente WHERE docente.iddocente = ?;" );
	$result->execute([$_COOKIE["logged"]]);
	$row = $result->fetch();
	echo $row[0];
?>