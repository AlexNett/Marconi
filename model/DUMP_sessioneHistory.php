<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "SELECT * FROM sessione");
	$result->execute();
	
	$array = array();
	
	while($row = $result->fetch()){
		array_push($array, $row);
	}
	
	echo json_encode($array);
?>