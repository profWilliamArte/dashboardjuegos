<?php


header("Access-Control-Allow-Origin: *"); // Allow your frontend origin
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allow specific methods
header("Access-Control-Allow-Headers: Content-Type"); // Allow specific headers

require_once('../config/conexion.php');


// Consulta para obtener los visitantes activos en los últimos 5 minutos
//$sql = "SELECT ip, pais, ciudad FROM visitantes WHERE ultima_actividad > NOW() - INTERVAL 5 MINUTE";
$sql = "SELECT ip, pais, ciudad FROM visitantes WHERE ultima_actividad > NOW() - INTERVAL 48 HOUR";
$result = $conn->query($sql);

$visitantesActivos = [];

if ($result->num_rows > 0) {
    // Almacena los resultados en un array
    while ($row = $result->fetch_assoc()) {
        $visitantesActivos[] = [
            'ip' => $row['ip'],
            'pais' => $row['pais'],
            'ciudad' => $row['ciudad']
        ];
    }
}

// Devuelve la lista de visitantes activos como JSON
echo json_encode($visitantesActivos);

$conn->close();
?>