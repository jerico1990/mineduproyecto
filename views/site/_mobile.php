<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use app\models\Asunto;
use app\models\Resultados;

$resultados=Resultados::find()->all();
?>

<?php
    $asuntos=Asunto::find()->all();
    foreach($asuntos as $asunto)
    {
?>

<div class="modal fade" id="myModalAsunto<?= $asunto->id ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><?= $asunto->descripcion_cabecera ?></h4>
            </div>
            <div class="modal-body">
                <?= $asunto->descripcion_larga ?>
            </div>
            <?php if(!$resultados){ ?>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="proyecto<?= $asunto->id ?>c">Guardar</button>
            </div>
            <?php } ?>
        </div>
    </div>
</div>


<?php } ?>
