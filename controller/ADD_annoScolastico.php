<?php
    include "../bin/connectDatabase.php";
    try{
        $stm = $conn->prepare("INSERT INTO annoscolastico (idannoscolastico,annoInizio,annoFine) VALUES (NULL,?,?)");
        $return = $stm->execute([$_POST['inizio'],$_POST['fine']]);
        
		
		echo $_POST['inizio'] . "<br>";
		echo $_POST['fine'];
        if($return){
            header("Location: ../view/classi.php");

        }
    }
    catch(Exception $e)
    {
        echo $e->getMessage();
        exit();
    }
?>