<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "SELECT * FROM studente INNER JOIN classe ON studente.classe_idclasse = classe.idclasse INNER JOIN annoscolastico ON classe.annoScolastico = annoscolastico.idannoscolastico" );
	$result->execute();
	
	$array = array();
	
	while($row = $result->fetch()){
		array_push($array, $row);
	}
	
	echo json_encode($array);
?>