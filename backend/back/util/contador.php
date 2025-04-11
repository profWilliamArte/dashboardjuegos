<?php
// contador.php


header("Access-Control-Allow-Origin: *"); // Allow your frontend origin
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allow specific methods
header("Access-Control-Allow-Headers: Content-Type"); // Allow specific headers

require_once('../config/conexion.php');
// Obtener la dirección IP del visitante
$ip = $_SERVER['REMOTE_ADDR'];

// Obtener información geográfica de la IP
$response = file_get_contents("http://ip-api.com/json/{$ip}");
$data = json_decode($response, true);

$pais = isset($data['country']) ? $data['country'] : 'Desconocido';
$ciudad = isset($data['city']) ? $data['city'] : 'Desconocido';

// Guardar o actualizar en la base de datos
$sql = "INSERT INTO visitantes (ip, fecha, pais, ciudad, ultima_actividad, numvisitas) 
        VALUES (?, NOW(), ?, ?, NOW(), 1)
        ON DUPLICATE KEY UPDATE 
            ultima_actividad = NOW(), 
            numvisitas = numvisitas + 1"; // Incrementa numvisitas si ya existe
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $ip, $pais, $ciudad);
$stmt->execute();

// Incrementa el contador de vistas
$sql = "UPDATE visitas SET views = views + 1 WHERE id = 1";
$conn->query($sql);

// Obtiene el número total de vistas
$result = $conn->query("SELECT views FROM visitas WHERE id = 1");
$row = $result->fetch_assoc();
echo json_encode(["views" => $row['views']]);

$stmt->close();
$conn->close();
?>