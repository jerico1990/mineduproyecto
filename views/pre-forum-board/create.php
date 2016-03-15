<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\PreForumBoard */

$this->title = 'Create Pre Forum Board';
$this->params['breadcrumbs'][] = ['label' => 'Pre Forum Boards', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pre-forum-board-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
