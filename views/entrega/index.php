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

<button class="btn" type="button" id="btnprimeraentrega" <?= ($proyectoCopia || ($etapa->etapa==2))?'disabled':'' ?>>Cerrar primera entrega</button>

<button class="btn" type="button" id="btnsegundaentrega" <?= ($proyectoCopia || ($etapa->etapa==2))?'':'disabled' ?>>Cerrar segunda entrega</button>


<?php if($proyectoCopia){?>
<?= \app\widgets\proyecto\ProyectoPrimeraEntregaWidget::widget(); ?>
<?php }?>


<?php 
    $finalizarprimerentrega= Yii::$app->getUrlManager()->createUrl('proyecto/finalizarprimeraentrega');
?>
<script>
    
    $('#btnprimeraentrega').click(function(event){
        var actividad=<?= $actividades ?>;
        var cronograma=<?= $cronogramas ?>;
        var planepresupuestales=<?= $planepresupuestales ?>;
        var asuntosprivados='<?= $errorasuntoprivado ?>';
        var asuntospublicos='<?= $errorasuntopublico ?>';
        var reflexion="<?= $errorreflexion?>";
        var video=<?= $video ?>;
        
        var error='';
        
        if (actividad<1) {
            error='Debe ingresar mínimo una actividad <br>'+error;
        }
        if (cronograma<1) {
            error='Debe ingresar mínimo un cronograma <br>'+error;
        }
        if (video<1) {
            error='Debe ingresar el video del proyecto <br>'+error;
        }
        if (planepresupuestales<1) {
            error='Debe ingresar mínimo un plan presupuestal <br>'+error;
        }
        if (asuntosprivados!='') {
            error=asuntosprivados+error;
            //error='Debe ingresar mínimo 1 comentario en Foro de "Asuntos Públicos" <br>'+error;
        }
        if (asuntospublicos!='') {
            error=asuntospublicos+error;
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
            $.ajax({
                url: '<?= $finalizarprimerentrega ?>',
                type: 'POST',
                async: true,
                data: {'Proyecto[id]':<?= $proyecto->id ?>},
                success: function(data){
                    if (data==1) {
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
                        setTimeout(function(){
                                        window.location.reload(1);
                                    }, 2000);   
                    }
                    
                }
            });
            /*
            if (finalizar.responseText==1) {
                
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
                setTimeout(function(){
                                window.location.reload(1);
                            }, 2000);
            }*/
            return true;
        }
        /*
        */
       
    });
</script>