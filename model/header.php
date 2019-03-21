<?php

	include "../bin/connectDatabase.php";
	
	//
	// Get Administrator Level
	//
	
	if(isset($_COOKIE["logged"])) {
	
		$result = $conn->prepare( "SELECT docente.ruolo_idruolo FROM docente WHERE docente.iddocente = ?" );
		$result->execute([$_COOKIE["logged"]]);
		$row = $result->fetch();
		switch($row[0]){
			case "1":
			$array = ["docenti","studenti","classi"];
			break;
			case "2":
			$array = ["sessione","history"];
			break;
			default:
			$array = [""];
			break;
		}
		
		foreach ($array as $value) {
			echo "<td><a href=".$value.".php>".$value."</a></td>";
		}
	
	}
?>