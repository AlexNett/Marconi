<html lang="en">
  <head>
	<link rel="stylesheet" type="text/css" href="../bin/css/main.css">
	
	<title>Home</title>
  </head>
  <body>

<header id="header">
<a href="home.php">Home</a>
<table><tr>
<?php
include "../model/header.php";
?>
</table></tr>
</header>

<div id="page">
<div id="info">
<?php
include "../model/loggedInfo.php";
?>
</div>
<!-- MAIN HTML START -->
<form action="login.php" method="post">
<input name="email" placeholder="Email"><br>
<input name="password" placeholder="Password" type="password"><br>
<?php
if(!isset($_COOKIE["logged"])){
echo "<button type='submit' class='btnn'>Login</button>";
} else {
echo "<button type='submit' class='btnn' formaction='logout.php'>Logout</button>";
}
?>

</form>
<!-- MAIN HTML END -->
<footer id="footer">Made by ITISMeucci</footer>
</div>


	<script src="../control/main.js"></script>
  </body>
</html>