<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';

header('Content-Type: application/json');

// Obtener datos del cuerpo de la solicitud
$data = json_decode(file_get_contents('php://input'), true);

// Validar que se proporcione el idjuego
if (empty($data['idjuego'])) {
    http_response_code(400);
    echo json_encode(['error' => 'El campo idjuego es obligatorio']);
    exit;
}

// Asignar valores
$idjuego = (int)$data['idjuego'];

try {
    // Verificar si el juego existe
    $stmt = $pdo->prepare("SELECT idjuego FROM juegos WHERE idjuego = :idjuego");
    $stmt->execute(['idjuego' => $idjuego]);

    if (!$stmt->fetch(PDO::FETCH_ASSOC)) {
        http_response_code(404);
        echo json_encode(['error' => 'El juego no existe']);
        exit;
    }

    // Eliminar el juego
    $stmt = $pdo->prepare("DELETE FROM juegos WHERE idjuego = :idjuego");
    $stmt->execute(['idjuego' => $idjuego]);

    // Respuesta exitosa
    echo json_encode(['message' => 'juego eliminado correctamente']);
} catch (Exception $e) {
    // Manejo de errores
    error_log($e->getMessage()); // Registrar el error en un archivo de logs
    http_response_code(500);
    echo json_encode(['error' => 'Ha ocurrido un error interno']);
}
?>