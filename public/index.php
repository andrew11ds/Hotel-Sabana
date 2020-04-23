<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../src/config/db.php';
$app = new \Slim\App;
$app1=new \Slim\App;
//$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
  //  $name = $args['name'];
  // $response->getBody()->write("Hello, $name");

    //return $response;
//});

//Ruta clientes

require '../src/routes/hotels.php';//Aqui se llama al php de hoteles
$app->run();
