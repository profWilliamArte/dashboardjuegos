<?php

require_once('../../util/core.php');
require_once('../../config/conexion.php');

// Obtener los datos JSON de la solicitud
$data = json_decode(file_get_contents("php://input"));

// Validar los datos
if (isset($data->idtipousuario) && isset($data->nombre) && isset($data->correo) && isset($data->clave)) {
    $idtipousuario = $data->idtipousuario;
    $nombre = $data->nombre;
    $correo = $data->correo;
    $clave = $data->clave;
    $fecha = date('Y/m/d');
    $idestatus = 1;

    // Preparar la consulta SQL
    $sql = "INSERT INTO autor (idtipousuario, idestatus, nombre, correo, clave, fecha) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die(json_encode(["success" => false, "message" => "Error en la preparación de la consulta: " . $conn->error]));
    }

    // Asegúrate de que el número de parámetros coincida con los placeholders
    $stmt->bind_param("iissss", $idtipousuario, $idestatus, $nombre, $correo, $clave, $fecha);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Autor agregado exitosamente."]);
    } else {
        echo json_encode(["success" => false, "message" => "Ocurrió un error al agregar el autor: " . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Datos incompletos."]);
}

$conn->close();
?>