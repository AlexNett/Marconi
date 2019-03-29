<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "SELECT * FROM annoscolastico ORDER BY annoInizio DESC LIMIT 1" );
	$result->execute();
	
	$res = $result->fetch();
	if($res != null){
		$inizio = date('Y-m-d',strtotime(date("Y-m-d", $res["annoInizio"]) . " + 365 day"));
		$fine = date('Y-m-d',strtotime(date("Y-m-d", $res["annoFine"]) . " + 365 day"));
		
		$result = $conn->prepare( "INSERT INTO annoscolastico (idannoscolastico, annoInizio, annoFine) VALUES (NULL, ?, ?);" );
		$result->execute([$inizio,$fine]);
	} else {
		$result = $conn->prepare( "INSERT INTO annoscolastico (idannoscolastico, annoInizio, annoFine) VALUES (NULL, ?, ?);" );
		$result->execute(["YEAR(CURDATE())","YEAR(CURDATE())+1"]);
	}
	
	Header('Location: ../view/torni.php');
	
?>

<html>
</head>
</head>
<body>
Adding...
</body>
</html>