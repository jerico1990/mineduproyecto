<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\web\JsExpression;
?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<br>
<div class="col-md-4 col-lg-4 col-xs-12"></div>
<div class="col-md-4 col-lg-4 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading">Acciones</div>
        <div class="panel-body text-center">
            <div class="clearfix"></div>
            <button class="btn btn-success" id="cerrarvoto" <?= $resutaldos?'disabled':'' ?>>cerrar votación</button>
            <div class="clearfix"></div><p></p>
            <button class="btn  btn-success" id="cerrar1entrega" <?= $etapa?'disabled':'' ?> >cerrar 1era entrega</button>
        </div>
    </div>
</div>


<?php
    $cerrarprimeraentrega= Yii::$app->getUrlManager()->createUrl('proyecto/cerrarprimeraentrega');
    $this->registerJs(
    "$('document').ready(function(){
        
    });");
?>

<script>
    $( '#cerrarvoto' ).click(function() {
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
                    setTimeout(function(){
                                window.location.reload(1);
                            }, 2000);
                }
            }
        });
    });
    
    $('#cerrar1entrega').click(function(events){
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
        
        
    });
</script>