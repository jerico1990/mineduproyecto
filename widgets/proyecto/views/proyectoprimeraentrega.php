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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../js/bootbox.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<?php $form = ActiveForm::begin(); ?>
<h2>Primera entrega</h2>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-proyecto-titulo">
            <label class="control-label" for="proyecto-titulo" title="Máximo 10 palabras">Título: </label> <p><?= $proyecto->titulo ?></p>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-proyecto-resumen">
            <label class="control-label" for="proyecto-resumen" title="Mínimo 100 palabras">Resumen: *</label> <p><?= $proyecto->resumen ?></p>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-proyecto-beneficiario required">
            <label class="control-label" for="proyecto-beneficiario">Beneficiario: *</label><p><?= $proyecto->beneficiario ?></p>
            
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-proyecto-objetivo_general required">
            <span class="glyphicon glyphicon-plus-sign" data-toggle="modal" data-target="#objetivo_general"></span> <div style="display: inline" id="txt_objetivo_general" ><?= $proyecto->objetivo_general ?></div>
        </div>
    </div>
    
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-proyecto-objetivo_especifico_1 required">
            <span class="glyphicon glyphicon-plus-sign field-proyecto-objetivo_especifico_1" data-toggle="modal" data-target="#objetivo_especifico_1"></span> <div style="display: inline" id="txt_objetivo_especifico_1"><?= $proyecto->objetivo_especifico_1 ?></div><br>
            <div id="txt_actividades_objetivo_especifico_1">
                <?php foreach($actividades as $actividad){ ?>
                    <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_1_id){?>
                        <a href="../actividad/indexc?id=<?= $actividad->actividad_id ?>" target="_blank"><?= $actividad->descripcion ?></a>
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
                        <a href="../actividad/indexc?id=<?= $actividad->actividad_id ?>" target="_blank"><?= $actividad->descripcion ?></a>
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
                        <a href="../actividad/indexc?id=<?= $actividad->actividad_id ?>" target="_blank"><?= $actividad->descripcion ?></a>
                        <br>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-proyecto-reflexion required">
            <label class="control-label" for="proyecto-reflexion" >Reflexión: </label><p><?= $proyecto->reflexion ?></p>
            
        </div>
    </div>
    <div class="clearfix"></div>
    
    <!-- Objetivo General -->
    <div class="modal fade" id="objetivo_general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Objetivo General</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group field-proyecto-objetivo_general required">
                        <p><?= $proyecto->objetivo_general ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Objetivo Especifico 1 -->
    <div class="modal fade" id="objetivo_especifico_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Objetivo especifico 1</h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_1 required">
                            <p><?= $proyecto->objetivo_especifico_1 ?></p>
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
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i=0; ?>
                                <?php foreach($actividades as $actividad){?>
                                    <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_1_id){ ?>
                                    <tr id='addr_1_<?= $i ?>'>
                                        <td>
                                        <?= ($i+1) ?>
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo1_<?= $i ?> required">
                                                <?= $actividad->descripcion ?>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <?php $i++; ?>
                                    <?php }?>
                                <?php } ?>
                                <tr id='addr_1_<?= $i ?>'></tr>
                            </tbody>
                        </table>
                        <br>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Objetivo Especifico 2 -->
    <div class="modal fade" id="objetivo_especifico_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Objetivo especifico 2</h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_2 required" style="display: inline-block">
                            <p><?= $proyecto->objetivo_especifico_2 ?></p>
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
                                </tr>
                            </thead>
                            <tbody>
                                <?php $a=0; ?>
                                <?php foreach($actividades as $actividad){?>
                                    <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_2_id){ ?>
                                    
                                    <tr id='addr_2_<?= $a ?>'>
                                        <td>
                                        <?= ($a+1) ?>
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo2_<?= $a ?> required">
                                                <?= $actividad->descripcion ?>
                                                
                                            </div>
                                        </td>
                                       
                                    </tr>
                                    <?php $a++; ?>
                                    <?php }?>
                                <?php } ?>
                                <tr id='addr_2_<?= $a ?>'></tr>
                            </tbody>
                        </table>
                        <br>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <!-- Objetivo Especifico 3 -->
    <div class="modal fade" id="objetivo_especifico_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Objetivo especifico 3</h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_3 required">
                            <p><?= $proyecto->objetivo_especifico_3 ?></p>
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
                                </tr>
                            </thead>
                            <tbody>
                                <?php $e=0; ?>
                                <?php foreach($actividades as $actividad){?>
                                    <?php if($actividad->objetivo_especifico_id==$proyecto->objetivo_especifico_3_id){ ?>
                                    <tr id='addr_3_<?= $e ?>'>
                                        <td>
                                        <?= ($e+1) ?>
                                        </td>
                                        <td>
                                            <div class="form-group field-proyecto-actividad_objetivo3_<?= $e ?> required">
                                                <?= $actividad->descripcion ?>
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
                                <tr id='addr_3_<?= $e ?>'></tr>
                            </tbody>
                        </table>
                        <br>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>




<?php ActiveForm::end(); ?>
<?php if($videoprimeraentrega && ($equipo->etapa==1 || $equipo->etapa==2)){ ?>
<h1>Video de primera entrega</h1>
    <video width="320" height="240" controls>
        <source src="<?= Yii::getAlias('@video').$videoprimeraentrega->ruta ?>" type="video/mp4">  
    </video>
<?php } ?>


<?php
    $this->registerJs(
    "$('document').ready(function(){})");
?>