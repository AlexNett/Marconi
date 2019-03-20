<?php

	include "../bin/connectDatabase.php";
	
	//
	// Loggin in
	//
	$result = $conn->prepare( "SELECT iddocente FROM docente WHERE email = ? AND password = ?" );
	$result->execute([$_POST["email"],$_POST["password"]]);
	$row = $result->fetch();
	
	//
	// Saving cookie
	//
	setcookie("logged", $row["iddocente"], time() + (86400 * 30), "/"); // 86400 = 1 day
	
	Header('Location: Home.html');
?>

<html>
</head>
</head>
<body>
Login...
</body>
</html>