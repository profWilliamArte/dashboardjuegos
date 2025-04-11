<?php
require_once __DIR__ . '/../../../config/cors.php';
require_once __DIR__ . '/../../../config/db.php';
header('Content-Type: application/json');
try {
    $stmt = $pdo->query("SELECT * FROM generos ORDER BY nombre");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Error en el servidor']);
}
/*

require_once __DIR__ . '/../../../config/cors.php';
Descripción : Incluye el archivo cors.php desde la ruta especificada.

require_once: Asegura que el archivo se incluya solo una vez, evitando errores si se intenta cargar múltiples veces.
__DIR__: Es una constante mágica que devuelve la ruta absoluta del directorio actual del archivo.
/../../../config/cors.php: Especifica la ruta relativa al archivo cors.php, que generalmente configura las políticas de CORS (Cross-Origin Resource Sharing) para permitir solicitudes desde diferentes dominios.



require_once __DIR__ . '/../../../config/db.php';
Descripción : Incluye el archivo db.php desde la ruta especificada.

Este archivo suele contener la configuración de la conexión a la base de datos (por ejemplo, credenciales y la inicialización del objeto $pdo).
$pdo: Es un objeto de la clase PDO que representa la conexión a la base de datos.


header('Content-Type: application/json');
Descripción : Establece el encabezado HTTP Content-Type para indicar que la respuesta será en formato JSON.

application/json: Especifica que el contenido devuelto por el servidor es un objeto JSON.
Esto es importante para que los clientes (como aplicaciones frontend o herramientas como Postman) interpreten correctamente la respuesta.


try {
Descripción : Inicia un bloque try para manejar excepciones.

El código dentro de este bloque se ejecuta normalmente, pero si ocurre un error (excepción), el control pasa al bloque catch.


$stmt = $pdo->query("SELECT * FROM generos ORDER BY nombre");
Descripción : Ejecuta una consulta SQL directamente en la base de datos.

$pdo->query(): Ejecuta una consulta SQL sin parámetros dinámicos.
"SELECT * FROM generos ORDER BY nombre": Consulta que selecciona todos los registros de la tabla generos y los ordena alfabéticamente por el campo nombre.
$stmt: Almacena el resultado de la consulta en un objeto de tipo PDOStatement.

echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
Descripción : Convierte los resultados de la consulta a formato JSON y los envía como respuesta.

$stmt->fetchAll(PDO::FETCH_ASSOC): Obtiene todos los
registros de la consulta como un array asociativo (las columnas son las claves y los valores son los datos).
json_encode(): Convierte el array asociativo a una cadena JSON.
echo: Envía la cadena JSON como respuesta al cliente.

} catch (Exception $e) {
Descripción : Captura cualquier excepción que ocurra dentro del bloque try.

Exception $e: Representa el objeto de la excepción que contiene información sobre el error.

http_response_code(500);
Descripción : Establece el código de estado HTTP de la respuesta a 500 (Internal Server Error).

Esto indica que ocurrió un error en el servidor.

echo json_encode(['error' => 'Error en el servidor']);
Descripción : Envía una respuesta JSON con un mensaje de error genérico.

['error' => 'Error en el servidor']: Crea un array asociativo con un mensaje de error.
json_encode(): Convierte el array a formato JSON.
echo: Envía el JSON como respuesta al cliente.

}
Descripción : Cierra el bloque catch.




Resumen del flujo del código
Configuración inicial :
Se incluyen archivos necesarios (cors.php y db.php) para configurar CORS y la conexión a la base de datos.
Se establece el encabezado HTTP para indicar que la respuesta será JSON.
Consulta a la base de datos :
Se ejecuta una consulta SQL para obtener todos los registros de la tabla generos, ordenados por el campo nombre.
Los resultados se convierten a JSON y se envían como respuesta.
Manejo de errores :
Si ocurre un error durante la ejecución (por ejemplo, problemas con la base de datos), se captura la excepción, se establece un código de estado HTTP 500 y se devuelve un mensaje de error en formato JSON.


Conclusión
Este código es un ejemplo mínimo de un endpoint PHP que interactúa con una base de datos y devuelve resultados en formato JSON. Aunque es funcional, carece de validaciones y buenas prácticas necesarias para entornos de producción. Para proyectos reales, siempre debes agregar manejo de errores más robusto, validaciones y seguridad adicional.
*/