<?php

	include "../bin/connectDatabase.php";
	
	if(isset($_POST['submit'])){
		$image = $_FILES['data']['tmp_name'];
		$image = file_get_contents($image);
		$result = $conn->prepare( "INSERT INTO macchina (idmacchina, qr) VALUES (NULL, ?);" );
		$result->execute([$image]);
	}
	
	
	Header('Location: ../view/torni.php');
	
?>

<html>
</head>
</head>
<body>
Uploading...
</body>
</html>