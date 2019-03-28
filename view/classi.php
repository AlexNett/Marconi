<?php
include "../model/allowAdmin.php";
?>

<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" type="text/css" href="../bin/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <title>Studenti</title>
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

    <div id="page">
    <!-- MAIN HTML START -->
    <form id='add' method='POST' action='../controller/ADD_classi.php'>
    <table>
    <tr><td><input type='text' name='classe' placeholder = 'Classe' size="20" required></td><td rowspan="4" ><button class="btnn" type="submit">Aggiungi Classe <i class="fas fa-users"></i></button></td></tr>
    <tr><td><input type='text' name='sezione' placeholder = 'Sezione' size="20" required></td></tr>
    <tr><td><input type='text' name='annos' placeholder = 'Anno Scolastico' size="20" required></td></tr>
    </table>
    </form>
    <br><br>
    <!-- MAIN HTML END -->
    <footer id="footer">Made by ITISMeucci</footer>
    </div>
    <div id = 'tableDiv'>
      <table id="dump">
      </table>
    </div>
  </body>
	<script src="../controller/showhide.js"></script>
  <script src="../controller/notifySystem.js"></script>
  <script src="../controller/dbclickEdit.js"></script>
  <script src="../controller/classi.js"></script>
	<script src="../controller/main.js"></script>
</html>