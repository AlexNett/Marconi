<?php

	include "../bin/connectDatabase.php";
	
	//
	// Generate the session id and date if there's none already in use
    //

    date_default_timezone_set('Europe/Rome');

    session_start();

    if(isset($_SESSION["sessionId"])) //Questo lo devo rimpiazzare con il caso in cui la classe è stata selezionata
    {  
        
    }

    else
    {
        $sessionId = $row[0] + 1;
        $sessionDateStart = date('Y-m-d H:i:s');

        $result = $conn->prepare( "SELECT classe, sezione FROM classe" );
        $result->execute();
        $classList = $result->fetchAll();

        $_SESSION["sessionId"] = $sessionId;
        $_SESSION["sessionDateStart"] = $sessionDateStart;
    }
?>