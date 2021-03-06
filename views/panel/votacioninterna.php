<?php
use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Ubigeo;
use app\models\Proyecto;
use app\models\VotacionInterna;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $model app\models\ProyectoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<?php Pjax::begin(); ?>
<?php $form = ActiveForm::begin([
        'action' => ['votacioninterna'],
        'method' => 'get',
    ]); ?>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group field-votacion_interna_search-region_id required">
            <label class="control-label" for="votacion_interna_search-region_id">Región: *</label>
            <select id="votacion_interna_search-region_id" class="form-control" name="VotacionInternaSearch[region_id]" >
                <option value>Seleccionar</option>
                <?php foreach(Ubigeo::find()->select('department_id,department')->groupBy('department')->all() as $departamento){ ?>
                    <option value="<?= $departamento->department_id ?>" <?= ($searchModel->region_id==$departamento->department_id)?'selected':'' ?>><?= $departamento->department ?></option>
                <?php } ?>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group field-votacion_interna_search-titulo required">
            <label class="control-label" for="votacion_interna_search-titulo">Proyecto: *</label>
            <input type="text" name="VotacionInternaSearch[titulo]" class="form-control" value="<?= $searchModel->titulo?>">
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
            'voto',
            [
                'label'=>'Valor %',
                //'attribute' => 'codigo_modular',
                'format'=>'raw',
                'value'=>function($data) {
                    return "<input type='number'  onfocusout='grabado_automatico($(this),".$data->id.",".$data->voto.")' class='form-group' maxlength=3 value='".$data->valor."'>";
                },
            ],
            [
                'label'=>'Resultado',
                //'attribute' => 'codigo_modular',
                'format'=>'raw',
                'value'=>function($data) {
                    return "<div id='proyecto_".$data->id."'> ".(double)$data->resultado."</div>";
                },
            ],
            
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
<?php
    $valoraporcentualadministrador= Yii::$app->getUrlManager()->createUrl('proyecto/valoraporcentualadministrador');
?>
<script type="application/x-javascript">

function grabado_automatico(element,proyecto_id,voto) {
    console.log(element.val());
    var resultado=((voto*100)/<?= $countInterna->maximo ?>)*0.7+element.val()*0.3;
    if (element.val()<0 || element.val()>100) {
        $.notify({
            message: 'Debe estar en el intervalo de 1 a 100' 
        },{
            type: 'danger',
            z_index: 1000000,
            placement: {
                from: 'bottom',
                align: 'right'
            },
        });
        element.val('');
        return false;
    }
    
    $.ajax({
        url: '<?= $valoraporcentualadministrador ?>',
        type: 'GET',
        async: true,
        data: {proyecto_id:proyecto_id,valor:element.val(),resultatotal:resultado},
        success: function(data){
            
            
            $('#proyecto_'+proyecto_id).html(resultado);
            if(data==1)
            {   
                $.notify({
                    // options
                    message: 'Se ha registrado el valor' 
                },{
                    // settings
                    type: 'success',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                });
                
            }
        }
    });
    
    return true;
}

</script>