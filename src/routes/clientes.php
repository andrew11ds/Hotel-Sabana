<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app =new \Slim\App;
//GET Clientes

$app ->get('/api/clientes',function(Request $request, Response $response){

  $sql = "SELECT * FROM clientes";
  try {

    $db =new db();
    $db =$db ->connectDB();

    $resultado = $db->query($sql);
    if ($resultado->rowCount()>0) {
      $clientes= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($clientes);
    }else{
      echo json_encode("No existen clientes");
    }
    $resultado =null;
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';

  }

});
