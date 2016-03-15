<?php

use yii\helpers\Html;
use app\models\PreForumBoard;

/* @var $this yii\web\View */
/* @var $model app\modules\forum\models\Forum */

$this->title = $model->forum_name;
$this->registerMetaTag(['name' => 'keywords', 'content' => $model->forum_name]);
$this->registerMetaTag(['name' => 'description', 'content' => $model->forum_desc]);
$this->params['forum'] = $model->toArray;

?>
<br>
<div class="col-xs-12 col-sm-4 col-md-4">
    <?php /*= \app\widgets\login\Login::widget([
        'title' => Yii::t('app', 'Log in'),
        'visible' => Yii::$app->user->isGuest
    ]);*/ ?>
    <h1>
        <?= Html::encode($model->forum_desc) ?>
    </h1>
</div>
<div class="clearfix"></div>
<div class="col-xs-12 col-sm-8 col-md-8">
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

