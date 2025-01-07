<?php
session_start();

$host = 'localhost';
$dbname = 'liceo';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error al conectar a la base de datos: " . $e->getMessage());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre_usuario = $_POST['username'];
    $contrasena = $_POST['password'];

    $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE username = :username");
    $stmt->execute(['username' => $nombre_usuario]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuario && md5($contrasena) == $usuario['password']) {
        // Guardar datos en sesión
        $_SESSION['id_usuario'] = $usuario['id'];
        $_SESSION['nombre_usuario'] = $usuario['username'];
        $_SESSION['rol'] = $usuario['role'];

        // Redirigir al dashboard correspondiente
        if ($usuario['role'] === 'coordinador') {
            header('Location: coordinador_dashboard.php');
        } else {
            header('Location: usuario_dashboard.php');
        }
        exit();
    } else {
        echo "Nombre de usuario o contraseña incorrectos.";
    }
}
?>