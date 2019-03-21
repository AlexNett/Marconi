<?php

	include "../bin/connectDatabase.php";
	
	//
	// Get Administrator Level
	//
	
	if(isset($_COOKIE["logged"])) {
	
		$result = $conn->prepare( "SELECT docente.ruolo_idruolo FROM docente WHERE docente.iddocente = ?" );
		$result->execute([$_COOKIE["logged"]]);
		$row = $result->fetch();
		if($row[0] != 2){
			Header('Location: home.php');
		}
	
	} else {
		Header('Location: home.php');
	}
?>