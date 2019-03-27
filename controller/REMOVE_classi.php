<?php

	include "../bin/connectDatabase.php";
	
	$result = $conn->prepare( "DELETE FROM classe WHERE classe.idclasse = ?" );
	$result->execute([$_POST['id']]);
	
	Header('Location: ../view/classi.php');
	
?>

<html>
</head>
</head>
<body>
Removing...
</body>
</html>