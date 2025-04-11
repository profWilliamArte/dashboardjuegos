<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';
header('Content-Type: application/json');
// Función para manejar errores
function handleError($message) {
    http_response_code(500);
    error_log($message); // Registrar el error en un archivo de log
    echo json_encode(['error' => 'Ocurrió un error en el servidor.']);
}
try {
    // Uso de declaraciones preparadas para mayor seguridad
    $stmt = $pdo->prepare("SELECT * FROM estatus");
    $stmt->execute();
    $generos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($generos);
} catch (Exception $e) {
    handleError($e->getMessage());
}
?>