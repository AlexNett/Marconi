<?php

	include "../bin/connectDatabaseMySQLi.php";

	$sql = "UPDATE classe SET classe = '".$_POST['classe']."', sezione = '".$_POST['sezione']."', annoscolastico = '".$_POST['annoscolastico']."' WHERE idclasse=".$_POST['id']."";

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