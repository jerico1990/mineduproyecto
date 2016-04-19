<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Iniciar sesión';
?>
<br>
<div class="col-md-4" style="position: absolute;
        left: 0;
        right: 0;
        margin-left: auto;
        margin-right: auto;">
    <div class="panel panel-default" >
        <div class="panel-heading">Ingresa a tu cuenta</div>
        <div class="panel-body">
            <?= \app\widgets\login\LoginWidget::widget(['tipo'=>2]); ?>
        </div>
    </div>
</div>

