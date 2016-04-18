<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ForoComentario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="foro-comentario-form">

    <?php $form = ActiveForm::begin(); ?>

   
        <textarea name="ForoComentario[contenido]" class="textarea" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid rgb(221, 221, 221); padding: 10px; " ></textarea>
    
    <?= Html::submitButton(Yii::t('app', 'Comentar'), ['class' => 'btn btn-success']) ?>

    <?php ActiveForm::end(); ?>

</div>
