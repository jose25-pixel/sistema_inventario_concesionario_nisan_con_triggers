<?php
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
    $queryCate = "SELECT vehiculo.id_producto as id_producto, vehiculo.descripcion, vehiculo.precio_venta,vehiculo.modelo,vehiculo.imagen FROM inventarios INNER JOIN vehiculo ON inventarios.id_vehiculo=vehiculo.id_producto WHERE inventarios.stock > 0 AND inventarios.estado=1 AND vehiculo.modelo LIKE '%$valor%'";
} else {
    $queryCate = "SELECT vehiculo.id_producto as id_producto, vehiculo.descripcion,vehiculo.precio_venta, vehiculo.modelo,vehiculo.imagen FROM inventarios INNER JOIN vehiculo ON inventarios.id_vehiculo=vehiculo.id_producto WHERE inventarios.stock > 0 AND inventarios.estado=1 LIMIT $inicio, $registros";
}

$DataProducto = SelectData($queryCate, "i");
$num_registro = NumReg($query);
$paginas = ceil($num_registro / $registros);
