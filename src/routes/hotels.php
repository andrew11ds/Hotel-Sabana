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




//Crear nuevo hotel con sus cuartos
$app ->post('/api/hotels/newHotel',function(Request $request, Response $response){//Creación de hotel, metodo POST
  $name = $request->getParam('name');//Se hacen request de los parametros de las columnas
  $address = $request->getParam('address');
  $state = $request->getParam('state');
  $phone= $request->getParam('phone');
  $fax = $request->getParam('fax');
  $email = $request->getParam('email');
  $website = $request->getParam('website');
  $type = $request->getParam('type');
  $rooms = $request->getParam('rooms');
  $sql = "INSERT INTO  hotels(name,address,state,phone,fax,email,website,type,rooms) VALUES
  (:name,:address,:state,:phone,:fax,:email,:website,:type,:rooms)";//Se  hace el query que inserta en la tabla de la base de datos
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();

    $resultado = $db->prepare($sql);
    $resultado ->bindParam(':name',$name);//Se hacen bindeos al resultado para guardarlo en la base de datos
    $resultado ->bindParam(':address',$address);
    $resultado ->bindParam(':state',$state);
    $resultado ->bindParam(':phone',$phone);
    $resultado ->bindParam(':fax',$fax);
    $resultado ->bindParam(':email',$email);
    $resultado ->bindParam(':website',$website);
    $resultado ->bindParam(':type',$type);
    $resultado ->bindParam(':rooms',$rooms);
    $resultado -> execute();
    echo ("New hotel saved". PHP_EOL);

  $sql2 = "SELECT hotels.id from hotels order by hotels.id desc limit 1";

  $resultadoU = $db->query($sql2);//Se hace query
  if ($resultadoU->rowCount()>0) {//Metodo contador de COLUMNAS
    $idH= $resultadoU->fetchAll(PDO::FETCH_OBJ);
     $id=$idH[0]->id;//Se  convierte el JSON de el QUERY a una variable utilizable
  }else{
    echo ("No existe este id");
  }
  echo ("Hotel id: ".$id . PHP_EOL);//PHP EOL es salto de linea
    $sql2=null;
    $resultadoU=null;
    $singleR=$rooms*0.3;//Se calcula los cuartos dependiendo de los porcentajes
    $doubleR=$rooms*0.6;
    $suiteR=$rooms*0.1;
    if ($singleR-intval($singleR)<=0.5) {
      $singleR=intval($singleR);
    }else{
      $singleR=intval($singleR)+1;
    }

    if ($doubleR-intval($doubleR)<=0.5) {
      $doubleR=intval($doubleR);
    }else{
      $doubleR=intval($doubleR)+1;
    }

    if ($suiteR-intval($suiteR)<=0.5) {
      $suiteR=intval($suiteR);
    }else{
      $suiteR=intval($suiteR)+1;
    }
    $totalRooms=$singleR+$doubleR+$suiteR;
    $doubleR=$rooms-$totalRooms+$doubleR;
    $single='single';
    $double='double';
    $suite='suite';
   for ($i = 1; $i <=$singleR ; $i++) {
    $sql2 = "INSERT INTO rooms (hotel_id,room_id,room_type) VALUES
    (:id,:i,:single)";
     $resultado2= $db->prepare($sql2);
     $resultado2 ->bindParam(':id',$id);
     $resultado2->bindParam(':i',$i);
     $resultado2 ->bindParam(':single',$single);
     $resultado2 -> execute();
     $resultado2=null;
  }

  for ($k = $i; $k <=$singleR+$doubleR ; $k++) {
   $sql3 = "INSERT INTO rooms (hotel_id,room_id,room_type) VALUES
   (:id,:k,:double)";
   $resultado2= $db->prepare($sql3);
   $resultado2 ->bindParam(':id',$id);
   $resultado2->bindParam(':k',$k);
   $resultado2 ->bindParam(':double',$double);
   $resultado2 -> execute();
   $resultado2=null;
 }

 for ($j = $k; $j <=$singleR+$doubleR+$suiteR ; $j++) {
  $sql4 = "INSERT INTO rooms (hotel_id,room_id,room_type) VALUES
  (:id,:j,:suite)";
  $resultado2= $db->prepare($sql4);
  $resultado2 ->bindParam(':id',$id);
  $resultado2->bindParam(':j',$j);
  $resultado2 ->bindParam(':suite',$suite);
  $resultado2 -> execute();
  $resultado2=null;
}
    $resultado =null;//Db y resultado deben quedar en null cada vez que se hace un query
    $db =null;
    echo ("Rooms saved: 30% single rooms, 60% double rooms , 10% suites");

  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Tiene error y lo muestra

  }

});

$app ->post('/api/hotels/reserve',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $hotelid = $request -> getParam('hotel_id');
  $userid = $request -> getParam('user_id');
  $cant = $request -> getParam('cant');
  $room_type = $request -> getParam('room_type');
  $dstart = $request -> getParam('start_date');
  $dend = $request -> getParam('end_date');

  $sql = "SELECT hotels.id, rooms.room_id, date.date_start, date.date_end FROM hotels join rooms on hotels.id = rooms.hotel_id join date on date.room_id = rooms.room_id where hotels.id = '$hotelid' and rooms.room_type = '$room_type'";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query
    $roomR = array();
    $j=0;
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels = $resultado->fetchAll(PDO::FETCH_OBJ);
      for ($i=0; $i < count($hotels) ; $i++) {
        $s = $hotels[$i]->date_start;
        $e = $hotels[$i]->date_end;
        $cs = strtotime($s);
        $ce = strtotime($e);

        $cdstart = strtotime($dstart);
        $cdend = strtotime($dend);

        if((($cdstart<$cs and $cdstart<$ce) and ($cdend<$cs and $cdend<$ce)) or (($cdstart>$cs and $cdstart>$ce) and ($cdend>$cs and $cdend>$ce))){
        }else{
          $roomR[$j] = $hotels[$i]->room_id;
          $j = $j + 1;
        }
      }

      $roomT=array();

      for ($i=0; $i <count($hotels) ; $i++) {
        $roomT[$i] = $hotels[$i]->room_id;
      }

      $roomT = array_values(array_diff($roomT,$roomR));

      $roomid = 0;

      if (!empty($roomT)) {
        $roomid = $roomT[0];
      }

      if($roomid > 0){
        $sql2 = "INSERT INTO  date (hotel_id,room_id,date_start, date_end) VALUES
        (:hotelid,:roomid,:dstart,:dend)";

        $resultado3 = $db->prepare($sql2);
        $resultado3 ->bindParam(':hotelid',$hotelid);//Se hacen bindeos al resultado para guardarlo en la base de datos
        $resultado3 ->bindParam(':roomid',$roomid);
        $resultado3 ->bindParam(':dstart',$dstart);
        $resultado3 ->bindParam(':dend',$dend);
        $resultado3 -> execute();
        echo "Fecha programada".PHP_EOL;

        $sql2 = null;
        $sql2 = "SELECT date.date_id from date order by date.date_id desc limit 1";

        $resultado5 = $db->query($sql2);
        $dateR= $resultado5->fetchAll(PDO::FETCH_OBJ);
        $dateid = $dateR[0]->date_id;

        $sql2 = null;
        $sql2 = "SELECT hotels.rooms from hotels where hotels.id = '$hotelid'";

        $resultado6 = $db->query($sql2);
        $croom= $resultado6->fetchAll(PDO::FETCH_OBJ);
        $tam = $croom[0]->rooms;

        $price = 0;

        if ($tam <= 50) {
          if ($room_type == 'single') {
            $price = 50;
          }
          if ($room_type == 'double') {
            $price = 70;
          }
          if ($room_type == 'suite') {
            $price = 130;
          }
        }

        if ($tam >= 51 and $tam <= 100) {
          if ($room_type == 'single') {
            $price = 70;
          }
          if ($room_type == 'double') {
            $price = 100;
          }
          if ($room_type == 'suite') {
            $price = 200;
          }
        }

        if ($tam > 100) {
          if ($room_type == 'single') {
            $price = 90;
          }
          if ($room_type == 'double') {
            $price = 120;
          }
          if ($room_type == 'suite') {
            $price = 500;
          }
        }

        $sql2 = null;
        $sql2 = "INSERT INTO  reservations (hotel_id,room_id,room_type,user_id,lodgers,date_id,date_start,date_end,price) VALUES
        (:hotelid,:roomid,:room_type,:userid,:cant,:dateid,:dstart,:dend,:price)";

        $resultado7 = $db->prepare($sql2);
        $resultado7 ->bindParam(':hotelid',$hotelid);//Se hacen bindeos al resultado para guardarlo en la base de datos
        $resultado7 ->bindParam(':roomid',$roomid);
        $resultado7 ->bindParam(':room_type',$room_type);
        $resultado7 ->bindParam(':userid',$userid);
        $resultado7 ->bindParam(':cant',$cant);
        $resultado7 ->bindParam(':dateid',$dateid);
        $resultado7 ->bindParam(':dstart',$dstart);
        $resultado7 ->bindParam(':dend',$dend);
        $resultado7 ->bindParam(':price',$price);
        $resultado7 -> execute();
        echo "Reservacion hecha ". PHP_EOL;

        $sql2 = null;
        $sql2 = "SELECT reservations.reservation_id from reservations order by reservations.reservation_id desc limit 1";

        $resultado8 = $db->query($sql2);
        $res= $resultado8->fetchAll(PDO::FETCH_OBJ);
        $resid = $res[0]->reservation_id;

        echo "Id de la reservacion: ". $resid . " Price: ".$price;

        $resultado3 = null;
        $resultado5 = null;
        $resultado6 = null;
        $resultado7 = null;
        $resultado8 = null;

      }else{
        echo "No es posible realizar la reservacion.";
      }


    }else{
      echo json_encode("No hay reservas");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});

$app ->delete('/api/hotels/reservetion/delete',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $hotelid = $request -> getParam('hotel_id');
  $room_id = $request -> getParam('room_id');
  $date_start = $request -> getParam('date_start');

  $sql = "SELECT reservations.date_id FROM reservations where reservations.hotel_id = '$hotelid' and reservations.room_id = '$room_id' and reservations.date_start = '$date_start'";//Codigo de MYSQL

  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado2 = $db->query($sql);
    $dateid= $resultado2->fetchAll(PDO::FETCH_OBJ);
    $date_id = $dateid[0]->date_id;

    $sql2 = "DELETE FROM reservations where reservations.hotel_id = $hotelid and reservations.room_id = $room_id and reservations.date_start = '$date_start'";//Codigo de MYSQL

    $resultado = $db->query($sql2);//Se hace query

    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      echo "Reservacion eliminada.";
    }else{
      echo json_encode("No existe la reservacion.");
    }

    $sql3 = "DELETE from date where date.date_id = '$date_id'";

    $resultado =null;
    $resultado = $db->query($sql3);//Se hace query

    $resultado =null;
    $resultado2 =null;
    $db =null;
    
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});
