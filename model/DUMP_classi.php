<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "SELECT * FROM classe INNER JOIN annoscolastico ON classe.annoScolastico = annoscolastico.idannoscolastico ORDER BY  sezione, classe ASC" );
	$result->execute();
	
	$array = array();
	
	while($row = $result->fetch()){
		array_push($array, $row);
	}
	
	echo json_encode($array);
?>