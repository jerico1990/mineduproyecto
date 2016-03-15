<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use app\models\Asunto;

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
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="proyectoxs<?= $asunto->id ?>c">Save changes</button>
            </div>
        </div>
    </div>
</div>

<?php } ?>
