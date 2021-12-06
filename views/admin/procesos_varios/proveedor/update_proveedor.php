<?php
    session_start();
    include "../../../../models/conexion.php";
    include "../../../../models/procesos.php";
    include "../../../../controllers/procesos.php";

    $id = $_POST['id'];

    $imgFile= $_FILES['img']['name'];
    $img_dir = $_FILES['img']['tmp_name'];
    $imgSize = $_FILES['img']['size'];

    $marcaedit = $_POST['marcaedit'];


    $carpeta = "proveedor/".$marcaedit."/"; //Ruta de almacenamiento de imagen
    $path = "../../../../public/img/".$carpeta; //Ruta completa de almacenamiento
    $imgExpot = strtolower(pathinfo($imgFile,PATHINFO_EXTENSION));
    $newName = $marcaedit.".".$imgExpot;
    $cargar_img = CargarIMG($img_dir,$imgSize,$newName,$path);

    if($imgSize == 0){

        //$tabla = "marca";
        //$campos = "`nombre_marca`='$marcaedit'";
          $sql = "call modificar_marca('$marcaedit','$id')";
        //$sql = "UPDATE marca SET $campos WHERE id_marca='$id'";
        $result = U_I_D($sql);

        if($result){
            echo '<script>
                $(document).ready(function(event){
                    alertify.success("Marca Actualizado y imagen no actualizado...");
                    $("#contenido-procesos").load("procesos_varios/proveedor/principal_proveedor.php");
                })
            </script>';
        }else{
            echo '<script>
                $(document).ready(function(event){
                    alertify.success("Marca no Actualizado...");
                    $("#contenido-procesos").load("procesos_varios/proveedor/principal_proveedor.php");
                })
            </script>';
        }
    }else{
        $img = $carpeta.$newName;
        $tabla = "marca";
        $campos = "`nombre_marca`='$marcaedit',`img_marca`='$img'";
        $sql = "UPDATE $tabla SET $campos WHERE id_marca='$id'";
        $result = U_I_D($sql);

        if($result){
            echo '<script>
                $(document).ready(function(event){
                    alertify.success("Marcas todos los campos  Actualizado...");
                    $("#contenido-procesos").load("procesos_varios/proveedor/principal_proveedor.php");
                })
            </script>';
        }else{
            echo '<script>
                $(document).ready(function(event){
                    alertify.success("Marcas
                     no Actualizado...");
                    $("#contenido-procesos").load("procesos_varios/proveedor/principal_proveedor.php");
                })
            </script>';
        }
    }
?>