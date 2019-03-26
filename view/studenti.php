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
    <form id='add' method='POST' action='../controller/ADD_studenti.php'>
    <table>
    <tr><td><input type='text' name='nome' placeholder = 'Nome' size="15" required></td><td rowspan="4" ><button class="btnn" type="submit">Aggiungi Studente <i class="fas fa-user-plus"></i></button></td></tr>
    <tr><td><input type='text' name='cognome' placeholder = 'Cognome' size="15" required></td></tr>
    <tr><td><input type='email' name='email' placeholder = 'Email' size="15" required></td></tr>
    <tr><td><input id = "pass" type="password" name="password" size="15" placeholder = 'Password' required>
    <span id="eye-btn" class="fa fa-fw fa-eye field-icon toggle-password" style="font-size: 18px;" onclick="setpass();"></span></td></tr>
    </table>
    </form>
    
    <!-- MAIN HTML END --> 
    <footer id="footer">Made by ITISMeucci</footer>
    </div>
    <div id = 'tableDiv'>
      <table id="dump">
        <tr>
          <th>Id Studente</th>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Email</th>
          <th>Classe</th>
          <th>Sezione</th>
          <?php
            tableStudenti();
          ?>
      </table>
    </div>
  </body>

	<script src="../controller/main.js"></script>
  </body>
</html>

<?php
  function tableStudenti() 
  {
    include "../bin/connectDatabase.php";
    try{
      $stm = $conn->prepare("SELECT idstudente,nome,cognome,email,classe,sezione FROM studente INNER JOIN classe ON classe_idclasse = idclasse");
      $stm->execute();
      $return = $stm->fetchAll(); 
    }
    catch(Exception $e)
    {
        echo $e->getMessage();
        exit();
    }
    for($i=0; $i<sizeof($return);$i++)
    {
      if($i % 2 == 0 )
      echo '<tr style="background-color: #7ccc04">';
      else
      echo '<tr>';
      for($j=0;$j<6;$j++)
      {
        echo '<td>'.$return[$i][$j].'</td>';
      }
      echo '<td class = "btn-del"><i class="fas fa-user-edit"></i></td>';
      echo '<td class ="btn-del"><i class="fas fa-user-times"></i></td></tr>';
    }
  }
  ?>