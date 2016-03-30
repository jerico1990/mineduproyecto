<?php
use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Ubigeo;
use app\models\Proyecto;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $model app\models\ProyectoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<?php Pjax::begin(); ?>
<?php $form = ActiveForm::begin([
        'action' => ['buscar'],
        'method' => 'get',
    ]); ?>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group field-voto-proyecto required">
            <label class="control-label" for="proyecto-region">Región: *</label>
            <select id="proyecto-region" class="form-control" name="ProyectoSearch[region]" >
                <option value>Seleccionar</option>
                <?php foreach(Ubigeo::find()->select('department_id,department')->groupBy('department')->all() as $departamento){ ?>
                    <option value="<?= $departamento->department_id ?>"><?= $departamento->department ?></option>
                <?php } ?>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group field-proyecto-titulo required">
            <label class="control-label" for="proyecto-titulo">Proyecto: *</label>
            <input type="text" name="ProyectoSearch[titulo]" class="form-control">
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <?= Html::submitButton('Buscar', ['class' => 'btn btn-primary']) ?>
        </div>
    </div>
<?php ActiveForm::end(); ?>
<?php Pjax::end(); ?>
<div class="col-md-6">
    <?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
    
            'titulo',
            
    
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {like}',
                'buttons' => [
                    'view' => function ($url,$model,$key) {
                        return Html::a('<span class="glyphicon glyphicon-edit" ></span>',['pre-forum/ver?id='.$model->forum_url],[]);
                    },
                    'like' => function ($url,$model,$key) {
                        return Html::a('<span class="glyphicon glyphicon-thumbs-up" style="color:green"></span>',['pre-forum/ver?id='.$model->forum_url],[]);
                    }
                ],
            ]
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>