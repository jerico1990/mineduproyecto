<?php

use yii\helpers\Html;
use app\models\PreForumBoard;

/* @var $this yii\web\View */
/* @var $model app\modules\forum\models\Forum */


?>
<br>
    <h1>
        <?= Html::encode($model->forum_desc) ?>
    </h1>
    
    <?= \app\widgets\proyecto\ProyectoSegundaEntregaWidget::widget(); ?>

<div class="clearfix"></div>
<?php /*
<!--
<div class="col-xs-12 col-sm-12 col-md-12">
    <?php if ($model->boardCount > 1): ?>
        <?= $this->render('_boards',[
            'forum' => $model,
            'boards' => $model->boards,
        ]); ?>
    <?php elseif ($model->boardCount == 1 && $model->boards[0]->parent_id != PreForumBoard::AS_CATEGORY): ?>
        <?= $this->render('/pre-forum-board/view', [
                    'model'=>$model->boards[0], 
                    'newThread'=>$newThread,
                ]
            );
        ?>
    <?php else: ?>
        <div class="jumbotron">
            <h2><?= Yii::t('app', 'No board!'); ?></h2>
            <?php if (Yii::$app->user->id == $model->user_id) : ?>
                <?= Html::a(Yii::t('app', 'Add a board'), ['/pre-forum/update', 'id' => $model->forum_url, 'action' => 'board'], ['class' => 'btn btn-success']) ?>
            <?php endif; ?>
        </div>
    <?php endif; ?>
</div>
-->

*/ ?>
