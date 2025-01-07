<?php
ini_set('memory_limit', '512M'); // Aumenta el límite de memoria a 512 MB

require_once './db_connect.php'; // Ajusta la ruta al archivo de conexión

// Crear Estudiante
function crearEstudiante($conn, $per_est, $con_est, $enf_est, $pla_est, $rel_est, $her_est, $cur_est, $pes_est, $alt_est, $tcm_est, $tpn_est, $tzp_est, $bec_est, $can_est, $tbl_est, $equ_est, $hab_est, $sec_est) {
    $sql = "INSERT INTO estudiante (per_est, con_est, enf_est, pla_est, rel_est, her_est, cur_est, pes_est, alt_est, tcm_est, tpn_est, tzp_est, bec_est, can_est, tbl_est, equ_est, hab_est, sec_est) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isssiiisdsdissssii", $per_est, $con_est, $enf_est, $pla_est, $rel_est, $her_est, $cur_est, $pes_est, $alt_est, $tcm_est, $tpn_est, $tzp_est, $bec_est, $can_est, $tbl_est, $equ_est, $hab_est, $sec_est);
    return $stmt->execute();
}

// Leer Estudiante
function leerEstudiante($conn, $idd_est) {
    $sql = "SELECT * FROM estudiante WHERE idd_est = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $idd_est);
    $stmt->execute();
    return $stmt->get_result()->fetch_assoc();
}

// Actualizar Estudiante
function actualizarEstudiante($conn, $idd_est, $per_est, $con_est, $enf_est, $pla_est, $rel_est, $her_est, $cur_est, $pes_est, $alt_est, $tcm_est, $tpn_est, $tzp_est, $bec_est, $can_est, $tbl_est, $equ_est, $hab_est, $sec_est) {
    $sql = "UPDATE estudiante SET per_est = ?, con_est = ?, enf_est = ?, pla_est = ?, rel_est = ?, her_est = ?, cur_est = ?, pes_est = ?, alt_est = ?, tcm_est = ?, tpn_est = ?, tzp_est = ?, bec_est = ?, can_est = ?, tbl_est = ?, equ_est = ?, hab_est = ?, sec_est = ? WHERE idd_est = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isssiiisdsdissssiii", $per_est, $con_est, $enf_est, $pla_est, $rel_est, $her_est, $cur_est, $pes_est, $alt_est, $tcm_est, $tpn_est, $tzp_est, $bec_est, $can_est, $tbl_est, $equ_est, $hab_est, $sec_est, $idd_est);
    return $stmt->execute();
}

// Eliminar Estudiante
function eliminarEstudiante($conn, $idd_est) {
    $sql = "DELETE FROM estudiante WHERE idd_est = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $idd_est);
    return $stmt->execute();
}

// Manejar las solicitudes POST para crear, actualizar y eliminar estudiantes
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['crear'])) {
        crearEstudiante($conn, $_POST['per_est'], $_POST['con_est'], $_POST['enf_est'], $_POST['pla_est'], $_POST['rel_est'], $_POST['her_est'], $_POST['cur_est'], $_POST['pes_est'], $_POST['alt_est'], $_POST['tcm_est'], $_POST['tpn_est'], $_POST['tzp_est'], $_POST['bec_est'], $_POST['can_est'], $_POST['tbl_est'], $_POST['equ_est'], $_POST['hab_est'], $_POST['sec_est']);
    } elseif (isset($_POST['actualizar'])) {
        actualizarEstudiante($conn, $_POST['idd_est'], $_POST['per_est'], $_POST['con_est'], $_POST['enf_est'], $_POST['pla_est'], $_POST['rel_est'], $_POST['her_est'], $_POST['cur_est'], $_POST['pes_est'], $_POST['alt_est'], $_POST['tcm_est'], $_POST['tpn_est'], $_POST['tzp_est'], $_POST['bec_est'], $_POST['can_est'], $_POST['tbl_est'], $_POST['equ_est'], $_POST['hab_est'], $_POST['sec_est']);
    } elseif (isset($_POST['eliminar'])) {
        eliminarEstudiante($conn, $_POST['idd_est']);
    }
}

// Obtener todos los estudiantes para mostrarlos en la tabla
$result = $conn->query("SELECT * FROM estudiante");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Estudiantes</title>
</head>
<body>
    <h1>Gestión de Estudiantes</h1>
    <form method="POST" action="">
        <input type="hidden" name="idd_est" value="">
        <label for="per_est">Persona:</label>
        <input type="text" name="per_est" required>
        <label for="con_est">Condición:</label>
        <input type="text" name="con_est" required>
        <label for="enf_est">Enfermedad:</label>
        <input type="text" name="enf_est">
        <label for="pla_est">Plan:</label>
        <input type="text" name="pla_est" required>
        <label for="rel_est">Religión:</label>
        <input type="text" name="rel_est">
        <label for="her_est">Hermanos:</label>
        <input type="text" name="her_est">
        <label for="cur_est">Curso:</label>
        <input type="text" name="cur_est">
        <label for="pes_est">Peso:</label>
        <input type="text" name="pes_est">
        <label for="alt_est">Altura:</label>
        <input type="text" name="alt_est">
        <label for="tcm_est">Talla Camisa:</label>
        <input type="text" name="tcm_est">
        <label for="tpn_est">Talla Pantalón:</label>
        <input type="text" name="tpn_est">
        <label for="tzp_est">Talla Zapatos:</label>
        <input type="text" name="tzp_est">
        <label for="bec_est">Beca:</label>
        <input type="text" name="bec_est">
        <label for="can_est">Canaima:</label>
        <input type="text" name="can_est">
        <label for="tbl_est">Tablet:</label>
        <input type="text" name="tbl_est">
        <label for="equ_est">Equipo:</label>
        <input type="text" name="equ_est">
        <label for="hab_est">Habilidad:</label>
        <input type="text" name="hab_est" required>
        <label for="sec_est">Sección:</label>
        <input type="text" name="sec_est">
        <button type="submit" name="crear">Crear</button>
        <button type="submit" name="actualizar">Actualizar</button>
        <button type="submit" name="eliminar">Eliminar</button>
    </form>

    <h2>Lista de Estudiantes</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Persona</th>
            <th>Condición</th>
            <th>Enfermedad</th>
            <th>Plan</th>
            <th>Religión</th>
            <th>Hermanos</th>
            <th>Curso</th>
            <th>Peso</th>
            <th>Altura</th>
            <th>Talla Camisa</th>
            <th>Talla Pantalón</th>
            <th>Talla Zapatos</th>
            <th>Beca</th>
            <th>Canaima</th>
            <th>Tablet</th>
            <th>Equipo</th>
            <th>Habilidad</th>
            <th>Sección</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['idd_est']; ?></td>
            <td><?php echo $row['per_est']; ?></td>
            <td><?php echo $row['con_est']; ?></td>
            <td><?php echo $row['enf_est']; ?></td>
            <td><?php echo $row['pla_est']; ?></td>
            <td><?php echo $row['rel_est']; ?></td>
            <td><?php echo $row['her_est']; ?></td>
            <td><?php echo $row['cur_est']; ?></td>
            <td><?php echo $row['pes_est']; ?></td>
            <td><?php echo $row['alt_est']; ?></td>
            <td><?php echo $row['tcm_est']; ?></td>
            <td><?php echo $row['tpn_est']; ?></td>
            <td><?php echo $row['tzp_est']; ?></td>
            <td><?php echo $row['bec_est']; ?></td>
            <td><?php echo $row['can_est']; ?></td>
            <td><?php echo $row['tbl_est']; ?></td>
            <td><?php echo $row['equ_est']; ?></td>
            <td><?php echo $row['hab_est']; ?></td>
            <td><?php echo $row['sec_est']; ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>