<?php
    include "../bin/connectDatabase.php";
    try{
        $stm = $conn->prepare("INSERT INTO docente (iddocente,nome,cognome,ruolo_idruolo,email,password) VALUES (NULL,?,?,?,?,?)");
        $return = $stm->execute([$_POST['nome'],$_POST['cognome'],'2',$_POST['email'],$_POST['password']]);
        
        if($return){
            header("Location: docenti.php");

        }
    }
    catch(Exception $e)
    {
        echo $e->getMessage();
        exit();
    }
?>