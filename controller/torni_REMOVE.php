<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "DELETE FROM macchina WHERE macchina.idmacchina = ?" );
	$result->execute([$_POST['id']]);
	
	Header('Location: ../view/torni.php');
	
?>

<html>
</head>
</head>
<body>
Removing...
</body>
</html>