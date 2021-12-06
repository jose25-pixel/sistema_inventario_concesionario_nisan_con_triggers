<?php

    class ConexionDB{
        public function get_conexion(){
            $user = "root";
            $password = "";
            $host = "localhost";
            $bd = "vehiculo";

            $conexion = new PDO("mysql:host=$host;dbname=$bd",$user,$password,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));

            return $conexion;
            
        }
    }

?>