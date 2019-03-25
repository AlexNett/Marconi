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
  
  <div id="pageHide">
  <div>
  <p>Working...</p>
  <img src="../bin/resources/Marconi Logo.png">
  </div>
  </div>
 
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
<div id="page">

<form method="post" enctype="multipart/form-data" action="../controller/ADD_torni.php">
<input onchange="Preview(this.files)" id="data" name="data" class="btnn" type='file'/><br>
<button onclick="hide()" type="submit" name="submit" class="btnn" >Aggiungi Tornio<i class="fas fa-user-plus"></i></button>
<br><br>
<footer id="footer">Made by ITISMeucci</footer>
</form>


<div id="previewFile" style="text-align: left;">
<img id="preview" >
<p id="filename"></p>
<p id="filetype"></p>
<p id="filesize"></p>
</div>

</div>

<div id="tableDiv">
<table id="dump">
</table>
</div>

<!-- MAIN HTML END -->

	<script src="../controller/torni.js"></script>
	<script src="../controller/main.js"></script>
  </body>
</html>