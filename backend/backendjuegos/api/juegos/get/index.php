<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';
header('Content-Type: application/json');
// Función para manejar errores
function handleError($message)
{
    http_response_code(500);
    error_log($message); // Registrar el error en un archivo de log
    echo json_encode(['error' => 'Ocurrió un error en el servidor.']);
}
try {
    // Uso de declaraciones preparadas
    $stmt = $pdo->prepare("SELECT a.idjuego, 
                            a.idestatus, 
                            a.nombre as nombre, 
                            a.descripcion, 
                            a.fechapublicacion, 
                            a.precio, 
                            a.imagen, 
                            a.valoracion,
                            b.idgenero, 
                            b.nombre as genero, 
                            a.descripcion as descripcion 
                            FROM juegos as a 
                            INNER JOIN generos as b on a.idgenero=b.idgenero");
    $stmt->execute();
    $juegos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($juegos);
} catch (Exception $e) {
    handleError($e->getMessage());
}
