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


<!-- MAIN HTML START -->
<div id="tableDiv">
<table id="dump">
</table>
</div>
<!-- MAIN HTML END -->
<footer id="footer">Made by ITISMeucci</footer>
</div>


	<script src="../controller/main.js"></script>
	<script src="../controller/sessioneCronologia.js"></script>
  </body>
</html>