<?php
    include "../bin/connectDatabase.php";
    try{
        $stm = $conn->prepare("INSERT INTO classe (idclasse,classe,sezione) VALUES (NULL,?,?)");
        $return = $stm->execute([$_POST['classe'],$_POST['sezione']]);
        
        if($return){
            header("Location: classi.php");

        }
    }
    catch(Exception $e)
    {
        echo $e->getMessage();
        exit();
    }
?>