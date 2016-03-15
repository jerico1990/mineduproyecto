<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PreForumPost */

$this->title = 'Update Pre Forum Post: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Pre Forum Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="pre-forum-post-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
