<?php

	include "../bin/connectDatabase.php";
	
	//
	// Generate the session id and date if there's none already in use
    //

    date_default_timezone_set('Europe/Rome');

    session_start();

    if(isset($_SESSION["selectedClass"]))
    {
        if(isset($_GET["sessionEnd"]))
        {
            $sessionDateEnd = date('Y-m-d H:i:s');
            
            $stm = $conn->prepare("SELECT idsessione FROM sessione ORDER BY idsessione DESC LIMIT 1");
            $return = $stm->execute();
            $row = $return->fetch();
            
            $stm = $conn->prepare("UPDATE sessione SET datafine = :dataFine WHERE idsessione = :firstId ");
            $stm->bindValue(":dataFine", $sessionDateEnd);
            $stm->bindValue(":firstId", $row);
            $return = $stm->execute();
            
            session_destroy();
            header("Location: home.php");
        }
    }

    else
    {
        $class = $_GET['selectedClass'];
        $classArray = str_split($class);
        $_SESSION["selectedClass"] = $_SESSION[$classArray];
        
        $sessionDateStart = date('Y-m-d H:i:s');
        $_SESSION["sessionDateStart"] = $sessionDateStart;
        
        $stm = $conn->prepare("INSERT INTO sessione (idsessione, datainizio, datafine, professore_idprofessore) VALUES (NULL,?,NULL,?)");
        $return = $stm->execute($sessionDateStart,1);
    }
    
    $result = $conn->prepare( "SELECT classe, sezione FROM classe" );
    $result->execute();
    $classList = $result->fetchAll();
?>