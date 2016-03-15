<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\PreForumPost */

$this->title = 'Create Pre Forum Post';
$this->params['breadcrumbs'][] = ['label' => 'Pre Forum Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pre-forum-post-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
