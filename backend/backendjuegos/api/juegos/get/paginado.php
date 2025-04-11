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
    // Validar conexión a la base de datos
    if (!$pdo) {
        handleError("Ocurrió un error en el servidor.", "La conexión a la base de datos no está disponible.");
    }

    // Parámetros de paginación (pueden venir desde la solicitud GET)
    $limit = isset($_GET['limit']) ? max((int)$_GET['limit'], 1) : 10; // Límite de resultados (default: 10)
    $skip = isset($_GET['skip']) ? max((int)$_GET['skip'], 0) : 0; // Saltar registros (default: 0)

    // Validar los parámetros de paginación
    if ($limit <= 0 || $skip < 0) {
        handleError("Los parámetros de paginación son inválidos.", "Parámetros de paginación incorrectos.");
    }

    // Consulta SQL para obtener el total de registros
    $totalQuery = "SELECT COUNT(*) AS total FROM juegos";
    $totalStmt = $pdo->query($totalQuery);
    $total = $totalStmt->fetch(PDO::FETCH_ASSOC)['total'];

    // Consulta SQL con paginación y selección específica de columnas
    $query = "SELECT a.idjuego, 
                a.idestatus, 
                a.nombre as nombre, 
                a.descripcion, 
                a.fechapublicacion, 
                a.precio, 
                a.imagen, 
                b.idgenero, 
                b.nombre as genero, 
                b.descripcion as dgenero 
                FROM juegos as a 
                INNER JOIN generos as b on a.idgenero=b.idgenero
                LIMIT :limit OFFSET :skip";

    // Preparar la consulta
    $stmt = $pdo->prepare($query);

    // Vincular los parámetros de paginación
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':skip', $skip, PDO::PARAM_INT);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener los resultados
    $juegos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Verificar si hay resultados
    if (empty($juegos)) {
        http_response_code(404); // Código de estado HTTP 404 (Not Found)
        echo json_encode([
            'message' => 'No se encontraron juegos.',
            'total' => $total,
            'skip' => $skip,
            'limit' => $limit
        ]);
        exit;
    }

    // Devolver los resultados en formato JSON, incluyendo el total, skip y limit
    echo json_encode([
        'data' => $juegos,
        'total' => $total,
        'skip' => $skip,
        'limit' => $limit
    ]);

} catch (Exception $e) {
    // Manejar cualquier excepción que ocurra
    handleError("Ocurrió un error en el servidor.", $e->getMessage());
}