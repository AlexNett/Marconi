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
  <img src="../bin/resources/Marconi Logo.png"></img>
  </div>
  </div>
 
<header id="header">
<table id="headerTable"><tr>
<td><img class="logo" src="../bin/resources/Marconi logo.png" width="90" height="90"></td>
<td><a href="home.php">Home</a></td>
<?php
include "../model/header.php";
?>
</table></tr>
</header>

<!-- MAIN HTML START -->
<div class="page">

<form method="post" enctype="multipart/form-data" action="../controller/torni_ADD.php">
<input onchange="Preview(this.files)" id="data" name="data" class="btnn" type='file'/><br>
<button onclick="hide()" type="submit" name="submit" class="btnn" >Aggiungi Tornio<i class="fas fa-user-plus"></i></button>
</form>


<div id="previewFile" style="text-align: left;">
<img id="preview" ></img>
<p id="filename"></p>
<p id="filetype"></p>
<p id="filesize"></p>
</div>

</div>

<div class="page">
<table id="dump">
</table>
<footer id="footer">Made by ITISMeucci</footer>
</div>

<!-- MAIN HTML END -->

	<script src="../controller/torni.js"></script>
	<script src="../controller/main.js"></script>
  </body>
</html>