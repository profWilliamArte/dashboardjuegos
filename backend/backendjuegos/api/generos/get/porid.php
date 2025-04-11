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
    $stmt = $pdo->prepare("SELECT * FROM generos WHERE idgenero = :idgenero");
    $stmt->execute(['idgenero' => $idgenero]);
    $genero = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$genero) {
        http_response_code(404);
        echo json_encode(['error' => 'El género no existe']);
        exit;
    }

    echo json_encode($genero);
} catch (Exception $e) {
    // Registrar el error en los logs
    error_log($e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Ha ocurrido un error interno']);
}
?>