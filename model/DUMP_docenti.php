<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "SELECT * FROM docente INNER JOIN ruolo ON docente.ruolo_idruolo = ruolo.idruolo" );
	$result->execute();
	
	$array = array();
	
	while($row = $result->fetch()){
		array_push($array, $row);
	}
	
	echo json_encode($array);
?>