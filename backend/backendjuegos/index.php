<?php
require_once __DIR__ . '/config/cors.php';

$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$requestMethod = $_SERVER['REQUEST_METHOD'];

// Definir las rutas
$routes = [
    // Rutas de generos
    '/api/generos/delete' => 'api/generos/delete.php',
    '/api/generos/get/index' => 'api/generos/get/index.php',
    '/api/generos/get/maximo' => 'api/generos/get/maximo.php',
    '/api/generos/get/minimo' => 'api/generos/get/minimo.php',
    '/api/generos/get/ordenar' => 'api/generos/get/ordenar.php',
    '/api/generos/get/porestatus' => 'api/generos/get/porestatus.php',
    '/api/generos/get/porid' => 'api/generos/get/porid.php',
    '/api/generos/post' => 'api/generos/post.php',
    '/api/generos/put' => 'api/generos/put.php',

    // Rutas de juegos
    '/api/juegos/delete' => 'api/juegos/delete.php',
    '/api/juegos/get/buscarjuego' => 'api/juegos/get/buscarjuego.php',
    '/api/juegos/get/index' => 'api/juegos/get/index.php',
    '/api/juegos/get/mejorvalorados' => 'api/juegos/get/mejorvalorados.php',
    '/api/juegos/get/paginado' => 'api/juegos/get/paginado.php',
    '/api/juegos/get/porgenero' => 'api/juegos/get/porgenero.php',
    '/api/juegos/post' => 'api/juegos/post.php',
    '/api/juegos/put' => 'api/juegos/put.php',
    ];

if (array_key_exists($requestUri, $routes)) {
    require_once __DIR__ . '/' . $routes[$requestUri];
} else {
    http_response_code(404);
    echo json_encode(['error' => 'Ruta no encontrada']);
}
?>

