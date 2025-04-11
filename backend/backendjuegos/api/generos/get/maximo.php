<?php
require_once __DIR__ . '/../../../config/cors.php'; // Configuración de CORS
require_once __DIR__ . '/../../../config/db.php';  // Conexión a la base de datos

// Encabezado HTTP para indicar que la respuesta será JSON
header('Content-Type: application/json');

// Función para manejar errores de forma centralizada
function handleError($message, $logMessage = null) {
    http_response_code(500); // Código de estado HTTP 500 (Internal Server Error)
    if ($logMessage) {
        error_log($logMessage); // Registrar el error en un archivo de log
    }
    echo json_encode(['error' => $message]);
    exit;
}

try {
    // Validar que la conexión a la base de datos esté activa
    if (!$pdo) {
        handleError("Ocurrió un error en el servidor.", "La conexión a la base de datos no está disponible.");
    }

    // Configurar la codificación de caracteres (UTF-8)
    $pdo->exec("SET NAMES 'utf8'");

    // Parámetros de paginación (pueden venir desde la solicitud GET)
    $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10; // Límite de resultados (default: 10)
    $offset = isset($_GET['offset']) ? (int)$_GET['offset'] : 0; // Desplazamiento (default: 0)

    // Validar los parámetros de paginación
    if ($limit <= 0 || $offset < 0) {
        handleError("Los parámetros de paginación son inválidos.", "Parámetros de paginación incorrectos.");
    }

    // Consulta SQL con paginación y selección específica de columnas
    $query = "SELECT idgenero, nombre, descripcion 
              FROM generos 
              ORDER BY nombre 
              LIMIT :limit OFFSET :offset";

    // Preparar la consulta
    $stmt = $pdo->prepare($query);

    // Vincular los parámetros de paginación
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener los resultados
    $generos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Verificar si hay resultados
    if (empty($generos)) {
        http_response_code(404); // Código de estado HTTP 404 (Not Found)
        echo json_encode(['message' => 'No se encontraron géneros.']);
        exit;
    }

    // Devolver los resultados en formato JSON
    echo json_encode($generos);

} catch (Exception $e) {
    // Manejar cualquier excepción que ocurra
    handleError("Ocurrió un error en el servidor.", $e->getMessage());
}
