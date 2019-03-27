<?php
include "../model/allowTeacher.php";
include "../model/generaSessione.php";
?>

<html lang="en">
  <head>
	<link rel="stylesheet" type="text/css" href="../bin/css/main.css">
	
	<title>Sessione</title>
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

<div id="page" style="text-align: center">
<!-- MAIN HTML START -->

<div id="classSelection">
<select>
    <option>Seleziona classe</option>
    <?php
        foreach($classList as $value)
        {
    ?>
    <option><?php echo $value[classe] . $value[sezione]; ?></option>
    <?php } ?>
</select><br>

<input class="btnn" type="button" value="Seleziona" onclick="hideClassSelection(); showCurrentSession();">
</div>

<div id="currentSession" style="display: none;">
    [DEBUG] Data di inizio della sessione corrente: "<?php echo $_SESSION["sessionDateStart"]; ?>"<br><br>
    
    Non ho messo il resto del codice perchè non è ancora pronto per il commit
</div>

<!-- MAIN HTML END -->
<footer id="footer">Made by ITISMeucci</footer>
</div>


	<script src="../controller/main.js"></script>
	<script src="../controller/sessioneCorrente.js"></script>
  </body>
</html>