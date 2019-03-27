<?php

	include "../bin/connectDatabaseMySQLi.php";

	$sql = "UPDATE docente SET password = '".$_POST["pass"]."' WHERE iddocente=".$_POST['id']."";

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
Resetting Password...
</body>
</html>