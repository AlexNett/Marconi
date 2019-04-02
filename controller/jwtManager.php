<?php
session_start();
require_once('jwt.php');

try{
    if(isset($_GET["action"]))
    {
        switch($_GET["action"])
        {
            case "getToken":
                if(isset($_GET["id"]))
                {
                    $tok = jwt::encode($_GET["id"], 'ciao');
                    $test = explode('.', $tok);
                    if(sizeof($test)!= 3)
                    {
                        $tok =  array('error: ', $tok);
                    }
                    echo json_encode($tok);
                }
                else echo json_encode(array('error', 'no id recived'));
            break;
            case "getInfo":
                $entityBody = json_decode(file_get_contents('php://input'));
                $data =jwt::decode($entityBody, 'ciao');
                if(!isNumeric($data))
                {
                    $data = array('error', $data);
                }
                echo json_encode($data);
            break;
            default: echo json_encode(array('error', 'no valid action'));;
        }
    }
}catch (Exception $e)
{
    return json_encode(array('error', $e->getMessage()));
}
/*
ho usato questa funzione nel js per comporre i parametri da inserire nella richiesta

function encodeQueryData(data) {
    const ret = [];
    for (let d in data)
      ret.push(encodeURIComponent(d) + '=' + encodeURIComponent(data[d]));
    return ret.join('&');
 }

 altre funzioni utili e/o utilizzate nell'esempio

  function setCookie(cname,cvalue,exhours) {
    var d = new Date();
    d.setTime(d.getTime() + (exhours*60*60*1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
  }

  function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }

esempio per codifica da js (parametri passati in GET)

        const data = { 'action': 'getToken', 'id': idUtente };
        const querystring = encodeQueryData(data);
        fetch("controller/jwtManager.php?"+querystring, { credentials: "same-origin"}).then((r)=> {return r.json();}).then((res)=> {       
        if(!Array.isArray(res))
            setCookie("token", res, 2);
        });
in questo esempio
 idUtente è l'id da trasformare in token
 res è il token 
 OPPURE
 un array con due campi di cui il primo è la stringa 'error'
 seguito dal secondo campo che è un ulteriore descrizione se disponibile
 Attenzione si può verificare l'errore 500 se ci sono problemi con il token

esempio per decodifica da js (parametri passati in GET e POST)
 
 ...blabla  const data2 = { 'action': 'getInfo'};
            const querystring2 = encodeQueryData(data2);
            fetch("controller/jwtManager.php?"+querystring2, { method: 'post', body: JSON.stringify(res),   headers:{
              'Content-Type': 'application/json'
            }, credentials: "same-origin"}).then((r2)=>{return r2.json();}).then((res2)=>{
              alert(res2);
            })
in questo esempio
 res è il token
 res2 è un numero (l'id) se il token è valido
 OPPURE
 un array con due campi di cui il primo è la stringa 'error'
 seguito dal secondo campo che è un ulteriore descrizione se disponibile
 Attenzione si può verificare l'errore 500 se ci sono problemi con il token


 */
?>