<?php
session_start();
if (!isset($_SESSION['id_usuario']) || $_SESSION['rol'] !== 'usuario') {
    header('Location: login.php');
    exit;
}

$nombre = $_SESSION['nombre_usuario'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Usuario</title>
</head>
<body>
    <h1>Bienvenido, Usuario: <?php echo htmlspecialchars($nombre); ?></h1>
    <p>Este es el panel de control para los usuarios.</p>
    <a href="logout.php">Cerrar sesión</a>
</body>
</html>
