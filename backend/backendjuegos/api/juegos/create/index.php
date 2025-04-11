<?php
// Iniciar el buffer de salida para capturar errores inesperados
ob_start();

require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';

header('Content-Type: application/json');

try {
    // Verificar si se envió una imagen
    if (!isset($_FILES['imagen']) || $_FILES['imagen']['error'] !== UPLOAD_ERR_OK) {
        http_response_code(400);
        echo json_encode(['error' => 'No se recibió ninguna imagen']);
        exit;
    }

    // Procesar la imagen
    $uploadDir = __DIR__ . '/../../../img/'; // Carpeta donde se guardará la imagen
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true); // Crear la carpeta si no existe
    }

    $originalName = $_FILES['imagen']['name'];
    $extension = pathinfo($originalName, PATHINFO_EXTENSION); // Obtener la extensión del archivo
    $newFileName = uniqid('img_', true) . '.' . $extension; // Generar un nombre aleatorio
    $uploadFile = $uploadDir . $newFileName;

    if (!move_uploaded_file($_FILES['imagen']['tmp_name'], $uploadFile)) {
        http_response_code(500);
        echo json_encode(['error' => 'Error al guardar la imagen']);
        exit;
    }

    // Leer los demás datos enviados
    $data = [];
    foreach ($_POST as $key => $value) {
        $data[$key] = trim($value);
    }

    // Validar campos obligatorios
    $requiredFields = ['nombre', 'descripcion', 'idestatus', 'idgenero', 'precio'];
    foreach ($requiredFields as $field) {
        if (empty($data[$field])) {
            http_response_code(400);
            echo json_encode(['error' => "El campo '$field' es obligatorio"]);
            exit;
        }
    }

    // Validar que el nombre del juego no esté duplicado
    $stmt = $pdo->prepare("SELECT idjuego FROM juegos WHERE nombre = :nombre");
    $stmt->execute(['nombre' => $data['nombre']]);

    if ($stmt->fetch(PDO::FETCH_ASSOC)) {
        http_response_code(400);
        echo json_encode(['error' => 'El nombre del juego ya está en uso']);
        exit;
    }

    // Preparar la consulta SQL
    $sql = "INSERT INTO juegos (idestatus, idgenero, nombre, descripcion, fechapublicacion, precio, valoracion, imagen)
            VALUES (:idestatus, :idgenero, :nombre, :descripcion, :fechapublicacion, :precio, :valoracion, :imagen)";

    $stmt = $pdo->prepare($sql);

    // Ejecutar la consulta con los valores proporcionados
    $stmt->execute([
        ':idestatus' => $data['idestatus'],
        ':idgenero' => $data['idgenero'],
        ':nombre' => $data['nombre'],
        ':descripcion' => $data['descripcion'],
        ':fechapublicacion' => $data['fechapublicacion'] ?? null,
        ':precio' => $data['precio'],
        ':valoracion' => $data['valoracion'] ?? null,
        ':imagen' => $newFileName, // Guardar el nombre generado para la imagen
    ]);

    // Respuesta exitosa
    echo json_encode([
        'message' => 'Juego creado correctamente',
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