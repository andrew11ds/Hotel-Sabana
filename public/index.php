<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../src/config/db.php';

$app = new \Slim\App;



require '../src/routes/hotels.php';//Aqui se llama al php de hoteles , comentar si no se usara post
$app->run();
