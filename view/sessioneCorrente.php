<?php
include "../model/allowTeacher.php";
include "../model/generaSessione.php";
?>

<html lang="en">
  <head>
	<link rel="stylesheet" type="text/css" href="../bin/css/main.css">
	<link rel="stylesheet" type="text/css" href="../bin/css/tabStyle.css">
	
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

<input class="btnn" type="submit" value="Seleziona" onclick="hideClassSelection(); showCurrentSession();"> Alla pressione deve partire il codice nella funzione isset() dentro generaSessione.php in model
</div>

<div id="currentSession" style="display: none;">
    
    <!-- Tab links -->
<div class="tab">
  <button class="tablinks" onclick="openTab(event, 'Eventi')">Eventi</button>
  <button class="tablinks" onclick="openTab(event, 'Studenti')">Studenti</button>
  <button class="tablinks" onclick="openTab(event, 'Torni')">Torni</button>
</div>

<!-- Tab content -->
<div id="Eventi" class="tabcontent">

  <div id="tableDiv">
<table id="dump">
</table>
</div>
  
</div>

<div id="Studenti" class="tabcontent">
    
    <div id="tableDiv">
<table id="dump1">
</table>
</div>
    
</div>

<div id="Torni" class="tabcontent">
    
    <div id="tableDiv">
<table id="dump2">
</table>
</div>
    
</div>

<!-- MAIN HTML END -->
<footer id="footer">Made by ITISMeucci</footer>
</div>


	<script src="../controller/main.js"></script>
	<script src="../controller/sessioneCorrente.js"></script>
	<script src="../controller/sessioneEventi.js"></script>
  </body>
</html>