<?php

// Función para generar el arreglo de rutas automáticamente
function generateRoutes($baseDir, $basePath = '/api') {
    $routes = [];

    // Escanear recursivamente la carpeta base
    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($baseDir, RecursiveDirectoryIterator::SKIP_DOTS),
        RecursiveIteratorIterator::SELF_FIRST
    );

    foreach ($iterator as $file) {
        if ($file->isFile() && $file->getExtension() === 'php') {
            // Obtener la ruta relativa del archivo respecto a $baseDir
            $relativePath = substr($file->getPathname(), strlen($baseDir));
            $relativePath = str_replace(DIRECTORY_SEPARATOR, '/', $relativePath); // Normalizar barras

            // Construir la ruta de la API
            $route = $basePath . $relativePath;

            // Eliminar la extensión .php de la ruta
            $route = preg_replace('/\.php$/', '', $route);

            // Calcular la ruta relativa del archivo respecto a __DIR__
            $relativeFilePath = str_replace(__DIR__, '', $file->getPathname());
            $relativeFilePath = str_replace(DIRECTORY_SEPARATOR, '/', $relativeFilePath); // Normalizar barras
            $relativeFilePath = ltrim($relativeFilePath, '/'); // Eliminar la barra inicial si existe

            // Agregar la ruta al arreglo
            $routes[$route] = $relativeFilePath;
        }
    }

    return $routes;
}

// Configuración inicial
$baseDir = __DIR__ . '/api'; // Carpeta base donde están los archivos de endpoints
$basePath = '/api'; // Prefijo para las rutas de la API

// Generar el arreglo de rutas
$routes = generateRoutes($baseDir, $basePath);

// Imprimir el arreglo generado en un formato limpio (texto plano)
echo "<?php <br/><br/>";
echo "\$routes = [<br/>";
foreach ($routes as $route => $filePath) {
    echo "    '$route' => '$filePath',<br/>"; // Usar \n para saltos de línea en texto plano
}
echo "];\n";