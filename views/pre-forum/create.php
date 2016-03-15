<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\PreForum */

$this->title = 'Create Pre Forum';
/*$this->params['breadcrumbs'][] = ['label' => 'Pre Forums', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;*/
?>
<div class="pre-forum-create">
<?= \Yii::$app->user->id ?>
    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
