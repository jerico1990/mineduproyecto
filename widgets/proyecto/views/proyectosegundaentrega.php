<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Resultados;
use yii\widgets\Pjax;
use yii\web\JsExpression;

/* @var $this \yii\web\View */
/* @var $user \common\models\LoginForm */
/* @var $title string */

?>

<?php $form = ActiveForm::begin(['options'=>['enctype'=>'multipart/form-data']]); ?>
<h2>Segundo Entregable</h2>
<hr class="colorgraph">
<div class="row">
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_11" data-toggle="tab" aria-expanded="false">Datos generales</a></li>
            <li class=""><a href="#tab_12" data-toggle="tab" aria-expanded="true">Resultado</a></li>
            <li class=""><a href="#tab_13" data-toggle="tab" aria-expanded="true">Presupuesto</a></li>
            <li class=""><a href="#tab_14" data-toggle="tab" aria-expanded="false">Cronograma</a></li>
            <li class=""><a href="#tab_15" data-toggle="tab" aria-expanded="false">Mi Video</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab_11">
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-titulo required">
                        <label class="control-label" for="proyecto-titulo" title="Máximo 10 palabras">Título: *</label>
                        <input type="text" id="proyecto-titulo" class="form-control" name="Proyecto[titulo]" placeholder="Título" maxlength="10" title="Máximo 10 palabras" value="<?= $proyecto->titulo ?>" <?= $disabled ?> >
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-resumen required">
                        <label class="control-label" for="proyecto-resumen" title="Mínimo 100 palabras">Resumen: *</label>
                        <textarea id="proyecto-resumen" class="form-control" name="Proyecto[resumen]" minlength="100" maxlength="2500" placeholder="Resumen" title="Mínimo 100 palabras" <?= $disabled ?>><?= $proyecto->resumen ?></textarea>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-beneficiario required">
                        <label class="control-label" for="proyecto-beneficiario">Beneficiario: *</label>
                        <textarea id="proyecto-beneficiario" class="form-control" name="Proyecto[beneficiario]"  placeholder="Beneficiario" <?= $disabled ?>><?= $proyecto->beneficiario ?></textarea>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <h3>Objetivos:</h3>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-objetivo_general required">
                        <label>General: </label> <span class="glyphicon glyphicon-plus-sign" data-toggle="modal" data-target="#objetivo_general"></span> <div style="display: inline" id="txt_objetivo_general" ><?= $proyecto->objetivo_general ?></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <h3>Especificos:</h3>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-objetivo_especifico_1 required">
                        <span class="glyphicon glyphicon-plus-sign field-proyecto-objetivo_especifico_1" data-toggle="modal" data-target="#objetivo_especifico_1"></span> <div style="display: inline" id="txt_objetivo_especifico_1"><?= $proyecto->objetivo_especifico_1 ?></div><br>
                        <div id="txt_actividades_objetivo_especifico_1">
                            <?php foreach($actividades as $actividad){ ?>
                                <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_1_id){?>
                                    <a href="../actividad/index?id=<?= $actividad->actividad_id ?>" target="_blank"><?= $actividad->descripcion ?></a>
                                    <br>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                 <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-objetivo_especifico_2 required">
                        <span class="glyphicon glyphicon-plus-sign field-proyecto-objetivo_especifico_2" data-toggle="modal" data-target="#objetivo_especifico_2"></span> <div style="display: inline" id="txt_objetivo_especifico_2"><?= $proyecto->objetivo_especifico_2 ?></div>
                        <div id="txt_actividades_objetivo_especifico_1">
                            <?php foreach($actividades as $actividad){ ?>
                                <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_2_id){?>
                                    <a href="../actividad/index?id=<?= $actividad->actividad_id ?>" target="_blank"><?= $actividad->descripcion ?></a>
                                    <br>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                 <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-objetivo_especifico_3 required">
                        <span class="glyphicon glyphicon-plus-sign field-proyecto-objetivo_especifico_3" data-toggle="modal" data-target="#objetivo_especifico_3"></span> <div style="display: inline" id="txt_objetivo_especifico_3"><?= $proyecto->objetivo_especifico_3 ?></div>
                        <div id="txt_actividades_objetivo_especifico_1">
                            <?php foreach($actividades as $actividad){ ?>
                                <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_3_id){?>
                                    <a href="../actividad/index?id=<?= $actividad->actividad_id ?>" target="_blank"><?= $actividad->descripcion ?></a>
                                    <br>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_12">
                <div class="clearfix"></div>
                <div class="col-xs-12 col-sm-8 col-md-8">
                    <table class="table">
                        <thead>
                        <th>Actividad</th>
                        <th>Resultado</th>
                        </thead>
                        <tbody>
                    <?php $i=0;?>
                    <?php foreach($actividades as $actividad){ ?>
                        <tr>
                            <td><?= $actividad->descripcion ?></td>
                            <td>
                                <div class="form-group field-proyecto-resultado_esperado_<?= $i ?> required">
                                    <input type="hidden"  class="form-control" name="Proyecto[resultados_ids][]" value="<?= $actividad->actividad_id ?>" >
                                    <input type="text" id="proyecto-resultado_esperado_<?= $i ?>" class="form-control" name="Proyecto[resultados_esperados][]" placeholder="Resultado #<?= $i ?>" value="<?= $actividad->resultado_esperado ?>" <?= $disabled ?> >
                                </div>
                            </td>
                        </tr>
                        
                    <?php $i++; } ?>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_13">
                <?= \app\widgets\planpresupuestal\PlanPresupuestalWidget::widget(['proyecto_id'=>$proyecto->id,'disabled'=>$disabled]); ?> 
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_14">
                <?= \app\widgets\cronograma\CronogramaWidget::widget(['proyecto_id'=>$proyecto->id,'disabled'=>$disabled]); ?> 
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_15">
                
                <?php if($videosegunda){ ?>
                
                <video width="320" height="240" controls>
                    <source src="<?= Yii::getAlias('@video').$videosegunda->ruta ?>" type="video/mp4">  
                </video>
                <br>
                <?php } ?>
                
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_16">
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-reflexion required">
                        <label class="control-label" for="proyecto-reflexion" >Reflexión: </label>
                        <textarea id="proyecto-reflexion" class="form-control" name="Proyecto[reflexion]"  placeholder="Reflexión" <?= ($equipo->etapa==1  || $equipo->etapa==2)?'disabled':''; ?>><?= $proyecto->reflexion?></textarea>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_17">
                <div class="clearfix"></div>
                <?php if($equipo->etapa==1 || $equipo->etapa==2){ ?>
                <div class="col-xs-12 col-sm-7 col-md-5">
                    <div class="form-group field-proyecto-evaluacion required">
                        <label class="control-label" for="proyecto-evaluacion" >Evaluación: </label>
                        <textarea id="proyecto-evaluacion" class="form-control" name="Proyecto[evaluacion]"  placeholder="Evaluación" <?= ($equipo->etapa==2)?'disabled':''; ?>><?= $proyecto->evaluacion?></textarea>
                    </div>
                </div>
                <?php } ?>
                <div class="clearfix"></div>
            </div><!-- /.tab-pane -->
        </div><!-- /.tab-content -->
    </div>
    
    
    
    
   
    <div class="clearfix"></div>
    
    <!-- Objetivo General -->
    <div class="modal fade" id="objetivo_general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="z-index: 2000 !important">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group field-proyecto-objetivo_general required">
                        <label class="control-label" for="proyecto-objetivo_general" title="Máximo 30 palabras">Objetivo General: *</label>
                        <textarea id="proyecto-objetivo_general" class="form-control" name="Proyecto[objetivo_general]"  maxlength="30" placeholder="Objetivo General" title="Máximo 30 palabras" <?= $disabled ?>><?= $proyecto->objetivo_general ?></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <?php if($disabled==''){ ?>
                    <!--<button type="button" id="btn_objetivo_general" class="btn btn-primary" data-dismiss="modal">Guardar</button>-->
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Objetivo Especifico 1 -->
    <div class="modal fade" id="objetivo_especifico_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="z-index: 2000 !important">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_1 required">
                            <label class="control-label" for="proyecto-objetivo_especifico_1" title="Máximo 30 palabras">Objetivo especifico 1: *</label>
                            <input type="hidden" name="Proyecto[objetivo_especifico_1_id]" value="<?= $proyecto->objetivo_especifico_1_id ?>" >
                            <textarea id="proyecto-objetivo_especifico_1" class="form-control" name="Proyecto[objetivo_especifico_1]"   placeholder="Objetivo especifico 1" <?= $disabled ?>><?= $proyecto->objetivo_especifico_1 ?></textarea>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <table class="table table-bordered table-hover" id="tab_logic_1">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                        #
                                    </th>
                                    <th class="text-center">
                                        Actividad
                                    </th>
                                    <?php if($disabled==''){ ?>
                                    <th>
                                    </th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i=0; ?>
                                <?php if($actividades1){ ?>
                                <?php foreach($actividades1 as $actividad){ ?>
                                    <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_1_id){ ?>
                                    <tr id='addr_1_<?= $i ?>'>
                                        <td>
                                        <?= ($i+1) ?>
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo1_<?= $i ?> required">
                                                
                                                <input type="text" id="proyecto-actividad_objetivo1_<?= $i ?>" class="form-control" name="Proyecto[actividades_1][]" placeholder="Actividad" value="<?= $actividad->descripcion ?>" <?= $disabled ?>/>
                                            </div>
                                        </td>
                                        <?php if($disabled==''){ ?>
                                        <td>
                                            <span class="remCF glyphicon glyphicon-minus-sign" value="<?= $actividad->actividad_id ?>">
                                                <input type="hidden" name="Proyecto[actividades_ids_1][]" placeholder="Actividad" value="<?= $actividad->actividad_id ?>" <?= $disabled ?>/>
                                            </span>
                                        </td>
                                        <?php }?>
                                    </tr>
                                    
                                    <?php $i++; ?>
                                    <?php }?>
                                <?php } ?>
                                <?php } else { ?>
                                    <tr id='addr_1_0'>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo1_0 required">
                                                
                                                <input type="text" id="proyecto-actividad_objetivo1_0" class="form-control" name="Proyecto[actividades_1][]" placeholder="Actividad" />
                                            </div>
                                        </td>
                                        <td>
                                            <span class="remCF glyphicon glyphicon-minus-sign">
                                            </span>
                                        </td>
                                    </tr>
                                <?php } ?>
                                <tr id='addr_1_<?= $i ?>'></tr>
                            </tbody>
                        </table>
                        <?php if($disabled==''){ ?>
                        <div id="add_row_1" class="btn btn-default pull-left" value="1">Agregar</div>
                        <?php }?>
                        <br>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <?php if($disabled==''){ ?>
                    <button type="button" id="btn_objetivo_especifico_1" class="btn btn-primary" data-dismiss="modal">Guardar</button>
                    <?php }?>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Objetivo Especifico 2 -->
    <div class="modal fade" id="objetivo_especifico_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="z-index: 2000 !important">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_2 required">
                            <label class="control-label" for="proyecto-objetivo_especifico_2" title="Máximo 30 palabras">Objetivo especifico 2: *</label>
                            <input type="hidden" name="Proyecto[objetivo_especifico_2_id]" value="<?= $proyecto->objetivo_especifico_2_id ?>">
                            <textarea id="proyecto-objetivo_especifico_2" class="form-control" name="Proyecto[objetivo_especifico_2]"  placeholder="Objetivo especifico 2" <?= $disabled ?>><?= $proyecto->objetivo_especifico_2 ?></textarea>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <table class="table table-bordered table-hover" id="tab_logic_2">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                        #
                                    </th>
                                    <th class="text-center">
                                        Actividad
                                    </th>
                                    <?php if($disabled==''){ ?>
                                    <th>
                                    </th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $a=0; ?>
                                <?php if($actividades2){ ?>
                                <?php foreach($actividades2 as $actividad){?>
                                    <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_2_id){ ?>
                                    <tr id='addr_2_<?= $a ?>'>
                                        <td>
                                        <?= ($a+1) ?>
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo2_<?= $a ?> required">
                                                
                                                <input type="text" id="proyecto-actividad_objetivo2_<?= $a ?>" class="form-control" name="Proyecto[actividades_2][]" placeholder="Actividad" value="<?= $actividad->descripcion ?>" <?= $disabled ?>/>
                                            </div>
                                        </td>
                                        <?php if($disabled==''){ ?>
                                        <td>
                                            <span class="remCF glyphicon glyphicon-minus-sign">
                                                <input type="hidden" name="Proyecto[actividades_ids_2][]" placeholder="Actividad" value="<?= $actividad->actividad_id ?>"/>
                                            </span>
                                        </td>
                                        <?php } ?>
                                    </tr>
                                    <?php $a++; ?>
                                    <?php } ?>
                                <?php } ?>
                                <?php } else { ?>
                                    <tr id='addr_2_0'>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo2_0 required">
                                                <input type="text" id="proyecto-actividad_objetivo2_0" class="form-control" name="Proyecto[actividades_2][]" placeholder="Actividad" />
                                            </div>
                                        </td>
                                        <td>
                                            <span class="remCF glyphicon glyphicon-minus-sign"></span>
                                        </td>
                                    </tr>
                                <?php } ?>
                                <tr id='addr_2_<?= $a ?>'></tr>
                            </tbody>
                        </table>
                        <?php if($disabled==''){ ?>
                        <div id="add_row_2" class="btn btn-default pull-left" value="1">Agregar</div>
                        <?php } ?>
                        <br>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <?php if($disabled==''){ ?>
                    <button type="button" id="btn_objetivo_especifico_2" class="btn btn-primary" data-dismiss="modal">Guardar</button>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <!-- Objetivo Especifico 3 -->
    <div class="modal fade" id="objetivo_especifico_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="z-index: 2000 !important">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_3 required">
                            <label class="control-label" for="proyecto-objetivo_especifico_3" title="Máximo 30 palabras">Objetivo especifico 3: *</label>
                            <input type="hidden" name="Proyecto[objetivo_especifico_3_id]" value="<?= $proyecto->objetivo_especifico_3_id ?>">
                            <textarea id="proyecto-objetivo_especifico_3" class="form-control" name="Proyecto[objetivo_especifico_3]"  placeholder="Objetivo especifico 3" <?= $disabled ?>><?= $proyecto->objetivo_especifico_3 ?></textarea>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <table class="table table-bordered table-hover" id="tab_logic_3">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                        #
                                    </th>
                                    <th class="text-center">
                                        Actividad
                                    </th>
                                    <?php if($disabled==''){ ?>
                                    <th>
                                    </th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $e=0; ?>
                                <?php if($actividades3){ ?>
                                <?php foreach($actividades3 as $actividad){?>
                                    <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_3_id){ ?>
                                    <tr id='addr_3_<?= $e ?>'>
                                        <td>
                                        <?= ($e+1) ?>
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo3_<?= $e ?> required">
                                                <input type="text" id="proyecto-actividad_objetivo3_<?= $e ?>" class="form-control" name="Proyecto[actividades_3][]" placeholder="Actividad" value="<?= $actividad->descripcion ?>" <?= $disabled ?>/>
                                            </div>
                                        </td>
                                        <?php if($disabled==''){ ?>
                                        <td>
                                            <span class="remCF glyphicon glyphicon-minus-sign">
                                                <input type="hidden" name="Proyecto[actividades_ids_3][]" value="<?= $actividad->actividad_id ?>"/>
                                            </span>
                                        </td>
                                        <?php } ?>
                                    </tr>
                                    <?php $e++; ?>
                                    <?php }?>
                                <?php } ?>
                                <?php } else { ?>
                                    <tr id='addr_3_0'>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo3_0 required">
                                                <input type="text" id="proyecto-actividad_objetivo3_0" class="form-control" name="Proyecto[actividades_3][]" placeholder="Actividad" />
                                            </div>
                                        </td>
                                        <td>
                                            <span class="remCF glyphicon glyphicon-minus-sign"></span>
                                        </td>
                                    </tr>
                                <?php } ?>
                                <tr id='addr_3_<?= $e ?>'></tr>
                            </tbody>
                        </table>
                        <?php if($disabled==''){ ?>
                        <div id="add_row_3" class="btn btn-default pull-left" value="1">Agregar</div>
                        <?php }?>
                        <br>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <?php if($disabled==''){ ?>
                    <button type="button" id="btn_objetivo_especifico_3" class="btn btn-primary" data-dismiss="modal">Guardar</button>
                    <?php }?>
                </div>
            </div>
        </div>
    </div>
</div>




<?php ActiveForm::end(); ?>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>

<?php
    $this->registerJs(
    "$('document').ready(function(){})");
?>
<?php
    $eliminaractividad= Yii::$app->getUrlManager()->createUrl('proyecto/eliminaractividad');
    $reflexion= Yii::$app->getUrlManager()->createUrl('proyecto/reflexion');
    $evaluacion= Yii::$app->getUrlManager()->createUrl('proyecto/evaluacion');
?>
<script>
    var i=<?= $i ?>;
    var a=<?= $a ?>;
    var e=<?= $e ?>;
    
    
    $("#tab_logic_1").on('click','.remCF',function(){
        var r = confirm("Estas seguro?");
        if (r == true) {
            id=$(this).children().val();
            if (id) {
		$.ajax({
                    url: '<?= $eliminaractividad ?>',
                    type: 'GET',
                    async: true,
                    data: {id:id},
                    success: function(data){
                        
                    }
                });
		$(this).parent().parent().remove();	
	    }
	    else
	    {
		$(this).parent().parent().remove();
	    }
        } 
    });
    
    $("#tab_logic_2").on('click','.remCF',function(){
        var r = confirm("Estas seguro?");
        if (r == true) {
            id=$(this).children().val();
            if (id) {
		$.ajax({
                    url: '<?= $eliminaractividad ?>',
                    type: 'GET',
                    async: true,
                    data: {id:id},
                    success: function(data){
                        
                    }
                });
		$(this).parent().parent().remove();	
	    }
	    else
	    {
		$(this).parent().parent().remove();
	    }
        } 
    });
    
    $("#tab_logic_3").on('click','.remCF',function(){
        var r = confirm("Estas seguro?");
        if (r == true) {
            id=$(this).children().val();
            if (id) {
		$.ajax({
                    url: '<?= $eliminaractividad ?>',
                    type: 'GET',
                    async: true,
                    data: {id:id},
                    success: function(data){
                        
                    }
                });
		$(this).parent().parent().remove();	
	    }
	    else
	    {
		$(this).parent().parent().remove();
	    }
        } 
    });
    
    $("#add_row_1").click(function(){
        
        
        var objetivo=$('input[name=\'Proyecto[actividades_1][]\']').length;
        if (objetivo==5 && $('#proyecto-actividad_objetivo1_'+(i-1)).val()!='')
        {
            $.notify({
                message: 'No se puede agregar mas de 5' 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            $('.field-proyecto-actividad_objetivo1_'+(i-1)).addClass('has-success');
            $('.field-proyecto-actividad_objetivo1_'+(i-1)).removeClass('has-error');
            return false;
        }
        
        
        if($('#proyecto-actividad_objetivo1_'+(i-1)).val()=='')
        {
            var error='ingrese la '+i+' actividad <br>';
            $('.field-proyecto-actividad_objetivo1_'+(i-1)).addClass('has-error');
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $('.field-proyecto-actividad_objetivo1_'+(i-1)).addClass('has-success');
            $('.field-proyecto-actividad_objetivo1_'+(i-1)).removeClass('has-error');
            
            $('#addr_1_'+i).html("<td>"+ (i+1) +"</td><td><div class='form-group field-proyecto-actividad_objetivo1_"+i+" required'><input id='proyecto-actividad_objetivo1_"+i+"' name='Proyecto[actividades_1][]' type='text' placeholder='Actividad' class='form-control'  /></div></td><td><span class='remCF glyphicon glyphicon-minus-sign'></span></td>");
            $('#tab_logic_1').append('<tr id="addr_1_'+(i+1)+'"></tr>');
            i++;
        }
        
        
        return true;
    });
    
    
    $("#add_row_2").click(function(){
        
        
        var objetivo=$('input[name=\'Proyecto[actividades_2][]\']').length;
        if (objetivo==5 && $('#proyecto-actividad_objetivo2_'+(a-1)).val()!='')
        {
            $.notify({
                message: 'No se puede agregar mas de 5' 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            $('.field-proyecto-actividad_objetivo2_'+(a-1)).addClass('has-success');
            $('.field-proyecto-actividad_objetivo2_'+(a-1)).removeClass('has-error');
            return false;
        }
        
        
        if($('#proyecto-actividad_objetivo2_'+(a-1)).val()=='')
        {
            var error='ingrese la '+a+' actividad <br>';
            $('.field-proyecto-actividad_objetivo2_'+(a-1)).addClass('has-error');
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $('.field-proyecto-actividad_objetivo2_'+(a-1)).addClass('has-success');
            $('.field-proyecto-actividad_objetivo2_'+(a-1)).removeClass('has-error');
            
            $('#addr_2_'+a).html("<td>"+ (a+1) +"</td><td><div class='form-group field-proyecto-actividad_objetivo2_"+a+" required'><input id='proyecto-actividad_objetivo2_"+a+"' name='Proyecto[actividades_2][]' type='text' placeholder='Actividad' class='form-control'  /></div></td><td><span class='remCF glyphicon glyphicon-minus-sign'></span></td>");
            $('#tab_logic_2').append('<tr id="addr_2_'+(a+1)+'"></tr>');
            a++;
        }
        
        
        return true;
    });
    
    
    $("#add_row_3").click(function(){
        
        
        var objetivo=$('input[name=\'Proyecto[actividades_3][]\']').length;
        if (objetivo==5 && $('#proyecto-actividad_objetivo3_'+(e-1)).val()!='')
        {
            $.notify({
                message: 'No se puede agregar mas de 5' 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            $('.field-proyecto-actividad_objetivo3_'+(e-1)).addClass('has-success');
            $('.field-proyecto-actividad_objetivo3_'+(e-1)).removeClass('has-error');
            return false;
        }
        
        
        if($('#proyecto-actividad_objetivo3_'+(e-1)).val()=='')
        {
            var error='ingrese la '+e+' actividad <br>';
            $('.field-proyecto-actividad_objetivo3_'+(e-1)).addClass('has-error');
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $('.field-proyecto-actividad_objetivo3_'+(e-1)).addClass('has-success');
            $('.field-proyecto-actividad_objetivo3_'+(e-1)).removeClass('has-error');
            
            $('#addr_3_'+e).html("<td>"+ (e+1) +"</td><td><div class='form-group field-proyecto-actividad_objetivo3_"+e+" required'><input id='proyecto-actividad_objetivo3_"+e+"' name='Proyecto[actividades_3][]' type='text' placeholder='Actividad' class='form-control'  /></div></td><td><span class='remCF glyphicon glyphicon-minus-sign'></span></td>");
            $('#tab_logic_3').append('<tr id="addr_3_'+(e+1)+'"></tr>');
            e++;
        }
        
        
        return true;
    });
    
    $("#btn_objetivo_general").click(function(event){
        if ($('#proyecto-objetivo_general').val()=='') {
            $.notify({
                message: 'Ingrese el Objetivo General' 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            $('.field-proyecto-objetivo_general').addClass('has-error');
            return false;
        }
        $('.field-proyecto-objetivo_general').css( 'color', 'black' );
        $("#txt_objetivo_general").html($('#proyecto-objetivo_general').val());
        return true;
    });
    
    $("#btn_objetivo_especifico_1").click(function(event){
        var error='';
        if ($('#proyecto-objetivo_especifico_1').val()=='') {
            error=error+' Ingrese el Objetivo especifico 1 <br>';
            $('.field-proyecto-objetivo_especifico_1').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-objetivo_especifico_1').addClass('has-success');
            $('.field-proyecto-objetivo_especifico_1').removeClass('has-error');
        }
        
        var objetivo1=$('input[name=\'Proyecto[actividades_1][]\']').length;
        for (var i=0; i<objetivo1; i++) {
            if($('#proyecto-actividad_objetivo1_'+i).val()=='')
            {
                error=error+'ingrese si quiera '+i+' objetivo especifico <br>';
                $('.field-proyecto-actividad_objetivo1_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-actividad_objetivo1_'+i).addClass('has-success');
                $('.field-proyecto-actividad_objetivo1_'+i).removeClass('has-error');
            }
        }
        
        
        if (error!='') {
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $("#txt_objetivo_especifico_1").html($('#proyecto-objetivo_especifico_1').val());
            $('.field-proyecto-objetivo_especifico_1').css( 'color', 'black' );
            $( "#w0" ).submit();
            return true;
        }
        
    });
    
    $("#btn_objetivo_especifico_2").click(function(event){
        var error='';
        
        var objetivo2=$('input[name=\'Proyecto[actividades_2][]\']').length;
        for (var i=0; i<objetivo2; i++) {
            if($('#proyecto-actividad_objetivo2_'+i).val()=='')
            {
                error=error+'ingrese si quiera '+i+' objetivo especifico <br>';
                $('.field-proyecto-actividad_objetivo2_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-actividad_objetivo2_'+i).addClass('has-success');
                $('.field-proyecto-actividad_objetivo2_'+i).removeClass('has-error');
            }
        }
        
        if ($('#proyecto-objetivo_especifico_2').val()=='') {
            error=error+'Ingrese el Objetivo especifico 2 <br>';
            $('.field-proyecto-objetivo_especifico_2').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-objetivo_especifico_2').addClass('has-success');
            $('.field-proyecto-objetivo_especifico_2').removeClass('has-error');
        }
        
        
        if (error!='') {
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $("#txt_objetivo_especifico_2").html($('#proyecto-objetivo_especifico_2').val());
            $('.field-proyecto-objetivo_especifico_2').css( 'color', 'black' );
            $( "#w0" ).submit();
            return true;
        }
    });
    
    $("#btn_objetivo_especifico_3").click(function(event){
        var error='';
        
        if ($('#proyecto-objetivo_especifico_3').val()=='') {
            error=error+'Ingrese el Objetivo especifico 3 <br>';
            $('.field-proyecto-objetivo_especifico_3').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-objetivo_especifico_3').addClass('has-success');
            $('.field-proyecto-objetivo_especifico_3').removeClass('has-error');
        }
            
        var objetivo3=$('input[name=\'Proyecto[actividades_3][]\']').length;
        for (var i=0; i<objetivo3; i++) {
            if($('#proyecto-actividad_objetivo3_'+i).val()=='')
            {
                error=error+'ingrese si quiera '+i+' objetivo especifico <br>';
                $('.field-proyecto-actividad_objetivo3_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-actividad_objetivo3_'+i).addClass('has-success');
                $('.field-proyecto-actividad_objetivo3_'+i).removeClass('has-error');
            }
        }
        
        
        
        if (error!='') {
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $("#txt_objetivo_especifico_3").html($('#proyecto-objetivo_especifico_3').val());
            $('.field-proyecto-objetivo_especifico_3').css( 'color', 'black' );
            $( "#w0" ).submit();
            return true;
        }
    });
    
    $("#btnproyecto").click(function(event){
        var error='';
        
        if($('#proyecto-titulo').val()=='')
        {
            error=error+'ingrese titulo del proyecto <br>';
            $('.field-proyecto-titulo').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-titulo').addClass('has-success');
            $('.field-proyecto-titulo').removeClass('has-error');
        }
        
        if($('#proyecto-resumen').val()=='')
        {
            error=error+'ingrese resumen del proyecto <br>';
            $('.field-proyecto-resumen').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-resumen').addClass('has-success');
            $('.field-proyecto-resumen').removeClass('has-error');
        }
        
        if($('#proyecto-beneficiario').val()=='')
        {
            error=error+'ingrese beneficiarios del proyecto <br>';
            $('.field-proyecto-beneficiario').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-beneficiario').addClass('has-success');
            $('.field-proyecto-beneficiario').removeClass('has-error');
        }
        
        
        if($('#proyecto-objetivo_general').val()=='')
        {
            error=error+'ingrese objetivo general del proyecto <br>';
            $('.field-proyecto-objetivo_general').addClass('has-error');
            $('.field-proyecto-objetivo_general').css( 'color', '#a94442' );
            
        }
        else
        {
            $('.field-proyecto-objetivo_general').addClass('has-success');
            $('.field-proyecto-objetivo_general').removeClass('has-error');
            $('.field-proyecto-objetivo_general').css( 'color', 'black' );
        }
        
        if($('#proyecto-objetivo_especifico_1').val()=='')
        {
            error=error+'ingrese objetivo especifico 1   <br>';
            $('.field-proyecto-objetivo_especifico_1').addClass('has-error');
            $('.field-proyecto-objetivo_especifico_1').css( 'color', '#a94442' );
        }
        else
        {
            $('.field-proyecto-objetivo_especifico_1').addClass('has-success');
            $('.field-proyecto-objetivo_especifico_1').removeClass('has-error');
            $('.field-proyecto-objetivo_especifico_1').css( 'color', 'black' );
        }
        
        if($('#proyecto-objetivo_especifico_2').val()=='')
        {
            error=error+'ingrese objetivo especifico 2   <br>';
            $('.field-proyecto-objetivo_especifico_2').addClass('has-error');
            $('.field-proyecto-objetivo_especifico_2').css( 'color', '#a94442' );
        }
        else
        {
            $('.field-proyecto-objetivo_especifico_2').addClass('has-success');
            $('.field-proyecto-objetivo_especifico_2').removeClass('has-error');
            $('.field-proyecto-objetivo_especifico_2').css( 'color', 'black' );
        }
        
        
        
        if(error!='')
        {
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        return true;
    });
    
    $('.numerico').keypress(function (tecla) {
        var reg = /^[0-9\s]+$/;
        if(!reg.test(String.fromCharCode(tecla.which))){
            return false;
        }
        return true;
    });
    
    $('#btnproyectoreflexion').click(function(events){
        var error='';
        
        if($.trim($('#proyecto-reflexion').val())=='')
        {
            error=error+'ingrese una reflexión del proyecto <br>';
            $('.field-proyecto-reflexion').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-reflexion').addClass('has-success');
            $('.field-proyecto-reflexion').removeClass('has-error');
        }
        
        if(error!='')
        {
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $.ajax({
                url: '<?= $reflexion ?>',
                type: 'POST',
                async: true,
                data: {'Reflexion[reflexion]':$('#proyecto-reflexion').val(),'Reflexion[proyecto_id]':<?= $proyecto->id ?>,'Reflexion[user_id]':<?= \Yii::$app->user->id ?>},
                success: function(data){
                    $.notify({
                        message: 'Se ha guardado tu reflexión' 
                    },{
                        type: 'success',
                        z_index: 1000000,
                        placement: {
                            from: 'bottom',
                            align: 'right'
                        },
                    });
                    
                    setTimeout(function(){
                                        window.location.reload(1);
                                    }, 2000); 
                }
            });
            return true;
        }
        
    });
    
    
    
    
    $('#btnproyectoevaluacion').click(function(events){
        var error='';
        
        if($.trim($('#proyecto-evaluacion').val())=='')
        {
            error=error+'ingrese una evaluacion del proyecto <br>';
            $('.field-proyecto-evaluacion').addClass('has-error');
        }
        else
        {
            $('.field-proyecto-evaluacion').addClass('has-success');
            $('.field-proyecto-evaluacion').removeClass('has-error');
        }
        
        if(error!='')
        {
            $.notify({
                message: error 
            },{
                type: 'danger',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
            return false;
        }
        else
        {
            $.ajax({
                url: '<?= $evaluacion ?>',
                type: 'POST',
                async: true,
                data: {'Evaluacion[evaluacion]':$('#proyecto-evaluacion').val(),'Evaluacion[proyecto_id]':<?= $proyecto->id ?>,'Evaluacion[user_id]':<?= \Yii::$app->user->id ?>},
                success: function(data){
                    $.notify({
                        message: 'Se ha guardado tu evaluación' 
                    },{
                        type: 'success',
                        z_index: 1000000,
                        placement: {
                            from: 'bottom',
                            align: 'right'
                        },
                    });
                    $( "#w0" ).submit();
                }
            });
            
            setTimeout(function(){
                                        window.location.reload(1);
                                    }, 2000); 
            return true;
        }
        
    });
    
    
    (function() {
    
        var bar = $('.bar');
        var percent = $('.percent');
        var status = $('#status');
        $('#w0').ajaxForm({
            beforeSend: function() {
                var percentVal = '0%';
                bar.width(percentVal)
                percent.html(percentVal);
                
            },
            uploadProgress: function(event, position, total, percentComplete) {
                var percentVal = percentComplete + '%';
                bar.width(percentVal)
                percent.html(percentVal);
                //console.log(percentVal, position, total);
            },
            success: function() {
                var percentVal = '100%';
                bar.width(percentVal)
                percent.html(percentVal);
                $( "#w0" ).submit();
            },
            complete: function(xhr) {
                status.html(xhr.responseText);
                $( "#w0" ).submit();
                /*setTimeout(function(){
                                        window.location.reload(1);
                                    }, 10);*/
            }
        }); 
    })();  
</script>





