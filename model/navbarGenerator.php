<?php

	include "../bin/connectDatabase.php";
	
	//
	// Get Administrator Level
	//
	$result = $conn->prepare( "SELECT docente.ruolo_idruolo FROM docente WHERE docente.iddocente = ?;" );
	$result->execute([$_COOKIE["logged"]]);
	$row = $result->fetch();
	switch($row[0]){
		case "1":
		$array = ["Docenti","Studenti","Classi"];
		echo json_encode($array);
		break;
		case "2":
		$array = ["Sessione","History"];
		echo json_encode($array);
		break;
		default:
		$array = [""];
		echo json_encode($array);	
		break;
	}
?>