<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "DELETE FROM studente WHERE studente.idstudente = ?" );
	$result->execute([$_POST['id']]);
	
	Header('Location: ../view/studenti.php');
	
?>

<html>
</head>
</head>
<body>
Removing...
</body>
</html>