<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "DELETE FROM annoscolastico WHERE idannoscolastico = ?" );
	$result->execute([$_POST['id']]);
	
	Header('Location: ../view/docenti.php');
	
?>

<html>
</head>
</head>
<body>
Removing...
</body>
</html>