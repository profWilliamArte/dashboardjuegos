<?php

require_once('../../util/core.php');
require_once('../../config/conexion.php');

// Obtener el ID del autor desde la URL
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Obtener los datos JSON de la solicitud
$data = json_decode(file_get_contents("php://input"));

// Validar los datos
if (isset($data->idtipousuario) && isset($data->nombre) && isset($data->correo) && isset($data->clave)) {
    $idtipousuario = $data->idtipousuario;
    $nombre = $data->nombre;
    $correo = $data->correo;
    $clave = $data->clave;
    $fecha = date('Y/m/d'); // Puedes usar la fecha actual o dejarla como está

    // Preparar la consulta SQL para actualizar el autor
    $sql = "UPDATE autor SET idtipousuario = ?, nombre = ?, correo = ?, clave = ?, fecha = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die(json_encode(["success" => false, "message" => "Error en la preparación de la consulta: " . $conn->error]));
    }

    // Asegúrate de que el número de parámetros coincida con los placeholders
    $stmt->bind_param("issssi", $idtipousuario, $nombre, $correo, $clave, $fecha, $id);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Autor actualizado exitosamente."]);
    } else {
        echo json_encode(["success" => false, "message" => "Ocurrió un error al actualizar el autor: " . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Datos incompletos."]);
}

$conn->close();
?>