<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';
header('Content-Type: application/json');

// Obtener datos del cuerpo de la solicitud
$data = json_decode(file_get_contents('php://input'), true);

// Validar que al menos uno de los campos opcionales esté presente
if (empty($data['nombre']) && empty($data['descripcion']) && empty($data['idestatus'])) {
    http_response_code(400);
    echo json_encode(['error' => 'Debe proporcionar al menos un campo: nombre, descripción o idestatus']);
    exit;
}

// Asignar valores (permitir NULL si no se proporcionan)
$nombre = isset($data['nombre']) ? trim($data['nombre']) : null;
$descripcion = isset($data['descripcion']) ? trim($data['descripcion']) : null;
$idestatus = isset($data['idestatus']) ? (int)$data['idestatus'] : 1;

try {
    // Validar que el nombre no esté duplicado
    if ($nombre !== null) {
        $stmt = $pdo->prepare("SELECT idgenero FROM generos WHERE nombre = :nombre");
        $stmt->execute(['nombre' => $nombre]);

        if ($stmt->fetch(PDO::FETCH_ASSOC)) {
            http_response_code(400);
            echo json_encode(['error' => 'El nombre del género ya está en uso']);
            exit;
        }
    }

    // Preparar la consulta SQL
    $stmt = $pdo->prepare("INSERT INTO generos (idestatus, nombre, descripcion) VALUES (:idestatus, :nombre, :descripcion)");

    // Ejecutar la consulta con los valores proporcionados
    $stmt->execute([
        'idestatus' => $idestatus,
        'nombre' => $nombre,
        'descripcion' => $descripcion
    ]);

    // Respuesta exitosa
    echo json_encode(['message' => 'Género creado correctamente']);
} catch (Exception $e) {
    // Manejo de errores
    error_log($e->getMessage()); // Registrar el error en un archivo de logs
    http_response_code(500);
    echo json_encode(['error' => 'Ha ocurrido un error interno']);
}
?>