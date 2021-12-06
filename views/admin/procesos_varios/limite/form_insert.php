<script src="../../public/js/funciones-navbar.js"></script>
<script src="../../public/js/funciones-limite-productos.js"></script>

<?php 
    session_start();
    include "../../../../models/conexion.php";
    include "../../../../models/procesos.php";
    include "../../../../controllers/procesos.php";

    $query = "SELECT vehiculo.modelo, vehiculo.id_producto FROM inventarios INNER JOIN vehiculo ON vehiculo.id_producto=inventarios.id_vehiculo WHERE inventarios.id_vehiculo NOT IN (SELECT id_vehiculo FROM limite_productos)";
    $data = SelectData($query,'i');
    
?>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <h3 style="text-align: center;">Registro Limite de Producto</h3>
        <hr>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Producto</span>
            </div>
            <select class="custom-select" id="id_producto" required="on">
                <option value="" selected="" disabled="">Seleccione Automovil</option>
                <?php foreach($data AS $result): ?>
                <option value="<?php echo $result['id_producto'] ?>"><?php echo $result['modelo'] ?></option>
                <?php endforeach; ?>
            </select>

        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">Limite</span>
            </div>
            <input type="number" name="user" id="limite-product" class="form-control" placeholder="Limite Producto" required="on" autocomplete="off" />

        </div>
        <div>
            <a class="btn btn-primary text-white" id="save-limite-prod"><i class="fas fa-save"></i> Guardar</a>
            <a class="btn btn-danger text-white limite"><i class="fas fa-ban"></i> Cancelar</a>
        </div>
    </div>
    <div class="col-md-3"></div>
</div>