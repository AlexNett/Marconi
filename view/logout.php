<?php

	setcookie("logged", "", time()-3600, "/");
	
	Header('Location: home.php');
	
?>

<html>
</head>
</head>
<body>
Logout...
</body>
</html>