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
<h2>Registrar Proyecto</h2>
<hr class="colorgraph">
<div class="row">
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
    <!--<div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-proyecto-objetivo_general required">
            <label class="control-label" for="proyecto-objetivo_general" title="Máximo 30 palabras">Objetivo General: *</label>
            <textarea id="proyecto-objetivo_general" class="form-control" name="Proyecto[objetivo_general]"  maxlength="30" placeholder="Objetivo General" title="Máximo 30 palabras"></textarea>
        </div>
    </div>-->
    
    <div class="clearfix"></div>
    <!--
    <div class="col-xs-12 col-sm-7 col-md-5">
        <table class="table table-bordered table-hover" id="tab_logic">
            <thead>
                <tr>
                    <th class="text-center">
                        #
                    </th>
                    <th class="text-center">
                        Objetivo especifico
                    </th>
                    <th>
                        
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr id='addr0'>
                    <td>
                    1
                    </td>
                    <td>
                        <div class="form-group field-proyecto-objetivo_especifico_0 required">
                            <input type="text" id="proyecto-objetivo_especifico_0" class="form-control" name="Proyecto[objetivo_especifico][]" placeholder="Objetivo especifico" maxlength="30" title="Máximo 30 palabras"/>
                        </div>
                    </td>
                    <td>
			<span class="remCF glyphicon glyphicon-minus-sign"></span>
		    </td>
                </tr>
                <tr id='addr1'></tr>
            </tbody>
        </table>
        <a id="add_row" class="btn btn-default pull-left">Add Row</a>
        <br>
    </div>
    -->
    <div class="clearfix"></div>
    <!--
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="table-responsive">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th>N°</th>
                        <th>Cantidad</th>
                        <th>Unidad</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>
                            <div class="form-group field-proyecto-cantidad_1 required">
                                <input type="text" id="proyecto-cantidad_1" class="form-control numerico" name="Proyecto[cantidad_1]" placeholder="cantidad 1" maxlength="4" title="Máximo 4">
                            </div>
                        </td>
                        <td>
                            <div class="form-group field-proyecto-unidad_1 required">
                                <input type="text" id="proyecto-unidad_1" class="form-control" name="Proyecto[unidad_1]" placeholder="unidad 1" maxlength="15" title="Máximo 15 palabras">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <div class="form-group field-proyecto-cantidad_2 required">
                                <input type="text" id="proyecto-cantidad_2" class="form-control numerico" name="Proyecto[cantidad_2]" placeholder="cantidad 2" maxlength="4" title="Máximo 4">
                            </div>
                        </td>
                        <td>
                            <div class="form-group field-proyecto-unidad_2 required">
                                <input type="text" id="proyecto-unidad_2" class="form-control" name="Proyecto[unidad_2]" placeholder="unidad 1" maxlength="15" title="Máximo 15 palabras">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <div class="form-group field-proyecto-cantidad_3 required">
                                <input type="text" id="proyecto-cantidad_3" class="form-control numerico" name="Proyecto[cantidad_3]" placeholder="cantidad 3" maxlength="4" title="Máximo 4">
                            </div>
                        </td>
                        <td>
                            <div class="form-group field-proyecto-unidad_3 required">
                                <input type="text" id="proyecto-unidad_3" class="form-control " name="Proyecto[unidad_3]" placeholder="unidad 3" maxlength="15" title="Máximo 15 palabras">
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
-->
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
                        <label class="control-label" for="proyecto-objetivo_general" title="Máximo 30 palabras">Objetivo General: *</label>
                        <textarea id="proyecto-objetivo_general" class="form-control" name="Proyecto[objetivo_general]"  maxlength="30" placeholder="Objetivo General" title="Máximo 30 palabras" <?= $disabled ?>><?= $proyecto->objetivo_general ?></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <?php if($disabled==''){ ?>
                    <button type="button" id="btn_objetivo_general" class="btn btn-primary" data-dismiss="modal">Guardar</button>
                    <?php } ?>
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
                            <label class="control-label" for="proyecto-objetivo_especifico_1" title="Máximo 30 palabras">Objetivo objetivo especifico_1: *</label>
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
                                <?php foreach($actividades as $actividad){?>
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
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Objetivo especifico 2</h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_2 required">
                            <label class="control-label" for="proyecto-objetivo_especifico_2" title="Máximo 30 palabras">Objetivo objetivo especifico_2: *</label>
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
                                <?php foreach($actividades as $actividad){?>
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
                                    <?php }?>
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
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Objetivo especifico 3</h4>
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-7 col-md-12">
                        <div class="form-group field-proyecto-objetivo_especifico_3 required">
                            <label class="control-label" for="proyecto-objetivo_especifico_3" title="Máximo 30 palabras">Objetivo objetivo especifico_3: *</label>
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
                                <?php foreach($actividades as $actividad){?>
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
    <div class="modal-footer">
        <?php if($disabled==''){ ?>
        <button type="submit" id="btnproyecto" class="btn btn-primary">Guardar</button>
        <?php }?>
    </div>
</div>




<?php ActiveForm::end(); ?>



<?php
    $this->registerJs(
    "$('document').ready(function(){})");
?>
<?php
    $eliminaractividad= Yii::$app->getUrlManager()->createUrl('proyecto/eliminaractividad');
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
    /*
    $("#delete_row").click(function(){
        if(i>1){
            $("#addr"+(i-1)).html('');
            i--;
        }
    });*/
    
    
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
    
     
</script>




