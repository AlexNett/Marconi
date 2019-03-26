<?php
    include "../bin/connectDatabase.php";
    try{
        $stm = $conn->prepare("INSERT INTO studente (idstudente,nome,cognome,email,password) VALUES (NULL,?,?,?,?)");
        $return = $stm->execute([$_POST['nome'],$_POST['cognome'],$_POST['email'],$_POST['password']]);
        
        if($return){
            header("Location: ../view/studenti.php");

        }
    }
    catch(Exception $e)
    {
        echo $e->getMessage();
        exit();
    }
?>