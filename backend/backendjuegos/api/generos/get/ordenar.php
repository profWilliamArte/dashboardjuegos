<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';

header('Content-Type: application/json');

// Obtener el parámetro de ordenación (opcional)
$orden = isset($_GET['orden']) ? trim($_GET['orden']) : 'ASC';

// Validar que el parámetro sea válido ('ASC' o 'DESC')
if (!in_array(strtoupper($orden), ['ASC', 'DESC'])) {
    http_response_code(400);
    echo json_encode(['error' => 'El parámetro "orden" debe ser ASC o DESC']);
    exit;
}

try {
    // Construir la consulta SQL de forma segura
    $query = "SELECT * FROM generos ORDER BY nombre " . strtoupper($orden);

    // Ejecutar la consulta
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $generos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($generos);
} catch (Exception $e) {
    // Registrar el error en los logs
    error_log($e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Ha ocurrido un error interno']);
}
?>