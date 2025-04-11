<?php
require_once __DIR__ . '/../../../config/db.php';
header('Content-Type: application/json');

// Función para manejar errores
function handleError($message) {
    http_response_code(500);
    error_log($message); // Registrar el error en un archivo de log
    echo json_encode(['error' => 'Ocurrió un error en el servidor.']);
}

try {
    // Obtener el parámetro de búsqueda desde la solicitud GET
    $searchTerm = isset($_GET['q']) ? trim($_GET['q']) : '';

    // Validar que el término de búsqueda no esté vacío
    if (empty($searchTerm)) {
        http_response_code(400); // Bad Request
        echo json_encode(['error' => 'El parámetro de búsqueda es requerido.']);
        exit;
    }

    // Preparar la consulta con un parámetro dinámico
    $query = "SELECT *
              FROM juegos
              WHERE nombre LIKE :search
                 OR descripcion LIKE :search";
    $stmt = $pdo->prepare($query);

    // Agregar comodines (%) al término de búsqueda
    $searchTerm = '%' . $searchTerm . '%';

    // Vincular el parámetro a la consulta
    $stmt->bindParam(':search', $searchTerm, PDO::PARAM_STR);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener los resultados
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Verificar si se encontraron coincidencias
    if (empty($resultados)) {
        http_response_code(404); // Not Found
        echo json_encode(['message' => 'No se encontraron coincidencias.']);
    } else {
        echo json_encode($resultados);
    }
} catch (Exception $e) {
    handleError($e->getMessage());
}
?>