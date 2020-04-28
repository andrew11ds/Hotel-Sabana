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
      echo json_encode("No hotels found");
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
      echo json_encode("No hotels found");
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
      echo json_encode("No hotels found");
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
      echo json_encode("No hotels found");
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
  $sw = false;
  if($hotel_size == 'small'){
    $sql = "SELECT * FROM hotels where hotels.rooms <= 50 AND hotels.rooms > 0";//Codigo de MYSQL
  }else{
    if($hotel_size == 'medium'){
      $sql = "SELECT * FROM hotels where hotels.rooms <= 100 AND hotels.rooms > 50";//Codigo de MYSQL
    }else{
      if($hotel_size == 'large'){
        $sql = "SELECT * FROM hotels where hotels.rooms > 100";//Codigo de MYSQL
      }else{
        echo json_encode("This size does not exist");
        $sw = true;
      }
    }
  }
  if($sw == false){
    try {

      $db =new db();//Se llama a la base de datos
      $db =$db ->connectDB();//Se conecta a la base de datos

      $resultado = $db->query($sql);//Se hace query
      if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
        $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
        echo json_encode($hotels);//Se muestra el hotel
      }else{
        echo json_encode("No hotels found");
      }
      $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
      $db =null;
    } catch (PDOException $e) {
      echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

    }
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

  if (!empty($address)) {
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
        echo json_encode("No hotels found");
      }
      $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
      $db =null;
    } catch (PDOException $e) {
      echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

    }
  }

});




//Crear nuevo hotel con sus cuartos
$app ->post('/api/hotels/newHotel/key/{apikey}',function(Request $request, Response $response){//Creación de hotel, metodo POST
  $api_key=$request -> getAttribute('apikey');
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
  $sql2="SELECT * FROM apikey where '$api_key' = apikey.api_key";
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();
    $resultado = $db->query($sql2);//Se hace query
    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $resultado=null;
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


    $sql2 = "SELECT hotels.id from hotels order by hotels.id desc limit 1";

    $resultadoU = $db->query($sql2);//Se hace query
    if ($resultadoU->rowCount()>0) {//Metodo contador de COLUMNAS
      $idH= $resultadoU->fetchAll(PDO::FETCH_OBJ);
       $id=$idH[0]->id;//Se  convierte el JSON de el QUERY a una variable utilizable
    }else{
      echo ("Id does not exist");
    }
    echo json_encode("New Hotel id: ".$id);
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
    }else{
      echo json_encode ("Invalid Api key");
    }


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

        if((($cdstart<$cs and $cdstart<$ce) and ($cdend<=$cs and $cdend<$ce)) or (($cdstart>$cs and $cdstart>=$ce) and ($cdend>$cs and $cdend>$ce))){
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

        $sql2 = null;
        $sql2 = "SELECT reservations.reservation_id, reservations.date_id from reservations order by reservations.reservation_id desc limit 1";

        $resultado8 = $db->query($sql2);
        $res= $resultado8->fetchAll(PDO::FETCH_OBJ);
        $resid = $res[0]->reservation_id;

        echo json_encode($res);

        $resultado3 = null;
        $resultado5 = null;
        $resultado6 = null;
        $resultado7 = null;
        $resultado8 = null;

      }else{
        $sql = null;
        $sql = "SELECT hotels.id, rooms.room_id FROM hotels join rooms on hotels.id = rooms.hotel_id where hotels.id = '$hotelid' and rooms.room_type = '$room_type'";

        $resultado = null;
        $resultado = $db->query($sql);

        if ($resultado->rowCount()>0) {
          $hotels = null;
          $hotels = $resultado->fetchAll(PDO::FETCH_OBJ);
          for ($i=0; $i <count($hotels) ; $i++) {
            $roomTT[$i] = $hotels[$i]->room_id;
          }

          $roomTT = array_values(array_diff($roomTT,$roomR));

          if (!empty($roomTT)) {
            $roomid = $roomTT[0];
          }

          if ($roomid > 0) {
            $sql2 = "INSERT INTO  date (hotel_id,room_id,date_start, date_end) VALUES
            (:hotelid,:roomid,:dstart,:dend)";

            $resultado3 = $db->prepare($sql2);
            $resultado3 ->bindParam(':hotelid',$hotelid);//Se hacen bindeos al resultado para guardarlo en la base de datos
            $resultado3 ->bindParam(':roomid',$roomid);
            $resultado3 ->bindParam(':dstart',$dstart);
            $resultado3 ->bindParam(':dend',$dend);
            $resultado3 -> execute();

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

            $sql2 = null;
            $sql2 = "SELECT reservations.reservation_id, reservations.price  from reservations order by reservations.reservation_id desc limit 1";

            $resultado8 = $db->query($sql2);
            $res= $resultado8->fetchAll(PDO::FETCH_OBJ);

            $resultado3 = null;
            $resultado5 = null;
            $resultado6 = null;
            $resultado7 = null;
            $resultado8 = null;

            echo json_encode($res);
          }else{
            echo "Reservation not possible" . PHP_EOL;
            echo "No rooms available";
          }

        }

      }
    }else{

      $sql = null;
      $sql = "SELECT rooms.room_id from hotels join rooms on hotels.id = rooms.hotel_id where hotels.id = '$hotelid' and rooms.room_type = '$room_type' limit 1";

      $resultado = null;
      $resultado = $db->query($sql);//Se hace query

      if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS

        $rid = $resultado->fetchAll(PDO::FETCH_OBJ);

        $roomid = $rid[0]->room_id;

        $sql2 = "INSERT INTO  date (hotel_id,room_id,date_start, date_end) VALUES
        (:hotelid,:roomid,:dstart,:dend)";

        $resultado3 = $db->prepare($sql2);
        $resultado3 ->bindParam(':hotelid',$hotelid);//Se hacen bindeos al resultado para guardarlo en la base de datos
        $resultado3 ->bindParam(':roomid',$roomid);
        $resultado3 ->bindParam(':dstart',$dstart);
        $resultado3 ->bindParam(':dend',$dend);
        $resultado3 -> execute();

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

        $sql2 = null;
        $sql2 = "SELECT reservations.reservation_id, reservations.price  from reservations order by reservations.reservation_id desc limit 1";

        $resultado8 = $db->query($sql2);
        $res= $resultado8->fetchAll(PDO::FETCH_OBJ);

        $resultado3 = null;
        $resultado5 = null;
        $resultado6 = null;
        $resultado7 = null;
        $resultado8 = null;

        echo json_encode($res);

      }else{
        echo json_encode("Reservation not possible") . PHP_EOL;

        if (!($room_type == 'single') and !($room_type == 'double') and !($room_type == 'suite')) {
          echo json_encode("The room type does not exist");
        }else{
          echo json_encode("The hotel does not exist");
        }

      }

    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});

$app ->delete('/api/hotels/reservation/delete/',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET

  $hotelid = $request -> getParam('hotel_id');
  $room_id = $request -> getParam('room_id');
  $date_start = $request -> getParam('date_start');

  $sql = "SELECT reservations.date_id FROM reservations where reservations.hotel_id = '$hotelid' and reservations.room_id = '$room_id' and reservations.date_start = '$date_start'";//Codigo de MYSQL
  try {

    $db =new db();
    $db =$db ->connectDB();
    $resultado2 = $db->query($sql);
    if ($resultado2->rowCount()>0) {
      echo json_encode("Reservation removed");
      $dateid= $resultado2->fetchAll(PDO::FETCH_OBJ);
      $date_id = $dateid[0]->date_id;
      $sql2 = "DELETE FROM reservations where reservations.hotel_id = $hotelid and reservations.room_id = $room_id and reservations.date_start = '$date_start'";//Codigo de MYSQL
      $resultado = $db->query($sql2);
      $sql3 = "DELETE from date where date.date_id = '$date_id'";
      $resultado =null;
      $resultado = $db->query($sql3);

      $resultado =null;
      $resultado2 =null;
      $db =null;
    }else{
      echo json_encode("The reservation does not exist");
    }

  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});
//Actualización de hotel en la base de datos
$app ->put('/api/hotels/updateHotel/{idH}/key/{apikey}',function(Request $request, Response $response){
  $api_key=$request -> getAttribute('apikey');
  $id_hotel=$request->getAttribute('idH');
  $type = $request->getParam('type');
  $rooms = $request->getParam('rooms');
  $phone= $request->getParam('phone');
  $website = $request->getParam('website');
  $email = $request->getParam('email');
  $sql = "UPDATE hotels SET
        phone=:phone,
        email=:email,
        website=:website,
        type=:type,
        rooms=:rooms
        WHERE id=$id_hotel";
  $sql2="SELECT * FROM apikey where '$api_key' = apikey.api_key";
  $sql3="SELECT * FROM hotels where '$id_hotel'=hotels.id";
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();
    $resultado = $db->query($sql2);//Se hace query
    if ($resultado->rowCount()>0){

      $resultado =null;
      $resultado = $db->query($sql3);
      if ($resultado->rowCount()>0) {
        $resultado=null;
        $resultado = $db->prepare($sql);
        $resultado ->bindParam(':phone',$phone);
        $resultado ->bindParam(':email',$email);//Se hacen bindeos al resultado para guardarlo en la base de datos
        $resultado ->bindParam(':website',$website);
        $resultado ->bindParam(':type',$type);
        $resultado ->bindParam(':rooms',$rooms);
        $resultado -> execute();
        echo json_encode("Hotel updated(1)" .PHP_EOL);
        $resultado =null;
        $sql2 = "DELETE FROM rooms WHERE rooms.hotel_id='$id_hotel'";
        $resultado = $db->query($sql2);
        $resultado =null;
        $sql2=null;
        $sql2="DELETE FROM reservations WHERE reservations.hotel_id='$id_hotel'";
        $resultado = $db->query($sql2);
        $resultado =null;
        $sql2=null;
        $sql2="DELETE FROM date WHERE  date.hotel_id='$id_hotel'";
        $resultado = $db->query($sql2);//Se hace query
        $id=$id_hotel;
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
        $resultado =null;
        $db =null;
      }else{
        echo json_encode("Hotel does not exist");
      }

    }else{
      echo json_encode ("invalid api key");
    }

  } catch (PDOException $e) {
    echo json_encode ("User not updated(0)");
    echo '{"error" :{"text":'.$e->getMessage().'}';//Tiene error y lo muestra

  }

});
//Eliminar un hotel

$app ->delete('/api/hotels/deleteHotel/{idH}/key/{apikey}',function(Request $request, Response $response){
  $api_key=$request -> getAttribute('apikey');
  $id_hotel=$request->getAttribute('idH');
  $sql="SELECT * FROM apikey where '$api_key' = apikey.api_key";
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos
    $resultado = $db->query($sql);
    if ($resultado->rowCount()>0){
      $resultado=null;
      $sql2 = "DELETE FROM hotels WHERE hotels.id = '$id_hotel'";
      $sql3 = "DELETE FROM rooms WHERE rooms.hotel_id = '$id_hotel'";
      $sql4 = "DELETE FROM reservations WHERE reservations.hotel_id = '$id_hotel'";
      $sql5 = "DELETE FROM date WHERE date.hotel_id = '$id_hotel'";
      $resultado = $db->query($sql2);
      if ($resultado->rowCount()>0) {
        echo json_encode ("Hotel has been erased successfully.");
      }else{
        echo json_encode ("Hotel does not exist");
      }
      $resultado=null;
      $resultado = $db->query($sql3);
      $resultado=null;
      $resultado = $db->query($sql4);
      $resultado=null;
      $resultado = $db->query($sql5);




    $resultado=null;
      $db =null;
    }else{
      echo "Invalid API key";
    }



  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});

$app ->get('/api/hotels/api/generate/{contactName},{company},{email}',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $coName = $request -> getAttribute('contactName'); //Aqui obtenemos el nombre que se escriba en la URL
  $company = $request -> getAttribute('company');
  $email = $request -> getAttribute('email');

  $str = $coName . ", " . $company . ", " . $email;

  if (strlen($str)>50) {
    $rest = substr($str,0,50);
  }else {
    $rest = $str;
  }
  $subR = $rest;
  $key = base64_encode($rest);

  $sw = false;

  try {

      $db =new db();//Se llama a la base de datos
      $db =$db ->connectDB();//Se conecta a la base de datos

      while (!$sw) {
          $sql = null;
          $sql = "SELECT apikey.api_key from apikey where apikey.api_key = '$key'";

          $resultado = $db->query($sql);//Se hace query
          if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
            $sub = substr($rest,0,strlen($rest)-4);
            $subR = $sub . random_int(0,1000);
            $key=null;
            $key = base64_encode($subR);
          }else{
            $sw = true;
          }
      }

      $key = null;
      $key = base64_encode($subR);

      $sql = null;
      $sql = "INSERT into apikey (api_key) values ('$key')";//Codigo de MYSQL

      $resultado = null;
      $resultado = $db->query($sql);//Se hace query

      echo json_encode("Api key: '$key'");

      $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
      $db =null;

    } catch (PDOException $e) {
      echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

    }

});

$app ->post('/api/user/newUser',function(Request $request, Response $response){//Creación de cliente, metodo POST
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

    $sql2 = "SELECT users.id from users order by users.id desc limit 1";

    $resultadoU = $db->query($sql2);//Se hace query
    if ($resultadoU->rowCount()>0) {//Metodo contador de COLUMNAS
      $usr= $resultadoU->fetchAll(PDO::FETCH_OBJ);
      echo json_encode($usr);
    }else{
      echo json_encode("user does not exist");
    }
    $resultadoU=null;
    $resultado =null;//Db y resultado deben quedar en null cada vez que se hace un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Tiene error y lo muestra

  }

});

$app ->put('/api/user/updateUser/{idUs}',function(Request $request, Response $response){//Creación de cliente, metodo POST
  $id_user=$request->getAttribute('idUs');
  $email = $request->getParam('email');//Se hacen request de los parametros de las columnas
  $password = $request->getParam('password');
  $name = $request->getParam('name');
  $last_name= $request->getParam('last_name');
  $address = $request->getParam('address');
  $sql2= "SELECT * FROM  users where users.id = '$id_user'";
  $sql = "UPDATE users SET
        email= :email,
        password= :password,
        name= :name,
        last_name= :last_name,
        address= :address
        WHERE id=$id_user";

  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();
    $resultado = $db->query($sql2);
    if ($resultado->rowCount()>0) {
      $resultado=null;
      $resultado = $db->prepare($sql);
      $resultado ->bindParam(':email',$email);//Se hacen bindeos al resultado para guardarlo en la base de datos
      $resultado ->bindParam(':password',$password);
      $resultado ->bindParam(':name',$name);
      $resultado ->bindParam(':last_name',$last_name);
      $resultado ->bindParam(':address',$address);
      $resultado -> execute();
      echo json_encode("1");
    }else{
        echo ("user does not exist" .PHP_EOL);
        echo json_encode("0");

    }


    $resultado =null;//Db y resultado deben quedar en null cada vez que se hace un query
    $db =null;
  } catch (PDOException $e) {
    echo json_encode("0" .PHP_EOL);
    echo '{"error" :{"text":'.$e->getMessage().'}';//Tiene error y lo muestra

  }

});

$app ->get('/api/hotels/availability/{startdateH},{finaldateH},{stateH}',function(Request $request, Response $response){//Metodo get, el link debe ser puesto en postman con GET
  $start_d = $request -> getAttribute('startdateH'); //Aqui obtenemos el nombre que se escriba en la URL
  $final_d = $request -> getAttribute('finaldateH');
  $hotel_state = $request -> getAttribute('stateH');

  $start_date = strtotime($start_d);
  $final_date = strtotime($final_d);


$sql = "SELECT hotels.id, hotels.state, rooms.room_id, rooms.room_type, date.date_start, date.date_end FROM hotels join date on hotels.id = date.hotel_id join rooms on rooms.room_id = date.room_id and rooms.hotel_id = date.hotel_id where hotels.state = '$hotel_state'";//Codigo de MYSQL
  try {

    $db =new db();//Se llama a la base de datos
    $db =$db ->connectDB();//Se conecta a la base de datos

    $resultado = $db->query($sql);//Se hace query

    if ($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels= $resultado->fetchAll(PDO::FETCH_OBJ);
      $cont = 0;
      for ($i=0; $i < count($hotels) ; $i++) {
        $s = $hotels[$i]->date_start;
        $e = $hotels[$i]->date_end;
        $cs = strtotime($s);
        $ce = strtotime($e);
        $sw = true;

        if((($start_date<$cs and $start_date<$ce) and ($final_date<=$cs and $final_date<$ce)) or (($start_date>$cs and $start_date>=$ce) and ($final_date>$cs and $final_date>$ce))){

        }else{
          $rooms_disable[$cont] = $hotels[$i]->room_id;
          $dates_disable[$cont] = $hotels[$i]->date_start;
          $cont++;
        }
      }

      for ($i=0; $i < count($hotels) ; $i++) {
        $sw = true;
        if (empty($rooms_disable) == false) {
          for ($j=0; $j < count($rooms_disable) ; $j++) {
            $temp = $hotels[$i]->room_id;
            $temp2 = $hotels[$i]->date_start;
            if(($temp == $rooms_disable[$j]) && ($temp2 == $dates_disable[$j])){
              $sw = false;
              $ahid[$i] = $hotels[$i]->id;
              $ahstate[$i] = $hotels[$i]->state;
              $arroom_id[$i] = $hotels[$i]->room_id;
              $arroom_type[$i] = $hotels[$i]->room_type;
              $ocupados[$i] = $ahid[$i]."-".$arroom_id[$i];
            }
          }
        }
      }
    }

    $sql2 = "SELECT hotels.id, hotels.name, hotels.state, rooms.room_id, rooms.room_type from hotels join rooms on hotels.id = rooms.hotel_id where hotels.state = '$hotel_state'";

    $resultado = $db->query($sql2);//Se hace query
    if($resultado->rowCount()>0) {//Metodo contador de COLUMNAS
      $hotels2 = $resultado->fetchAll(PDO::FETCH_OBJ);

      for ($i=0; $i < count($hotels2); $i++) {
        $ahid2[$i] = $hotels2[$i]->id;
        $ahstate2[$i] = $hotels2[$i]->state;
        $arroom_id2[$i] = $hotels2[$i]->room_id;
        $arroom_type2[$i] = $hotels2[$i]->room_type;
        $disponible2[$i] = $ahid2[$i]."-".$arroom_id2[$i];
      }

      if (empty($ocupados) == false) {
        $disponible2 = array_values(array_diff($disponible2,$ocupados));
        $cont = 0;
        for ($i=0; $i < count($hotels2); $i++) {
          for ($j=0; $j < count($disponible2); $j++) {
            $separada = explode("-", $disponible2[$j]);
            if($separada[0] == $ahid2[$i] && $separada[1] == $arroom_id2[$i]){
              $disponible_hotels[$cont] = $hotels2[$i];
              $cont++;
              break;
            }
          }
        }
          echo json_encode($disponible_hotels);
      }else{
          echo json_encode($hotels2);
      }

    }else{
        echo json_encode("State not found");
    }
    $resultado =null;//Se debe poner en null el resultado y la base de datos despues de un query
    $db =null;
  } catch (PDOException $e) {
    echo '{"error" :{"text":'.$e->getMessage().'}';//Muestra error si hubo

  }

});
