<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\web\JsExpression;
$disabled=false;
if($votacionpublica || $etapa->etapa!=3)
{
    $disabled=true;
}
?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<br>
<div class="col-md-4 col-lg-4 col-xs-12"></div>
<div class="col-md-4 col-lg-4 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading">Acciones</div>
        <div class="panel-body text-center">
            <div class="clearfix"></div>
            <button class="btn btn-raised btn-success" id="cerrarvoto" <?= $resultados?'disabled':'' ?>>cerrar votación</button>
            <div class="clearfix"></div><p></p>
            <button class="btn btn-raised btn-success" id="cerrar1entrega" <?= ($etapa->etapa!=1 || !$resultados)?'disabled':'' ?> >cerrar 1era entrega</button>
            <div class="clearfix"></div><p></p>
            <button class="btn btn-raised btn-success" id="cerrar2entrega" <?= ($etapa->etapa!=2)?'disabled':'' ?> >cerrar 2da entrega</button>
            <div class="clearfix"></div><p></p>
            <?= Html::a('Votación interna',['votacioninterna'],['class'=>'btn btn-raised btn-success','disabled'=>$disabled]); ?>
            <div class="clearfix"></div><p></p>
            <button class="btn btn-raised btn-success" id="cerrarvotacioninterna" <?= ($votacionpublica || $etapa->etapa!=3)?'disabled':'' ?> >cerrar votación interna</button>
        </div>
    </div>
</div>


<?php
    $cerrarprimeraentrega= Yii::$app->getUrlManager()->createUrl('proyecto/cerrarprimeraentrega');
    $cerrarsegundaentrega= Yii::$app->getUrlManager()->createUrl('proyecto/cerrarsegundaentrega');
    $cerrarvotacioninterna= Yii::$app->getUrlManager()->createUrl('proyecto/cerrarvotacioninterna');
?>

<script>
    $( '#cerrarvoto' ).click(function() {
        var countvoto=<?= $countVoto ?>;
        if (countvoto==0) {
            $.notify({
                // options
                message: 'Deberia registrar mínimo 3 votos' 
            },{
                // settings
                type: 'danger',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });
            return false;
        }
        $.ajax({
            url: 'cerrar',
            //dataType: 'json',
            type: 'GET',
            async: true,
            data: {bandera:1},
            success: function(data){
                if(data==1)
                {
                    $.notify({
                        // options
                        message: 'Se ha cerrado la votación correctamente' 
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
                if(data==2)
                {
                    $.notify({
                        // options
                        message: 'Ya ha cerrado la votación, gracias' 
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
        return true;
    });
    
    $('#cerrar1entrega').click(function(events){
        var countvoto=<?= $countVoto ?>;
        if (countvoto==0) {
            $.notify({
                // options
                message: 'Deberia cerrar votación' 
            },{
                // settings
                type: 'danger',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });
            return false;
        }
        
        var finalizar=$.ajax({
            url: '<?= $cerrarprimeraentrega ?>',
            type: 'POST',
            async: false,
            success: function(data){
                
            }
        });
        
        if(finalizar.responseText==1)
        {
            $.notify({
                message: 'Se ha cerrado el proceso de 1ra entrega' 
            },{
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
        if(finalizar.responseText==2)
        {
            $.notify({
                message: 'Para cerrar debe tener mínimo un equipo finalizado' 
            },{
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
        if(finalizar.responseText==3)
        {
            $.notify({
                message: 'Ya se ha cerrado el proceso de 1ra entrega' 
            },{
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
        
        return true;
    });
    
    
    $('#cerrar2entrega').click(function(events){
        var finalizar=$.ajax({
            url: '<?= $cerrarsegundaentrega ?>',
            type: 'POST',
            async: false,
            success: function(data){
                
            }
        });
        
        if(finalizar.responseText==1)
        {
            $.notify({
                message: 'Se ha cerrado el proceso de 2da entrega' 
            },{
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
        if(finalizar.responseText==2)
        {
            $.notify({
                message: 'Ningun proyecto ha cerrado su segunda entrega' 
            },{
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
        if(finalizar.responseText==3)
        {
            $.notify({
                message: 'Ya se ha cerrado el proceso de 2da entrega' 
            },{
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
    
    $('#cerrarvotacioninterna').click(function(events){
        var faltavalorporcentual=<?= $faltavalorporcentual ?>;
        if (faltavalorporcentual>0) {
            $.notify({
                message: 'Falta ingresa valor en algunos proyectos' 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        
        $.ajax({
            url: '<?= $cerrarvotacioninterna ?>',
            type: 'POST',
            async: true,
            success: function(data){
                setTimeout(function(){
                                window.location.reload(1);
                            }, 2000);
            }
        });
        
        
        return true;
    });
    
</script>