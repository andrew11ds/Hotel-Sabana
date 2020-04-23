<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app =new \Slim\App;

//GET para todos los hoteles
$app ->get('/api/hotels',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET

  $sql = "SELECT * FROM hotels";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($hotels);//Se muestran los hoteles en formato JSON
    }else{
      echo json_encode("No existen hoteles");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});

//GET para encontrar hotel por su nombre
$app ->get('/api/hotels/name/{nameH}',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $hotel_name = $request -> getAttribute('nameH'); //Aqui obtenemos el nombre que se escriba en la URL

  $sql = "SELECT * FROM hotels where hotels.name = '$hotel_name'";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($hotels);//Se muestran el hotel
    }else{
      echo json_encode("No existen hoteles");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});
//Buscar hoteles por estado
$app ->get('/api/hotels/state/{stateH}',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $hotel_state = $request -> getAttribute('stateH'); //Aqui obtenemos el nombre que se escriba en la URL

  $sql = "SELECT * FROM hotels where hotels.state = '$hotel_state'";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($hotels);//Se muestra el hotel
    }else{
      echo json_encode("No existen hoteles");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});
//Obtener hotel por su tipo

$app ->get('/api/hotels/type/{typeH}',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $hotel_type = $request -> getAttribute('typeH'); //Aqui obtenemos el nombre que se escriba en la URL

  $sql = "SELECT * FROM hotels where hotels.type = '$hotel_type'";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($hotels);//Se muestra el hotel
    }else{
      echo json_encode("No existen hoteles");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});
//Obtener hotel por su tamaño
$app ->get('/api/hotels/size/{sizeH}',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $hotel_size = $request -> getAttribute('sizeH'); //Aqui obtenemos el nombre que se escriba en la URL

  if($hotel_size == 'small'){
    $sql = "SELECT * FROM hotels where hotels.rooms <= 50 AND hotels.rooms > 0";//Codigo de MYSQL
  }

  if($hotel_size == 'medium'){
    $sql = "SELECT * FROM hotels where hotels.rooms <= 100 AND hotels.rooms > 50";//Codigo de MYSQL
  }

  if($hotel_size == 'large'){
    $sql = "SELECT * FROM hotels where hotels.rooms > 100";//Codigo de MYSQL
  }

  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($hotels);//Se muestra el hotel
    }else{
      echo json_encode("No existen hoteles");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});

$app ->get('/api/hotels/location/{lat},{long},{radius}',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $lati = $request -> getAttribute('lat'); //Aqui obtenemos la latitud del hotel a buscar
  $longi = $request -> getAttribute('long');//Aqui obtenemos la longitud del hotel a buscar
  $radi = $request -> getAttribute('radius');//Obtenemos

  //En url se obtiene el json con toda la informacion del lugar a buscar
  $url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lati,$longi&radius=$radi&type=lodging&key=AIzaSyB71EUVPqSHQT5W8T1L5dZPUND4kSAWF3U";

  $curl = curl_init();
  curl_setopt($curl, CURLOPT_URL, $url);
  curl_setopt($curl, CURLOPT_HEADER, false);
  curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($curl, CURLOPT_ENCODING, "");
  $curlData = curl_exec($curl);
  curl_close($curl);

  $address = json_decode($curlData);

  $Hname = $address -> results[0] -> name;

  $sql = "SELECT * FROM hotels where '$Hname' = hotels.name";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($hotels);//Se muestran los hoteles en formato JSON
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
