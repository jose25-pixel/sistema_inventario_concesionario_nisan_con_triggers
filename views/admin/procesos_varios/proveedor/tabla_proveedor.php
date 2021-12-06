<style>
    td {
        text-align: center;
        vertical-align: middle;
    }
</style>
<table class="table table-bordered table-resposive-md table-sm table-responsive-sm">

    <thead>
        <tr>
            <th>N°</th>
            <th>Código</th>
            <th>Nombre Marca</th>

            <th>Imagen</th>
            <th colspan="2">Procesos</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($DataCategorias as $result) : ?>
            <tr>
                <td><?php echo $cont += 1; ?></td>
                <td><?php echo $result['id_marca'] ?></td>
                <td><?php echo $result['nombre_marca'] ?></td>

                <td><img src="../../public/img/<?php echo $result['img_marca']?>" width="70px" alt=""></td></td>
                <td><a href="" class="btn btn-success edit-proveedores" id-proveedor="<?php echo $result['id_marca'] ?>">
                        <i class="fas fa-edit"></i>
                    </a></td>
                <td>
                    <a href="" class="btn btn-danger del-proveedor" id-proveedor="<?php echo $result['id_marca'] ?>">
                        <i class="fas fa-trash-alt"></i>
                    </a>
                </td>
            </tr>
        <?php endforeach ?>
    </tbody>

</table>