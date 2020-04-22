<?php
class db{
  private $dbHost='localhost';//Nombre del host es localhost
  private $dbUser='root';//Nombre de cuenta es root
  private $dbPass='';//Contraseña de la base de datos es VACIA para XAAMP
  private $dbName='sabana_db';


  public function connectDB(){//Metodo que realiza la conexión con MYSQL y el SLIM

    $mysqlConnect ="mysql:host=$this->dbHost;dbname=$this->dbName";

    $dbConnection = new PDO($mysqlConnect,$this->dbUser,$this->dbPass);

    $dbConnection->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    return $dbConnection;
  }
}
