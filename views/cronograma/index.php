<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CronogramaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cronogramas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cronograma-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Cronograma', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'actividad_id',
            'fecha_inicio',
            'fecha_fin',
            'duracion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
