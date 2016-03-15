<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PreForumSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Pre Forums';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pre-forum-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Pre Forum', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'forum_name',
            'forum_desc:ntext',
            'forum_url:url',
            'user_id',
            // 'created_at',
            // 'status',
            // 'forum_icon',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
