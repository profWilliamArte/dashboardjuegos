<?php
require_once('../../util/core.php');
require_once('../../config/conexion.php');
// Consulta para obtener autores
$sql = "SELECT id, nombre FROM generos order by nombre";
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