<?php

require_once('../../util/core.php');
require_once('../../config/conexion.php');
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$data = json_decode(file_get_contents("php://input"));

if (isset($data->nombre)) {
    $nombre = $data->nombre;
    $sql = "UPDATE generos SET nombre = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die(json_encode(["success" => false, "message" => "Error en la preparación de la consulta: " . $conn->error]));
    }   
    $stmt->bind_param("si",  $nombre, $id);
    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Genero actualizado exitosamente."]);
    } else {
        echo json_encode(["success" => false, "message" => "Ocurrió un error al actualizar el genero: " . $stmt->error]);
    }
    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Datos incompletos."]);
}
$conn->close();
?>