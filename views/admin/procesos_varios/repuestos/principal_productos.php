<head>
    <script src="../../public/js/funciones-productos.js"></script>
</head>


<?php
session_start();
include_once "../../../../models/conexion.php";
include_once "../../../../models/procesos.php";
include_once "../../../../controllers/procesos.php";


$cont = 0;
$pagina = 0;

if (isset($_GET['num'])) {
    $pagina = $_GET['num'];
}
//Definir el numero de registross
if (isset($_GET['n_reg']) || isset($_GET['num'])) {
    $registros = $_GET['num_reg'];
} else {
    $registros = 3;
}

//Definir el inicio a la pagina a mostrar
if (!$pagina) {
    $inicio = 0;
    $pagina = 1;
} else {
    $inicio = ($pagina - 1) * $registros;
}
$query = "SELECT * FROM vehiculo"; //Total de registro para paginado

if (isset($_GET['like'])) {
    $valor = $_GET['valor'];
    $queryCate = "SELECT * FROM vehiculo WHERE modelo LIKE '%$valor%'";
} else {
    $queryCate = "SELECT * FROM vehiculo ORDER BY id_producto LIMIT $inicio, $registros";
}

$DataCategorias = SelectData($queryCate, "i");
$num_registro = NumReg($query);
$paginas = ceil($num_registro / $registros);


?>
    <?php include "select_y_buscador.php" ?>
<?php if ($DataCategorias) : ?>
    
    <?php include "tabla_productos.php"?>
    <?php include "boton_next_back.php" ?>
<?php else : ?>
    <div class="alert alert-danger">
        No se encuentran datos
    </div>
<?php endif ?>