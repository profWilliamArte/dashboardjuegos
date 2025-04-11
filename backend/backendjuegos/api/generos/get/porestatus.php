<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';

header('Content-Type: application/json');

// Obtener el idestatus de los parámetros de la URL
$idestatus = isset($_GET['idestatus']) ? (int)$_GET['idestatus'] : null;

if ($idestatus === null) {
    http_response_code(400);
    echo json_encode(['error' => 'El campo idestatus es obligatorio']);
    exit;
}

try {
    // Preparar la consulta SQL de forma segura
    $stmt = $pdo->prepare("SELECT * FROM generos WHERE idestatus = :idestatus");
    $stmt->execute(['idestatus' => $idestatus]);
    $generos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($generos);
} catch (Exception $e) {
    // Registrar el error en los logs
    error_log($e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Ha ocurrido un error interno']);
}
?>