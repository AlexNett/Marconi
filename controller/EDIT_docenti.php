<?php

	include "../bin/connectDatabaseMySQLi.php";

	$sql = "UPDATE docente SET ".$_POST['camp']."='".$_POST['edit']."' WHERE iddocente=".$_POST['id']."";

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