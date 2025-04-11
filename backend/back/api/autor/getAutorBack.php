<?php
require_once('../../util/core.php');
require_once('../../config/conexion.php');
// Consulta para obtener autores
$sql = "SELECT autor.id, autor.idestatus, autor.idestatus, autor.nombre as nombre,correo,clave,fecha, estatus.nombre as estatus, idtipousuario,tipousuario.nombre as tipousuario FROM `autor` INNER JOIN estatus on autor.idestatus=estatus.id INNER JOIN tipousuario on autor.idtipousuario=tipousuario.id;";

$result = $conn->query($sql);

$autores = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $autores[] = $row;
    }
}

echo json_encode($autores);
$conn->close();
?>