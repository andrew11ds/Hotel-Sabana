<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app =new \Slim\App;
//GET Clientes

$app ->get('/api/hotels',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET

  $sql = "SELECT * FROM hotels";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($hotels);//Se muestran los clientes en formato JSON
    }else{
      echo json_encode("No existen hoteles");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});
//Crear nuevo cliente
$app ->post('/api/crearCliente',function(Request $request, Response $response){//Creación de cliente, metodo POST
  $nombre = $request->getParam('nombre');//Se hacen request de los parametros de las columnas
  $apellidos = $request->getParam('apellidos');
  $telefono = $request->getParam('telefono');
  $email= $request->getParam('email');
  $direccion = $request->getParam('direccion');
  $ciudad = $request->getParam('ciudad');
  $sql = "INSERT INTO  clientes(nombre,apellidos,telefono,email,direccion,ciudad) VALUES
  (:nombre,:apellidos,:telefono,:email,:direccion,:ciudad)";//Se  hace el query que inserta en la tabla de la base de datos
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();

    $resultado = $db->prepare($sql);
    $resultado ->bindParam(':nombre',$nombre);//Se hacen bindeos al resultado para guardarlo en la base de datos
    $resultado ->bindParam(':apellidos',$apellidos);
    $resultado ->bindParam(':telefono',$telefono);
    $resultado ->bindParam(':email',$email);
    $resultado ->bindParam(':direccion',$direccion);
    $resultado ->bindParam(':ciudad',$ciudad);
    $resultado -> execute();
    echo json_encode("Nuevo cliente guardado");

    $resultado =null;//Db y resultado deben quedar en null cada vez que se hace un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Tiene error y lo muestra

  }

});
