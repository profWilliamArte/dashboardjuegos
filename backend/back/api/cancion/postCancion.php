<?php
// Función para corregir la URL de YouTube
function corregirUrlYoutube($url) {
    // Verificar si la URL es válida
    if (!filter_var($url, FILTER_VALIDATE_URL)) {
        return null; // Retornar null si la URL no es válida
    }

    // Usar parse_url para descomponer la URL
    $parsedUrl = parse_url($url);
    
    // Verificar si el esquema es 'https' o 'http' y el host es 'www.youtube.com' o 'youtube.com'
    if (isset($parsedUrl['host']) && (strpos($parsedUrl['host'], 'youtube.com') !== false || strpos($parsedUrl['host'], 'youtu.be') !== false)) {
        // Extraer la parte de la consulta
        if (isset($parsedUrl['query'])) {
            parse_str($parsedUrl['query'], $query);
            // Retornar la URL hasta el primer '&'
            return $parsedUrl['scheme'] . '://' . $parsedUrl['host'] . $parsedUrl['path'] . '?v=' . ($query['v'] ?? '');
        } else {
            // Si no hay query, retornar la URL original
            return $url;
        }
    }

    return null; // Retornar null si no es una URL de YouTube
}

// Conexión a la base de datos
require_once('../../util/core.php');
require_once('../../config/conexion.php');

$idautor    = htmlspecialchars(trim($_POST['idautor']));
$idgenero   = htmlspecialchars(trim($_POST['idgenero']));
$url        = filter_var(trim($_POST['url']), FILTER_SANITIZE_URL);
$interprete  = htmlspecialchars(trim($_POST['interprete']));
$titulo     = htmlspecialchars(trim($_POST['titulo']));

// Corregir la URL de YouTube
$url = corregirUrlYoutube($url);
if ($url === null) {
    die(json_encode(["success" => false, "message" => "URL no válida o no es de YouTube."]));
}

// Eliminar apóstrofes
$interprete = str_replace("'", "", $interprete);
$titulo     = str_replace("'", "", $titulo);

// Decodificar entidades HTML
$idautor    = html_entity_decode($idautor);
$idgenero   = html_entity_decode($idgenero);
$interprete  = html_entity_decode($interprete);
$titulo     = html_entity_decode($titulo);

// Validar la URL
if (!filter_var($url, FILTER_VALIDATE_URL)) {
    die(json_encode(["success" => false, "message" => "URL no válida."]));
}

// Extraer el ID del video de la URL
parse_str(parse_url($url, PHP_URL_QUERY), $query);
$video_id = $query['v'] ?? null; // Obtener el ID del video

// Verificar que se haya obtenido un ID de video
if ($video_id) {
    $coverImage = "https://img.youtube.com/vi/$video_id/hqdefault.jpg";
} else {
    $coverImage = null; 
}

// Preparar y ejecutar la consulta
$sql = "INSERT INTO canciones (idautor, idgenero, interprete, titulo, url, coverImage) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);

if ($stmt === false) {
    die(json_encode(["success" => false, "message" => "Error en la preparación de la consulta: " . $conn->error]));
}

$stmt->bind_param("iissss", $idautor, $idgenero, $interprete, $titulo, $url, $coverImage);

if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Nueva canción agregada exitosamente."]);
} else {
    error_log("Error al agregar canción: " . $stmt->error);
    echo json_encode(["success" => false, "message" => "Ocurrió un error al agregar la canción."]);
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>