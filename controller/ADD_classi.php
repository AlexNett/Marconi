<?php
    include "../bin/connectDatabase.php";
    try{
        $stm = $conn->prepare("INSERT INTO classe (idclasse,classe,sezione,annoScolastico) VALUES (NULL,?,?,?)");
        $return = $stm->execute([$_POST['classe'],$_POST['sezione'],$_POST['annos']]);
        
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