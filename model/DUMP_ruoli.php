<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "SELECT * FROM macchina" );
	$result->execute();
	
	$array = array();
	
	while($row = $result->fetch()){
		$row["qr"] = base64_encode($row["qr"]);
		$row[1] = base64_encode($row["qr"]);
		array_push($array, $row);
	}
	
	echo json_encode($array);
?>