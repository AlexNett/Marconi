<?php

	include "../bin/connectDatabaseMySQLi.php";

	$sql = "UPDATE docente SET nome = '".$_POST['nome']."', cognome = '".$_POST['cognome']."', email = '".$_POST['email']."', ruolo_idruolo = '".$_POST['ruolo']."' WHERE iddocente=".$_POST['id']."";

	if ($conn->query($sql) === TRUE) {
		echo "Record updated successfully";
	} else {
		echo "Error updating record: " . $conn->error;
	}

	$conn->close();
	
?>

<html>
</head>
</head>
<body>
Editing...
</body>
</html>