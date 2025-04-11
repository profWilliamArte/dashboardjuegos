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
    $stmt = $pdo->prepare("SELECT idjuego,
                                juegos.nombre,
                                juegos.descripcion,
                                precio,
                                imagen,
                                generos.nombre as genero
                                FROM juegos
                                INNER JOIN generos ON juegos.idgenero=generos.idgenero
                                WHERE valoracion =5 Limit 12");
    $stmt->execute();
    $juegos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($juegos);
} catch (Exception $e) {
    handleError($e->getMessage());
}
