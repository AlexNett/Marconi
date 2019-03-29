<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "SELECT m.idmacchina as idmacchina, g.idgruppo as idgruppo FROM gruppo g INNER JOIN macchina m ON g.macchina_idmacchina = m.idmacchina");
	$result->execute();
	
	$array = array();
	
	while($row = $result->fetch()){
		array_push($array, $row);
	}
	
	echo json_encode($array);
?>