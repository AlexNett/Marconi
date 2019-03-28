<?php

	include "../bin/connectDatabase.php";
	
	//
	// Generate the session id and date if there's none already in use
    //

    date_default_timezone_set('Europe/Rome');

    session_start();

    if(isset($_SESSION["sessionId"])) //Questo devo farlo partire quando la classe è stata selezionata (è nel file sessioneCorrente.php nella cartella view)
    {  
        
    }

    else
    {
        $sessionId = $row[0] + 1;
        $sessionDateStart = date('Y-m-d H:i:s');

        $_SESSION["sessionId"] = $sessionId;
        $_SESSION["sessionDateStart"] = $sessionDateStart;
    }
    
    $result = $conn->prepare( "SELECT classe, sezione FROM classe" );
    $result->execute();
    $classList = $result->fetchAll();
?>