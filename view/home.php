<html lang="en">
  <head>
	<link rel="stylesheet" type="text/css" href="../bin/css/main.css">
	
	<title>Home</title>
  </head>
  <body>

<header id="header">
<table id="headerTable"><tr>
<td><a href="home.php">Home</a></td>
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
<?php
if(!isset($_COOKIE["logged"])){
echo "<input name='email' placeholder='Email'><br>";
echo "<input name='password' placeholder='Password' type='password'><br>";
echo "<button type='submit' class='btnn'>Login</button>";
} else {
echo "<button type='submit' class='btnn' formaction='logout.php'>Logout</button>";

}
?>

</form>
<!-- MAIN HTML END -->
<footer id="footer">Made by ITISMeucci</footer>
</div>


	<script src="../controller/main.js"></script>
  </body>
</html>