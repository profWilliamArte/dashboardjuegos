<?php
/*
$host = 'localhost';
$dbname = 'dbjuegos';
$username = 'root';
$password = '';
*/
$host = 'localhost';
$dbname = 'arsiste1_juegos';
$username = 'arsiste1_dimtha01';
$password = 'fS!e93f*dOg*';


try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}
?>