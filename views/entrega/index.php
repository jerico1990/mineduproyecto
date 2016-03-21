<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Resultados;
use yii\widgets\Pjax;
use yii\web\JsExpression;

/* @var $this \yii\web\View */
/* @var $user \common\models\LoginForm */
/* @var $title string */

?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<button type="button" id="btnprimeraentrega">Cerrar primera entrega</button>

<?php 
    $finalizarprimerentrega= Yii::$app->getUrlManager()->createUrl('proyecto/finalizarprimeraentrega');
?>
<script>
    
    $('#btnprimeraentrega').click(function(event){
        var actividad=<?= $actividades ?>;
        var cronograma=<?= $cronogramas ?>;
        var planepresupuestales=<?= $planepresupuestales ?>;
        var forums1025=<?= $forums1025 ?>;
        var forums1028=<?= $forums1028 ?>;
        var reflexion="<?= $errorreflexion?>";
        var error='';
        
        if (actividad<1) {
            error='Debe ingresar mínimo una actividad <br>'+error;
        }
        if (cronograma<1) {
            error='Debe ingresar mínimo un cronograma <br>'+error;
        }
        if (planepresupuestales<1) {
            error='Debe ingresar mínimo un plan presupuestal <br>'+error;
        }
        if (forums1025<1) {
            error='Debe ingresar mínimo 1 comentario en Foro de "Foro de Prueba" <br>'+error;
        }
        if (forums1028<1) {
            error='Debe ingresar mínimo 1 comentario en Foro de "Foro 3" <br>'+error;
        }
        
        if (reflexion!='') {
            error=reflexion+error;
        }
        
        if (error!='') {
            $.notify({
                message: error 
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
        else
        {
            var finalizar=$.ajax({
                url: '<?= $finalizarprimerentrega ?>',
                type: 'POST',
                async: false,
                data: {'Proyecto[id]':<?= $proyecto->id ?>},
                success: function(data){
                    
                }
            });
            
            if (finalizar.responseText==1) {
                $.notify({
                    message: 'Gracias se ha cerrado la 1era entrega' 
                },{
                    type: 'success',
                    z_index: 1000000,
                    placement: {
                        from: 'bottom',
                        align: 'right'
                    },
                }); 
            }
            if (finalizar.responseText==2)
            {
                $.notify({
                    message: 'Ya se ha cerrado la 1era entrega' 
                },{
                    type: 'danger',
                    z_index: 1000000,
                    placement: {
                        from: 'bottom',
                        align: 'right'
                    },
                }); 
            }
            return true;
        }
        /*
        */
       
    });
</script>