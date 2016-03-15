<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PreForumBoard */

$this->title = 'Update Pre Forum Board: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Pre Forum Boards', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="pre-forum-board-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
