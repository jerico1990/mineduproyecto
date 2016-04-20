<?php

use yii\helpers\Html;
use app\models\Integrante;
use app\models\Invitacion;

if($integrante)
{
    $integrantes=Integrante::find()
                ->select('integrante.id,estudiante.nombres_apellidos,integrante.estudiante_id,integrante.rol')
                ->innerJoin('estudiante','integrante.estudiante_id=estudiante.id')
                ->where('integrante.equipo_id=:equipo_id and integrante.estado=1',[':equipo_id'=>$integrante->equipo_id])
                ->all();
                
    $connection = \Yii::$app->db;
    $command=$connection->createCommand("
                SELECT AA.tipo,AA.equipo_id,AA.id,AA.nombres_apellidos,AA.nombres,AA.apellido_paterno,AA.apellido_materno,
                AA.estudiante_id,AA.rol,AA.estado
                FROM
                (
                select 1 tipo,integrante.equipo_id,integrante.id,estudiante.nombres_apellidos,estudiante.nombres,estudiante.apellido_paterno,estudiante.apellido_materno,
                integrante.estudiante_id,integrante.rol,integrante.estado from integrante
                inner join estudiante on integrante.estudiante_id=estudiante.id
                where integrante.equipo_id=".$integrante->equipo_id." and integrante.estado in (1,2)
                union
                select 2 tipo,invitacion.equipo_id,invitacion.id,estudiante.nombres_apellidos,estudiante.nombres,estudiante.apellido_paterno,estudiante.apellido_materno,
                estudiante.id,0,6 from invitacion
                inner join estudiante on invitacion.estudiante_invitado_id=estudiante.id
                where invitacion.equipo_id=".$integrante->equipo_id." and invitacion.estado=1
                ) AA
                ORDER BY AA.ROL ASC
                
               ");
    $equipoeinvitaciones = $command->queryAll();
}
$btninscribir=$integrante
?>

<?php if(!$integrante) { ?>
    <h1><b>Mi equipo</b></h1>
    <?php if(!$invitaciones){ ?>
    <p class="text-center">No tienes invitaciones activas de otros equipos,</p>
    <p class="text-center">te invitamos a ser el coordinador de un equipo.</p>
    <?php } else { ?>
    <p class="text-center">Haz recibido invitaciones para ser parte de otros equipos,</p>
    <p class="text-center">revisalas y confirma tu participacion</p>
    <div class="col-xs-12 col-md-3"></div>
    <div class="col-xs-12 col-md-6">
        <table class="table table-striped table-hover">
            <thead>
                <th>Equipo</th>
                <th>Coordinador</th>
                <th></th>
                <th></th>
            </thead>
            <tbody>
            <?php
            foreach($invitaciones as $invitacion)
            {
                echo "<tr>
                        <td>$invitacion->descripcion_equipo</td>
                        <td><div class='row-picture'>
                    <img class='circle' src='../../web/foto_personal/".$invitacion->avatar."' alt='icon' style='height: 30px;width: 30px'>
                    ".$invitacion->nombres." ".$invitacion->apellido_paterno."".$invitacion->apellido_materno."
                  </div> </td>
                        <td class='text-center'><div style='color:green;font-size:24px;cursor:pointer'  class='fa  fa-check-circle-o fa-6' onclick='unirme($invitacion->id)'></div></td>
                        <td class='text-center'><div style='color:red;font-size:24px;cursor:pointer'  class='fa fa-times-circle-o fa-6' onclick='rechazar($invitacion->id)'></div></td>
                        </tr>";
            }
            ?>
            </tbody>
        </table>
        <hr>
    </div>
    
    <div class="clearfix"></div>
    
    <p class="text-center">Si no te gusta ninguno de los equipos, puedes crear tu propio equipo</p>
    
    <?php } ?>
    
    
    
<?php } ?>

<?php if($integrante){ ?>
<h1><b>Mi equipo</b></h1>
<div class="col-xs-12 col-sm-3 col-md-3"></div>
<div class="col-xs-12 col-sm-4 col-md-4">
    <h4 style="padding-bottom: 5px"><label>Nombre de tu equipo:</label> </h4>
    <p class="text-justify" style="font-size: 20px;padding-bottom: 5px"><?= $equipo->descripcion_equipo ?></p>
    <h4 style="padding-bottom: 5px"><label>Descripción de tu equipo:</label>  </h4>
    <p class="text-justify" style="padding-bottom: 5px"><?= $equipo->descripcion ?></p>
    <h4 style="padding-bottom: 5px"><label>Asunto público:</label>  </h4>
    <p class="text-justify" style="padding-bottom: 5px"><?= $equipo->asunto->descripcion_cabecera ?></p>
</div>
<div class="col-xs-12 col-sm-2 col-md-2">
    <?= Html::img('../foto_equipo/'.$equipo->foto,['id'=>'img_destino','class'=>'img-responsive logo', 'alt'=>'Responsive image','style'=>"height: 158px;width: 158px"]) ?>
</div>
<div class="clearfix"></div>
<div class="col-xs-12 col-sm-3 col-md-3"></div>
<div class="col-xs-12 col-sm-6 col-md-6">
<label style="padding-bottom: 5px">Los miembros de mi equipo:</label>
<?php //if($equipo->estado==0){ ?>
<table class="table table-striped table-hover ">
    <thead>
        <th>Nombres y Apellidos</th>
        <th>Estado</th>
        <?php if($equipo->estado==0){ ?>
        <th class='text-center'></th>
        <?php } ?>
    </thead>
    <tbody>
<?php
    $i=1;
        foreach($equipoeinvitaciones as $equipoeinvitacion)
        {
            echo    "<tr>
                        <td>".$equipoeinvitacion['nombres']." ".$equipoeinvitacion['apellido_paterno']." ".$equipoeinvitacion['apellido_materno']."</td>";
                        
            if($integrante->rol==1)
            {
                if($equipoeinvitacion['rol']==1)
                {
                    echo    "<td>Coordinador</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estado']==1)
                {
                    echo    "<td>Integrante</td>
                            <td class='text-center'><div style='color:red;font-size:24px;cursor:pointer'  class='fa fa-times-circle-o fa-6' onclick='eliminarintegrante(".$equipoeinvitacion['estudiante_id'].")'></div></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estado']==2)
                {
                    echo    "<td>Integrante</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==0)
                {
                    echo    "<td>invitado</td>
                            <td class='text-center'><div style='color:red;font-size:24px;cursor:pointer'  class='fa fa-times-circle-o fa-6' onclick='eliminarinvitado(".$equipoeinvitacion['estudiante_id'].",".$equipoeinvitacion['equipo_id'].")'></div></td>";
                }
            }
            elseif($integrante->rol==2)
            {
                if($equipoeinvitacion['rol']==1)
                {
                    echo    "<td>Coordinador</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estudiante_id']==$integrante->estudiante_id && $equipoeinvitacion['estado']==1)
                {
                    echo    "<td>Integrante</td>
                            <td class='text-center'><div style='color:red;font-size:24px;cursor:pointer'  class='fa fa-times-circle-o fa-6' onclick='dejarequipo(".$equipoeinvitacion['estudiante_id'].")'></div></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estudiante_id']==$integrante->estudiante_id&& $equipoeinvitacion['estado']==2)
                {
                    echo    "<td>Integrante</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estudiante_id']!=$integrante->estudiante_id)
                {
                    echo    "<td>Integrante</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==0)
                {
                    echo    "<td>invitado</td>
                            <td></td>";
                }
            }
            
            echo    "</tr>";
            $i++;
        }
?>
    </tbody>
</table>
<?php /*} elseif($equipo->estado==1) {?>
    <?php
    $i=1;
        foreach($equipoeinvitaciones as $equipoeinvitacion)
        {
            
            $i++;
        }
    ?>
<?php }*/ ?>
</div>
<div class="clearfix"></div>
<?php } ?>
<?php if(!$equipo->descripcion_equipo){?>
<?php }?>

<div class="text-center">
<?php
if(!$integrante)
{
    echo "<br>";
echo Html::a('Crea tu equipo',['inscripcion/index'],['class'=>'btn btn-raised btn-success']);
}
if( $integrante && $integrante->rol==1 && $integrante->estado==1)
{
echo Html::a('Actualizar equipo',['inscripcion/actualizar','id'=>$estudiante->id],['class'=>'btn btn-raised btn-success']);
echo " <button class='btn btn-raised btn-success' onclick='dejarequipo(".$estudiante->id.")'>Cancelar equipo</button>";
echo " <button class='btn btn-raised btn-success' onclick='finalizarequipo(".$integrante->equipo_id.")'>Finalizar equipo</button>";
}
?>
</div>


<?php
    $unirme= Yii::$app->getUrlManager()->createUrl('equipo/unirme');
    $validarunirme=Yii::$app->getUrlManager()->createUrl('equipo/validarunirme');
    $rechazar= Yii::$app->getUrlManager()->createUrl('equipo/rechazar');
    $dejarequipo= Yii::$app->getUrlManager()->createUrl('equipo/dejarequipo');
    $eliminarinvitado= Yii::$app->getUrlManager()->createUrl('equipo/eliminarinvitado');
    $eliminarintegrante= Yii::$app->getUrlManager()->createUrl('equipo/eliminarintegrante');
    $validarequipo= Yii::$app->getUrlManager()->createUrl('equipo/validarequipo');
    $finalizarequipo= Yii::$app->getUrlManager()->createUrl('equipo/finalizarequipo');
    
?>
<script>
function unirme(id) {
    var validarunirme=1;
    $.ajax({
        url: '<?php echo $validarunirme ?>',
        type: 'GET',
        async: true,
        data: {id:id},
        success: function(data){
            if (data==0) {
                $.notify({
                    // options
                    message: 'El lider te ha eliminado' 
                },{
                    // settings
                    type: 'danger',
                    z_index: 1000000,
                    placement: {
                        from: 'bottom',
                        align: 'right'
                    },
                });
                setTimeout(function(){
                    window.location.reload(1);
                }, 2000);
                validarunirme=0;
                console.log(validarunirme);
            }
            else
            {
                $.ajax({
                    url: '<?php echo $unirme ?>',
                    type: 'GET',
                    async: true,
                    data: {id:id},
                    success: function(data){
                        $.notify({
                            // options
                            message: 'Gracias se ha unido al equipo  ' 
                        },{
                            // settings
                            type: 'success',
                            z_index: 1000000,
                            placement: {
                                    from: 'bottom',
                                    align: 'right'
                            },
                        });
                        setTimeout(function(){
                            window.location.reload(1);
                        }, 2000);
                    }
                });
            }
            
        }
    });
    
    
}


function rechazar(id) {
    $.ajax({
        url: '<?php echo $rechazar ?>',
        type: 'GET',
        async: true,
        data: {id:id},
        success: function(data){
            $.notify({
                // options
                message: 'Ha rechazado la invitación' 
            },{
                // settings
                type: 'danger',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });
            setTimeout(function(){
                window.location.reload(1);
            }, 2000);
        }
    });
}

function dejarequipo(id) {
    
    $.ajax({
        url: '<?php echo $validarequipo ?>',
        type: 'GET',
        async: true,
        data: {id:id},
        success: function(data){
            if (data==1) {
                $.notify({
                    // options
                    message: 'Ya no pertenecs al equipo o el lider a eliminado el equipo' 
                },{
                    // settings
                    type: 'success',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                });
                setTimeout(function(){
                    window.location.reload(1);
                }, 2000);
            }
            else if (data==2)
            {
                $.ajax({
                    url: '<?php echo $dejarequipo ?>',
                    type: 'GET',
                    async: true,
                    data: {id:id},
                    success: function(data){
                        $.notify({
                            // options
                            message: 'Has dejado el equipo' 
                        },{
                            // settings
                            type: 'danger',
                            z_index: 1000000,
                            placement: {
                                    from: 'bottom',
                                    align: 'right'
                            },
                        });
                        setTimeout(function(){
                            window.location.reload(1);
                        }, 2000);
                    }
                });
            }
            else if (data==3) {
                $.notify({
                    // options
                    message: 'El lider del equipo ah finalizado el equipo, incluyendote' 
                },{
                    // settings
                    type: 'danger',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                });
                setTimeout(function(){
                    window.location.reload(1);
                }, 2000);
            }
            
        }
    });
    
    
}


function eliminarinvitado(id,equipo) {
    $.ajax({
        url: '<?php echo $eliminarinvitado ?>',
        type: 'GET',
        async: true,
        data: {id:id,equipo:equipo},
        success: function(data){
            $.notify({
                // options
                message: 'Invitación eliminada' 
            },{
                // settings
                type: 'success',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });
            setTimeout(function(){
                window.location.reload(1);
            }, 2000);
        }
    });
}

function eliminarintegrante(id) {
    $.ajax({
        url: '<?php echo $eliminarintegrante ?>',
        type: 'GET',
        async: true,
        data: {id:id},
        success: function(data){
            if (data==1) {
                $.notify({
                    // options
                    message: 'Has retirado al integrante' 
                },{
                    // settings
                    type: 'success',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                }); 
            }
            else if (data==2) {
                $.notify({
                    // options
                    message: 'El integrante se ha retirado' 
                },{
                    // settings
                    type: 'success',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                }); 
            }
            
            setTimeout(function(){
                window.location.reload(1);
            }, 2000);
        }
    });
}


function finalizarequipo(id) {
    $.ajax({
        url: '<?php echo $finalizarequipo ?>',
        type: 'GET',
        async: true,
        data: {id:id},
        success: function(data){
            if (data==1) {
                $.notify({
                    // options
                    message: 'Ha finalizado su equipo' 
                },{
                    // settings
                    type: 'success',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                });
            }
            else if (data==2) {
                
                $.notify({
                    // options
                    message: 'No tiene la cantidad suficiente para finalizar el equipo, deben ser 4 integrantes' 
                },{
                    // settings
                    type: 'danger',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                });
            }
            
            setTimeout(function(){
                window.location.reload(1);
            }, 2000);
        }
    });
}
</script>