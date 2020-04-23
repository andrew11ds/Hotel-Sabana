<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
$app1 =new \Slim\App;



$app1 ->post('/api/user/newUser',function(Request $request, Response $response){//Creación de cliente, metodo POST
  $email = $request->getParam('email');//Se hacen request de los parametros de las columnas
  $password = $request->getParam('password');
  $name = $request->getParam('name');
  $last_name= $request->getParam('last_name');
  $address = $request->getParam('address');
  $sql = "INSERT INTO  users(email,password,name,last_name,address) VALUES
  (:email,:password,:name,:last_name,:address)";//Se  hace el query que inserta en la tabla de la base de datos
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();

    $resultado = $db->prepare($sql);
    $resultado ->bindParam(':email',$email);//Se hacen bindeos al resultado para guardarlo en la base de datos
    $resultado ->bindParam(':password',$password);
    $resultado ->bindParam(':name',$name);
    $resultado ->bindParam(':last_name',$last_name);
    $resultado ->bindParam(':address',$address);
    $resultado -> execute();
    echo json_encode("New user saved");

    $resultado =null;//Db y resultado deben quedar en null cada vez que se hace un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Tiene error y lo muestra

  }

});
