<?php
require_once('../../util/core.php');

require_once('../../config/conexion.php');

// Obtener los datos JSON de la solicitud
$data = json_decode(file_get_contents("php://input"));

// Validar los datos
if (isset($data->nombre)) {
    // Sanitizar la entrada
    $nombre = trim($data->nombre); // Eliminar espacios en blanco
   

    // Preparar la consulta SQL
    $sql = "INSERT INTO generos (nombre) VALUES (?)";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die(json_encode(["success" => false, "message" => "Error en la preparación de la consulta: " . $conn->error]));
    }

    // Asegúrate de que el número de parámetros coincida con los placeholders
    $stmt->bind_param("s", $nombre);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Género agregado exitosamente."]);
    } else {
        echo json_encode(["success" => false, "message" => "Ocurrió un error al agregar el género: " . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Datos incompletos."]);
}

// Cerrar la conexión
$conn->close();
?>