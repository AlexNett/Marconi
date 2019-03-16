<?php

	setcookie("logged", "", time()-3600, "/");
	
	Header('Location: Home.html');
	
?>

<html>
</head>
</head>
<body>
Logout...
</body>
</html>