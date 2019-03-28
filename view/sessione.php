<?php
include "../model/allowTeacher.php";
?>

<html lang="en">
  <head>
	<link rel="stylesheet" type="text/css" href="../bin/css/main.css">
	
	<title>Sessione</title>
  </head>
  <body>

<header id="header">
<table id="headerTable"><tr>
<td><a href="home.php"><img class="logo" src="../bin/resources/Marconi logo.png" width="90" height="90"></a></td>
<td><a href="home.php">Home</a></td>
<?php
include "../model/header.php";
?>
</table></tr>
</header>

<div id="page" style="text-align: center">
<!-- MAIN HTML START -->
<input class="btnn" type="button" value="Avvia sessione" onclick="window.location.href='sessioneCorrente.php'">
<input class="btnn" type="button" value="Cronologia sessioni" onclick="window.location.href='sessioneCronologia.php'">
<!-- MAIN HTML END -->
<footer id="footer">Made by ITISMeucci</footer>
</div>
</div>


	<script src="../controller/main.js"></script>
  </body>
</html>