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
                select 1 tipo,integrante.equipo_id,integrante.id,estudiante.nombres_apellidos,integrante.estudiante_id,integrante.rol,integrante.estado from integrante
                inner join estudiante on integrante.estudiante_id=estudiante.id
                where integrante.equipo_id=".$integrante->equipo_id." and integrante.estado in (1,2)
                union
                select 2 tipo,invitacion.equipo_id,invitacion.id,estudiante.nombres_apellidos,estudiante.id,0,6 from invitacion
                inner join estudiante on invitacion.estudiante_invitado_id=estudiante.id
                where invitacion.equipo_id=".$integrante->equipo_id." and invitacion.estado=1
               ");
    $equipoeinvitaciones = $command->queryAll();
}
$btninscribir=$integrante
?>

<?php if(!$integrante) { ?>
    
    <h1>Mis invitaciones</h1>
    <table class="table">
        <thead>
            <th>Nombre del equipo</th>
            <th>Lider del equipo</th>
            <th>Nombre de escuela</th>
            <th></th>
            <th></th>
        </thead>
        <tbody>
        <?php
        foreach($invitaciones as $invitacion)
        {
            echo "<tr>
                    <td>$invitacion->descripcion_equipo</td>
                    <td>$invitacion->nombres_apellidos</td>
                    <td>$invitacion->denominacion</td>
                    <td><button class='btn' onclick='unirme($invitacion->id)'>aceptar invitación</button></td>
                    <td><button class='btn' onclick='rechazar($invitacion->id)'>cancelar invitación</button></td>
                    </tr>";
        }
        ?>
        </tbody>
    </table>
<?php } ?>

<?php if($integrante){ ?>
<h1>Mi equipo</h1>
<table class="table ">
    <thead>
        <th>N°</th>
        <th>apellidos y nombres</th>
        <th>estado</th>
        <th>acción</th>
    </thead>
    <tbody>
<?php
    $i=1;
        foreach($equipoeinvitaciones as $equipoeinvitacion)
        {
            echo    "<tr>
                        <td>$i</td>
                        <td>".$equipoeinvitacion['nombres_apellidos']."</td>";
                        
            if($integrante->rol==1)
            {
                if($equipoeinvitacion['rol']==1)
                {
                    echo    "<td>Lider</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estado']==1)
                {
                    echo    "<td>Integrante</td>
                            <td><button class='btn' onclick='eliminarintegrante(".$equipoeinvitacion['estudiante_id'].")'>retirar integrante</button></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estado']==2)
                {
                    echo    "<td>Integrante</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==0)
                {
                    echo    "<td>invitado</td>
                            <td><button class='btn' onclick='eliminarinvitado(".$equipoeinvitacion['estudiante_id'].",".$equipoeinvitacion['equipo_id'].")'>cancelar invitación</button></td>";
                }
            }
            elseif($integrante->rol==2)
            {
                if($equipoeinvitacion['rol']==1)
                {
                    echo    "<td>Lider</td>
                            <td></td>";
                }
                elseif($equipoeinvitacion['rol']==2 && $equipoeinvitacion['estudiante_id']==$integrante->estudiante_id && $equipoeinvitacion['estado']==1)
                {
                    echo    "<td>Integrante</td>
                            <td><button class='btn' onclick='dejarequipo(".$equipoeinvitacion['estudiante_id'].")'>Retirarme del equipo</button></td>";
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

    <?php if($integrante->rol==1) {?>
    
    <?php } elseif($integrante->rol==2) { ?>
    
    <?php } ?>
<?php } ?>



<?php /*if($integrante && !$lider){ ?>
    <h1>Equipo</h1>
    <table class="table ">
        <thead>
            <th>N°</th>
            <th>apellidos y nombres</th>
            <!--<th>Retirarme</th>-->
        </thead>
        <tbody>
    <?php
        $i=1;
        if($integrante)
        {
            foreach($integrantes as $integ)
            {
                echo    "<tr>
                            <td>$i</td>
                            <td>".$integ->nombres_apellidos."</td>";
                /*if($integ->estudiante_id==$integrante->estudiante_id)
                {
                    echo    "<td><button class='btn' onclick='dejarequipo($integ->estudiante_id)'>retirarme</button></td>";
                }
                else
                {
                    echo    "<td></td>";
                }
                echo    "</tr>";
                $i++;
            }
        }
    ?>
        </tbody>
    </table>
    
    <button class='btn' onclick='dejarequipo(<?= $integrante->estudiante_id ?>)'>Retirarme del equipo</button>
<?php }*/ ?>
<?php /*
    <h1>Invitaciones</h1>
    <table class="table">
        <thead>
            <th>Nombre del invitado</th>
            <th>Eliminar invitacion</th>
        </thead>
        <tbody>
    <?php
        $invitados=Invitacion::find()
                            ->select('invitacion.id,estudiante.nombres_apellidos')
                            ->innerJoin('estudiante','invitacion.estudiante_invitado_id=estudiante.id')
                            ->where('invitacion.estudiante_id=:lider and invitacion.estado=1',
                                    [':lider'=>$lider->estudiante_id])
                            ->all();
                            
        foreach($invitados as $invitado)
        {
            echo "<tr>
                    <td>$invitado->nombres_apellidos</td>
                    <td><button class='btn' onclick='eliminarinvitado($invitado->id)'>eliminar</button></td>
                    </tr>";
        }
    ?>
        </tbody>
    </table>
<?php }  */ ?>







<?php /*
<h1>Equipo</h1>
<table class="table ">
    <thead>
        <th>N°</th>
        <th>apellidos y nombres</th>
    </thead>
    <tbody>
<?php
    $i=1;
    if($integrante)
    {
        foreach($integrantes as $integ)
        {
            echo    "<tr>
                        <td>$i</td>
                        <td>".$integ->estudiante->nombres_apellidos."</td>";
            
            echo    "</tr>";
            $i++;
        }
    }
?>
    </tbody>
</table>



<?php }  */ ?>

<?php //= Html::a('Dejar equipo',['#'],['class'=>'btn btn-primary','onclick'=>'dejarequipo('.$estudiante->id.')']);?>





 
<p></p>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Inscribir a mi equipo</h3>
    </div>
    <div class="panel-body">
        asdasd asd adas dasdasd adad asdas dasd ad asds
    </div>
</div>


<?php
if(!$integrante)
{
echo Html::a('Crear equipo',['inscripcion/index'],['class'=>'btn btn-primary']);
}
if( $integrante && $integrante->rol==1 && $integrante->estado==1)
{
echo Html::a('Actualizar equipo',['inscripcion/actualizar','id'=>$estudiante->id],['class'=>'btn btn-primary']);
echo " <button class='btn' onclick='dejarequipo(".$estudiante->id.")'>Cancelar equipo</button>";
echo " <button class='btn' onclick='finalizarequipo(".$integrante->equipo_id.")'>Finalizar equipo</button>";
}
elseif($integrante && $integrante->rol==1 && $integrante->estado==2)
{
    
}
?>





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
                    message: 'Oe ya ps, no te meches con el lider, ya te elimino XD! :v' 
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
                            message: 'Gracias se ha unido al equipo lalal :v :3 -.-!! o.O :D ' 
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
                message: 'Ha rechazado la invitacion porque ahhh , dime pues ps porq Grr -.-!! o.O :D , no se baya joven :v' 
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
                            message: 'Porque nos dejas :( , somos un equipo recuerdanos :\'(' 
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
                message: 'Que malo, lo ilusionas con una invitacion ahora lo eliminas, mal amigo :v :3' 
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
            if (data==2) {
                $.notify({
                    // options
                    message: 'No tiene la cantidad suficiente para finalizar el equipo, deben ser 6 integrantes' 
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
            else if (data==1) {
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
            
            setTimeout(function(){
                window.location.reload(1);
            }, 2000);
        }
    });
}
</script>