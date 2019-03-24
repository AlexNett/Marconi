<?php
include "../model/allowAdmin.php";
?>

<html lang="en">
  <head>
	<link rel="stylesheet" type="text/css" href="../bin/css/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<title>Docenti</title>
  </head>
  <body>
 
<header id="header">
<table id="headerTable"><tr>
<td><img class="logo" src="../bin/resources/Marconi logo.png" width="90" height="90"></td>
<td><a href="home.php">Home</a></td>
<?php
include "../model/header.php";
?>
</table></tr>
</header>

<div id="page">
<!-- MAIN HTML START -->
<form id='add' method='post' action=''>
<table>

<tr><td><input type='text' name='name' placeholder = 'Nome'></td><td rowspan="4"><button class="btnn" type="submit">Aggiungi Docente <i class="fas fa-user-plus"></i></button></td></tr>
<tr><td><input type='text' name='surname' placeholder = 'Cognome'></td></tr>
<tr><td><input type='text' name='email' placeholder = 'Email'></td></tr>
<tr><td><input type='text' name='password' placeholder = 'Password'></td></tr>
</table>
</form>

<!-- MAIN HTML END -->
<footer id="footer">Made by ITISMeucci</footer>
</div>


	<script src="../controller/main.js"></script>
  </body>
</html>