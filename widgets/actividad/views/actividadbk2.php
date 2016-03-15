<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

use yii\widgets\Pjax;
use yii\web\JsExpression;

/* @var $this \yii\web\View */
/* @var $user \common\models\LoginForm */
/* @var $title string */


?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<?php $form = ActiveForm::begin(); ?>
<h2>Registrar Actividades</h2>
<hr class="colorgraph">
<div class="row">
    <?php $i=0; ?>
    <?php foreach($actividades as $actividad){ ?>
	<div class="clearfix"></div>
	<div class="col-xs-12 col-sm-3 col-md-3">
	    <?= $actividad->descripcion ?>
	</div>
	<div class="col-xs-12 col-sm-9 col-md-3">
	    <div class="form-group field-actividad-resultado_<?= $actividad->actividad_id ?>_0 required">
		<input type="text" id="actividad-resultado_<?= $actividad->actividad_id ?>_0" class="form-control" name="Actividad[resultados_<?= $actividad->actividad_id?>][]" placeholder="Resultado" >
	    </div>
	</div>
	<div class="clearfix"></div>
	<div class="col-xs-12 col-sm-12 col-md-12">
	    <table class="table table-bordered table-hover" id="tab_logic_<?= $actividad->actividad_id ?>">
		<thead>
		    <th>Recursos</th>
		    <th>¿Como conseguirlo?</th>
		    <th colspan="3" align="center !important">Presupuesto</th>
		    <th></th>
		</thead>
		<tbody>
		    <tr id='addr_<?= $actividad->actividad_id;?>_0'>
			<td>
			    <div class="form-group field-actividad-recurso_<?= $actividad->actividad_id;?>_0 required">
				<select id="actividad-recurso_<?= $actividad->actividad_id;?>_0" class="form-control" name="Actividad[recursos_<?= $actividad->actividad_id?>][]" >
				    <option value>seleccionar</option>
				    <option value=1>Material</option>
				    <option value=2>Humano</option>
				</select>
			    </div>
			</td>
			<td>
			    <div class="form-group field-actividad-como_conseguirlo_<?= $actividad->actividad_id;?>_0 required">
				<select id="actividad-como_conseguirlo_<?= $actividad->actividad_id;?>_0" class="form-control" name="Actividad[comos_conseguirlos_<?= $actividad->actividad_id?>][]" >
				    <option value>seleccionar</option>
				    <option value=1>Pedir</option>
				    <option value=2>Crear</option>
				    <option value=3>Comprar</option>
				</select>
			    </div>
			</td>
			<td>
			    <div class="form-group field-actividad-precio_unitario_<?= $actividad->actividad_id;?>_0 required">
				<input id="actividad-precio_unitario_<?= $actividad->actividad_id;?>_0" class="form-control" name="Actividad[precios_unitarios_<?= $actividad->actividad_id?>][]" placeholder="Precio unitario" />
			    </div>
			</td>
			<td>
			    <div class="form-group field-actividad-cantidad_<?= $actividad->actividad_id;?>_0 required">
				<input id="actividad-cantidad_<?= $actividad->actividad_id;?>_0" class="form-control" name="Actividad[cantidades_<?= $actividad->actividad_id?>][]" placeholder="Cantidad" />
			    </div>
			</td>
			<td>
			    <div class="form-group field-actividad-subtotal_<?= $actividad->actividad_id;?>_0 required">
				<input id="actividad-subtotal_<?= $actividad->actividad_id;?>_0" class="form-control" name="Actividad[subtotales_<?= $actividad->actividad_id?>][]" placeholder="Subtotal" />
			    </div>
			</td>
			<td>
			    <span class="remCF glyphicon glyphicon-minus-sign"></span>
			</td>
		    </tr>
		    <tr id='addr_<?= $actividad->actividad_id ?>_1'></tr>
		</tbody>
	    </table>
	    <div id="add_row_<?= $i?>" class="btn btn-default pull-left" onclick="Insertar(<?= $actividad->actividad_id?>,1)">Add Row</div>
	</div>
	<div class="clearfix"></div>
	<p>&nbsp</p>
	<p>&nbsp</p>
	<p>&nbsp</p>
	<?php $i++; ?>
    <?php } ?>
    
    
    <div class="clearfix"></div>   
    <div class="modal-footer">
       <button type="submit" id="btnproyecto" class="btn btn-primary">Guardar</button>
    </div>
</div>
<?php ActiveForm::end(); ?>
<?php
    $this->registerJs(
    "$('document').ready(function(){})");
?>
<script>
    var actividades="<?= $i?>";
    var a=1;
    var identificador = [];
    for (var i=0; i<actividades;i++) {
	identificador[i]=1;
    }
    console.log(identificador[0]);
    
    
    function Insertar(id) {
	
	
	
	$('#addr_'+id+'_'+a).html(
			"<td>"+
			    "<div class='form-group field-actividad-recurso_"+id+"_"+a+" required'>"+
				"<select id='actividad-recurso_"+id+"_"+a+"' class='form-control' name='Actividad[recursos_"+id+"][]'>"+
				    "<option value=''>seleccionar</option>"+
				    "<option value='1'>Material</option>"+
				    "<option value='2'>Humano</option>"+
				"</select>"+
			   "</div>"+
			"</td>"+
			"<td>"+
			    "<div class='form-group field-actividad-como_conseguirlo_"+id+"_"+a+" required'>"+
				"<select id='actividad-como_conseguirlo_"+id+"_"+a+"' class='form-control' name='Actividad[comos_conseguirlos_"+id+"][]'>"+
				    "<option value=''>seleccionar</option>"+
				    "<option value='1'>Pedir</option>"+
				    "<option value='2'>Crear</option>"+
				    "<option value='3'>Comprar</option>"+
				"</select>"+
			    "</div>"+
			"</td>"+
			"<td>"+
			    "<div class='form-group field-actividad-precio_unitario_"+id+"_"+a+" required'>"+
				"<input id='actividad-precio_unitario_"+id+"_"+a+"' class='form-control' name='Actividad[precios_unitarios_"+id+"][]' placeholder='Precio unitario'>"+
			    "</div>"+
			"</td>"+
			"<td>"+
			    "<div class='form-group field-actividad-cantidad_"+id+"_"+a+" required'>"+
				"<input id='actividad-cantidad_"+id+"_"+a+"' class='form-control' name='Actividad[cantidades_"+id+"][]' placeholder='Cantidad'>"+
			    "</div>"+
			"</td>"+
			"<td>"+
			    "<div class='form-group field-actividad-subtotal_"+id+"_"+a+" required'>"+
				"<input id='actividad-subtotal_"+id+"_"+a+"' class='form-control' name='Actividad[subtotales_"+id+"][]' placeholder='Subtotal'>"+
			    "</div>"+
			"</td>"+
			"<td>"+
			    "<span class='remCF glyphicon glyphicon-minus-sign'></span>"+
			"</td>");
	$('#tab_logic_'+id).append('<tr id="addr_'+id+'_'+(a+1)+'"></tr>');
	a++;
    }
    
</script>

