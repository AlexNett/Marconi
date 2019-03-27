<?php

	include "../bin/connectDatabaseMySQLi.php";

	$sql = "UPDATE classe SET ".$_POST['camp']."='".$_POST['edit']."' WHERE idclasse=".$_POST['id']."";

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