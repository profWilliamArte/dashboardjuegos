<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';
header('Content-Type: application/json');
// Obtener el idgenero de los parámetros de la URL
$idgenero = isset($_GET['idgenero']) ? (int)$_GET['idgenero'] : null;
if ($idgenero === null) {
    http_response_code(400);
    echo json_encode(['error' => 'El campo idgenero es obligatorio']);
    exit;
}
try {
    // Preparar la consulta SQL de forma segura
    $stmt = $pdo->prepare("
        SELECT 
            a.idjuego, 
            a.idestatus, 
            a.nombre AS nombre, 
            a.descripcion, 
            a.fechapublicacion, 
            a.precio, 
            a.imagen, 
            b.idgenero, 
            b.nombre AS genero, 
            b.descripcion AS dgenero  
        FROM 
            juegos AS a 
        INNER JOIN 
            generos AS b ON a.idgenero = b.idgenero 
        WHERE 
            b.idgenero = :idgenero
    ");
    $stmt->execute(['idgenero' => $idgenero]);
    $juegos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($juegos);
} catch (Exception $e) {
    // Registrar el error en los logs
    error_log($e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Ha ocurrido un error interno']);
}
?>