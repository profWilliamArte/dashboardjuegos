<?php
// Iniciar el buffer de salida para capturar errores inesperados
ob_start();

require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';

header('Content-Type: application/json');

try {
    // Leer los demás datos enviados
    $data = [];
    foreach ($_POST as $key => $value) {
        $data[$key] = trim($value);
    }

    // Validar campos mínimos
    $requiredFields = ['idjuego', 'nombre', 'descripcion', 'idestatus', 'idgenero', 'precio'];
    foreach ($requiredFields as $field) {
        if (empty($data[$field])) {
            http_response_code(400);
            echo json_encode(['error' => "El campo '$field' es obligatorio"]);
            exit;
        }
    }

    // Verificar si el juego existe
    $stmt = $pdo->prepare("SELECT idjuego, imagen FROM juegos WHERE idjuego = :idjuego");
    $stmt->execute(['idjuego' => $data['idjuego']]);

    $juegoExistente = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$juegoExistente) {
        http_response_code(404);
        echo json_encode(['error' => 'El juego no existe']);
        exit;
    }

    // Validar que el nombre del juego no esté duplicado (excepto para el mismo juego)
    if (isset($data['nombre'])) {
        $stmt = $pdo->prepare("SELECT idjuego FROM juegos WHERE nombre = :nombre AND idjuego != :idjuego");
        $stmt->execute(['nombre' => $data['nombre'], 'idjuego' => $data['idjuego']]);

        if ($stmt->fetch(PDO::FETCH_ASSOC)) {
            http_response_code(400);
            echo json_encode(['error' => 'El nombre del juego ya existe']);
            exit;
        }
    }

    // Procesar la imagen solo si se envió una nueva
    $newFileName = $juegoExistente['imagen']; // Mantener la imagen existente por defecto
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = __DIR__ . '/../../../img/'; // Carpeta donde se guardará la imagen
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true); // Crear la carpeta si no existe
        }

        $originalName = $_FILES['imagen']['name'];
        $extension = pathinfo($originalName, PATHINFO_EXTENSION); // Obtener la extensión del archivo
        $newFileName = uniqid('img_', true) . '.' . $extension; // Generar un nombre aleatorio
        $uploadFile = $uploadDir . $newFileName;

        // Intentar mover el archivo subido al directorio de destino
        if (!move_uploaded_file($_FILES['imagen']['tmp_name'], $uploadFile)) {
            http_response_code(500);
            echo json_encode(['error' => 'Error al guardar la imagen']);
            exit;
        }
    }

    // Actualizar los campos proporcionados
    $sql = "UPDATE juegos SET 
                idestatus = COALESCE(:idestatus, idestatus),
                idgenero = COALESCE(:idgenero, idgenero),
                nombre = COALESCE(:nombre, nombre),
                descripcion = COALESCE(:descripcion, descripcion),
                fechapublicacion = COALESCE(:fechapublicacion, fechapublicacion),
                precio = COALESCE(:precio, precio),
                valoracion = COALESCE(:valoracion, valoracion),
                imagen = :imagen
            WHERE idjuego = :idjuego";

    $stmt = $pdo->prepare($sql);

    // Ejecutar la consulta
    $stmt->execute([
        ':idjuego' => $data['idjuego'],
        ':idestatus' => $data['idestatus'] ?? null,
        ':idgenero' => $data['idgenero'] ?? null,
        ':nombre' => $data['nombre'] ?? null,
        ':descripcion' => $data['descripcion'] ?? null,
        ':fechapublicacion' => $data['fechapublicacion'] ?? null,
        ':precio' => $data['precio'] ?? null,
        ':valoracion' => $data['valoracion'] ?? null,
        ':imagen' => $newFileName, // Usar la nueva imagen o mantener la existente
    ]);

    // Respuesta exitosa
    echo json_encode([
        'message' => 'Juego actualizado correctamente',
        'imagen_guardada' => $newFileName,
    ]);
} catch (Exception $e) {
    // Registrar el error en el log
    error_log($e->getMessage());

    // Limpiar cualquier salida previa
    ob_clean();

    // Devolver una respuesta de error 500
    http_response_code(500);
    echo json_encode(['error' => 'Error interno del servidor']);
}
?>