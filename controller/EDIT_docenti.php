<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "UPDATE docente SET :camp=:edit WHERE docente.iddocente=:id" );	
	$result->bindParam(":camp", $_POST['camp']);
	$result->bindParam(":edit", $_POST['edit']);
	$result->bindParam(":id", $_POST['id']);
	$result->execute();
	
	$result = $conn->prepare( "SELECT * from docente where 1" );	
	$result->bindParam(":id", $_POST['id']);
	$result->execute();
	echo var_dump($result->fetch());
	
	
	
?>

<html>
</head>
</head>
<body>
Editing...
</body>
</html>