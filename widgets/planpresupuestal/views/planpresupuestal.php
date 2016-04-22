<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

use yii\widgets\Pjax;
use yii\web\JsExpression;

/* @var $this \yii\web\View */
/* @var $user \common\models\LoginForm */
/* @var $title string */
$opciones_objetivos='';
foreach($objetivos as $objetivo){ 
    $opciones_objetivos=$opciones_objetivos.'<option value='.$objetivo->id.'>'.$objetivo->descripcion.'</option>';
}

?>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-3 col-md-3 text-center"></div>
    <div class="col-xs-12 col-sm-6 col-md-6 text-center">
	<select id="proyecto-plan_presupuestal_objetivo_99" class="form-control" name="Proyecto[planes_presupuestales_objetivos][]" onchange="actividad($(this).val(),99)" <?= $disabled ?>>
	    <option value>seleccionar</option>
	    <?= $opciones_objetivos ?>
	</select>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-3 col-md-3 text-center"></div>
    <div class="col-xs-12 col-sm-6 col-md-6 text-center">
	<select id="proyecto-plan_presupuestal_actividad_99" class="form-control" name="Proyecto[planes_presupuestales_actividades]" onchange="presupuesto($(this).val())" <?= $disabled ?>>
	    <option value>seleccionar</option>
	</select>
    </div>
    <div class="clearfix"></div>
	<div class="col-xs-12 col-sm-12 col-md-12">
	    <table class="table table-striped table-hover" id="presupuesto" style="display: none">
		<thead>
		    <th>Recursos</th>
		    <th>Unidad</th>
		    <th>A quien va dirigido</th>
		    <th>¿Como conseguirlo?</th>
		    <th colspan="3" class="text-center">Presupuesto</th>
		    <?= ($disabled=='')?'<th></th>':'' ?>
		</thead>
		<tbody id="presupuesto_cuerpo">
		    
		</tbody>
	    </table>
	    <?php if($disabled==''){?>
		<div id="btn_presupuesto" class="btn btn-default pull-right" onclick="InsertarPlanPresupuestal()" style="display: none">Agregar</div>
	    <?php } ?>
	</div>
    <div class="clearfix"></div>
    <?php /*?>
    <div class="col-xs-12 col-sm-12 col-md-12">
	<table class="table table-striped table-hover" id="tab_plan_presupuestal">
	    <thead>
		<th>Objetivo especifico</th>
		<th>Actividad</th>
		<th>Recursos</th>
		<th>A quien va dirigido</th>
		<th>¿Como conseguirlo?</th>
		<th colspan="3" class="text-center">Presupuesto</th>
		<?= ($disabled=='')?'<th></th>':'' ?>
	    </thead>
	    <tbody>
		
		<?php if($planespresupuestales){?>
		    <?php $plan=0; ?>
		    <?php foreach($planespresupuestales as $planpresupuestal){?>
			<tr id='plan_presupuestal_<?= $plan ?>'>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_objetivo_<?= $plan ?> required" style="margin-top: 0px">
				    <select id="proyecto-plan_presupuestal_objetivo_<?= $plan ?>" class="form-control" name="Proyecto[planes_presupuestales_objetivos][]" onchange="actividad($(this).val(),<?= $plan ?>)" <?= $disabled ?>>
					<option value>seleccionar</option>
					<?php foreach($objetivos as $objetivo){  ?>
					    <option value='<?= $objetivo->id ?>' <?= ($objetivo->id==$planpresupuestal->objetivo_especifico_id)?'selected':'' ?>><?= $objetivo->descripcion ?></option>
					<?php }  ?>
				    </select>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_actividad_<?= $plan ?> required" style="margin-top: 0px">
				    <select id="proyecto-plan_presupuestal_actividad_<?= $plan ?>" class="form-control" name="Proyecto[planes_presupuestales_actividades][]" <?= $disabled ?>>
					<option value>seleccionar</option>
					<?php foreach($actividades as $actividad){  ?>
					    <option value='<?= $actividad->id ?>' <?= ($actividad->id==$planpresupuestal->actividad_id)?'selected':'' ?> ><?= $actividad->descripcion ?> </option>
					<?php } ?>
				    </select>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_recurso_descripcion_<?= $plan ?> required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_recurso_descripcion_<?= $plan ?>" class="form-control" name="Proyecto[planes_presupuestales_recursos_descripciones][]" placeholder="Recurso" value="<?= $planpresupuestal->recurso_descripcion ?>"  <?= $disabled ?> />
				    <!--
				    <select id="proyecto-plan_presupuestal_recurso_<?= $plan ?>" class="form-control" name="Proyecto[planes_presupuestales_recursos][]" <?= $disabled ?>>
					<option value>seleccionar</option>
					<option value=1 <?= ($planpresupuestal->recurso == 1) ? 'selected' : ''; ?> >Material</option>
					<option value=2 <?= ($planpresupuestal->recurso == 2) ? 'selected' : ''; ?>>Humano</option>
				    </select>-->
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_dirigido_<?= $plan ?> required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_dirigido_<?= $plan ?>" class="form-control" name="Proyecto[planes_presupuestales_dirigidos][]" placeholder="A quien va dirigdio" value="<?= $planpresupuestal->dirigido ?>"  <?= $disabled ?>/>
				    <!--
				    <select id="proyecto-plan_presupuestal_recurso_<?= $plan ?>" class="form-control" name="Proyecto[planes_presupuestales_recursos][]" <?= $disabled ?>>
					<option value>seleccionar</option>
					<option value=1 <?= ($planpresupuestal->recurso == 1) ? 'selected' : ''; ?> >Material</option>
					<option value=2 <?= ($planpresupuestal->recurso == 2) ? 'selected' : ''; ?>>Humano</option>
				    </select>-->
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_como_conseguirlo_<?= $plan ?> required" style="margin-top: 0px">
				    <select onchange="ComoConseguirlo($(this).val(),<?= $plan ?>)" id="proyecto-plan_presupuestal_como_conseguirlo_<?= $plan ?>" class="form-control" name="Proyecto[planes_presupuestales_comos_conseguirlos][]" <?= $disabled ?>>
					<option value>seleccionar</option>
					<option value=1 <?= ($planpresupuestal->como_conseguirlo == 1) ? 'selected' : ''; ?>>Pedir</option>
					<option value=2 <?= ($planpresupuestal->como_conseguirlo == 2) ? 'selected' : ''; ?>>Crear</option>
					<option value=3 <?= ($planpresupuestal->como_conseguirlo == 3) ? 'selected' : ''; ?>>Comprar</option>
				    </select>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_precio_unitario_<?= $plan ?> required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_precio_unitario_<?= $plan ?>" onfocusout="Subtotal1(<?= $plan ?>,1)" class="form-control numerico" name="Proyecto[planes_presupuestales_precios_unitarios][]" placeholder="Precio unitario" value="<?= ($planpresupuestal->precio_unitario==0)?'':$planpresupuestal->precio_unitario ?>" <?= ($planpresupuestal->como_conseguirlo == 1 || $planpresupuestal->como_conseguirlo == 2) ? 'disabled' : ''; ?>  <?= $disabled ?>/>
				    <?php  if($planpresupuestal->como_conseguirlo == 1 || $planpresupuestal->como_conseguirlo == 2) {?>
					<input type="hidden"  class="form-control numerico" name="Proyecto[planes_presupuestales_precios_unitarios][]" placeholder="Precio unitario" value="0"   />
				    <?php } ?>																																																																					    
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_cantidad_<?= $plan ?> required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_cantidad_<?= $plan ?>" onfocusout="Subtotal2(<?= $plan ?>,2)" class="form-control numerico" name="Proyecto[planes_presupuestales_cantidades][]" placeholder="Cantidad" value="<?= $planpresupuestal->cantidad ?>" <?= $disabled ?>/>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_subtotal_<?= $plan ?> required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_subtotal1_<?= $plan ?>" class="form-control numerico" name="Proyecto[planes_presupuestales_subtotales1][]" placeholder="Subtotal" value="<?= $planpresupuestal->subtotal ?>" disabled />
				    <input type="hidden" id="proyecto-plan_presupuestal_subtotal_<?= $plan ?>" class="form-control numerico" name="Proyecto[planes_presupuestales_subtotales][]" placeholder="Subtotal" value="<?= $planpresupuestal->subtotal ?>" />
				</div>
			    </td>
			    <?php if($disabled==''){?>
			    <td style="padding: 2px">
				<span class="remCF glyphicon glyphicon-minus-sign">
				    <input class="id" type="hidden" name="Proyecto[planes_presupuestal_ids][]" value="<?= $planpresupuestal->id ?>" />
				</span>
			    </td>
			    <?php } ?>
			</tr>
			<?php $plan++; ?>
		    <?php } ?>
		<?php } else {?>
			<tr id='plan_presupuestal_0'>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_objetivo_0 required" style="margin-top: 0px">
				    <select id="proyecto-plan_presupuestal_objetivo_0" class="form-control" name="Proyecto[planes_presupuestales_objetivos][]" onchange="actividad($(this).val(),0)" <?= $disabled ?>>
					<option value>seleccionar</option>
					<?= $opciones_objetivos ?>
				    </select>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_actividad_0 required" style="margin-top: 0px">
				    <select id="proyecto-plan_presupuestal_actividad_0" class="form-control" name="Proyecto[planes_presupuestales_actividades][]" <?= $disabled ?>>
					<option value>seleccionar</option>
				    </select>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_recurso_descripcion_0 required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_recurso_descripcion_0" class="form-control" name="Proyecto[planes_presupuestales_recursos_descripciones][]" placeholder="Recurso"  <?= $disabled ?> />
				    <!--
				    <select id="proyecto-plan_presupuestal_recurso_0" class="form-control" name="Proyecto[planes_presupuestales_recursos][]" <?= $disabled ?>>
					<option value>seleccionar</option>
					<option value=1>Material</option>
					<option value=2>Humano</option>
				    </select>-->
				</div>
			    </td>
			    
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_dirigido_0 required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_dirigido_0" class="form-control" name="Proyecto[planes_presupuestales_dirigidos][]" placeholder="A quien va dirigdio" <?= $disabled ?> />
				    <!--
				    <select id="proyecto-plan_presupuestal_recurso_0" class="form-control" name="Proyecto[planes_presupuestales_recursos][]" <?= $disabled ?>>
					<option value>seleccionar</option>
					<option value=1>Material</option>
					<option value=2>Humano</option>
				    </select>-->
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_como_conseguirlo_0 required" style="margin-top: 0px">
				    <select onchange="ComoConseguirlo($(this).val(),0)" id="proyecto-plan_presupuestal_como_conseguirlo_0" class="form-control" name="Proyecto[planes_presupuestales_comos_conseguirlos][]" <?= $disabled ?>>
					<option value>seleccionar</option>
					<option value=1>Pedir</option>
					<option value=2>Crear</option>
					<option value=3>Comprar</option>
				    </select>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_precio_unitario_0 required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_precio_unitario_0" onfocusout="Subtotal1(0,1)" class="form-control numerico" name="Proyecto[planes_presupuestales_precios_unitarios][]" placeholder="Precio unitario" <?= $disabled ?>/>
				    <input type="hidden" id="proyecto-plan_presupuestal_precio_unitario1_0"  class="form-control numerico" name="Proyecto[planes_presupuestales_precios_unitarios][]" />
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_cantidad_0 required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_cantidad_0" onfocusout="Subtotal2(0,2)" class="form-control numerico" name="Proyecto[planes_presupuestales_cantidades][]" placeholder="Cantidad" <?= $disabled ?>/>
				</div>
			    </td>
			    <td style="padding: 2px">
				<div class="form-group field-proyecto-plan_presupuestal_subtotal_0 required" style="margin-top: 0px">
				    <input id="proyecto-plan_presupuestal_subtotal1_0" class="form-control numerico" name="Proyecto[planes_presupuestales_subtotales1][]" placeholder="Subtotal" disabled/>
				    <input type="hidden" id="proyecto-plan_presupuestal_subtotal_0" class="form-control numerico" name="Proyecto[planes_presupuestales_subtotales][]" placeholder="Subtotal"  />
				</div>
			    </td>
			    <?php if($disabled==''){?>
			    <td style="padding: 2px">
				<!--<span class="remCF glyphicon glyphicon-minus-sign"></span>-->
			    </td>
			    <?php } ?>
			</tr>
		<?php $plan=1; ?>
		<?php } ?>
		<tr id='plan_presupuestal_<?= $plan ?>'></tr>
	    </tbody>
	</table>
	<?php if($disabled==''){?>
	<div  class="btn btn-default pull-right" onclick="InsertarPlanPresupuestal()">Agregar</div>
	<?php } ?>
	<!--<div class="btn btn-default pull-left" onclick="InsertarPlanPresupuestal()">Agregar</div>-->
    </div>
    <?php */ ?>
    <div class="clearfix"></div>

<?php
    $eliminarplanpresupuestal= Yii::$app->getUrlManager()->createUrl('actividad/eliminarplanpresupuestal');
    $cargatablapresupuesto= Yii::$app->getUrlManager()->createUrl('plan-presupuestal/cargatablapresupuesto');
?>
<script>
    
    
    var opciones_objetivos="<?= $opciones_objetivos ?>";
    function actividad(value,contador) {
	$.get( '<?= Yii::$app->urlManager->createUrl('plan-presupuestal/actividades?id=') ?>'+value, function( data ) {
	    $( '#proyecto-plan_presupuestal_actividad_'+contador ).html( data );
	});
    }
    
    $("#presupuesto").on('click',' .remCF',function(){
	
	
        var r = confirm("Estas seguro?");
        if (r == true) {
            id=$(this).children().val();
	
	    if (id) {
		$.ajax({
		    url: '<?= $eliminarplanpresupuestal ?>',
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
    
    var plan=0;
    function InsertarPlanPresupuestal() {
	var error='';
	plan=parseInt($("#contador").val());
	
	var planespresupuestalesrecursosdescripciones=$('input[name=\'Proyecto[planes_presupuestales_recursos_descripciones][]\']').length;
        
	for (var i=0; i<planespresupuestalesrecursosdescripciones; i++) {
	    console.log(planespresupuestalesrecursosdescripciones);
	    if($('#proyecto-plan_presupuestal_recurso_descripcion_'+i).val()=='')
            {
                error=error+'ingrese información en la fila #'+(i+1)+' de la columna recurso dscripción <br>';
                $('.field-proyecto-plan_presupuestal_recurso_descripcion_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-plan_presupuestal_recurso_descripcion_'+i).addClass('has-success');
                $('.field-proyecto-plan_presupuestal_recurso_descripcion_'+i).removeClass('has-error');
            }
	    
	    if($('#proyecto-plan_presupuestal_unidad_'+i).val()=='')
            {
                error=error+'ingrese información en la fila #'+(i+1)+' de la columna unidad <br>';
                $('.field-proyecto-plan_presupuestal_unidad_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-plan_presupuestal_unidad_'+i).addClass('has-success');
                $('.field-proyecto-plan_presupuestal_unidad_'+i).removeClass('has-error');
            }
	    
	    if($('#proyecto-plan_presupuestal_dirigido_'+i).val()=='')
            {
                error=error+'ingrese información en la fila #'+(i+1)+' de la columna a quien va dirigido <br>';
                $('.field-proyecto-plan_presupuestal_dirigido_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-plan_presupuestal_dirigido_'+i).addClass('has-success');
                $('.field-proyecto-plan_presupuestal_dirigido_'+i).removeClass('has-error');
            }
	    
	    if($('#proyecto-plan_presupuestal_como_conseguirlo_'+i).val()=='')
            {
                error=error+'ingrese información en la fila #'+(i+1)+' de la columna como conseguirlo <br>';
                $('.field-proyecto-plan_presupuestal_como_conseguirlo_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-plan_presupuestal_como_conseguirlo_'+i).addClass('has-success');
                $('.field-proyecto-plan_presupuestal_como_conseguirlo_'+i).removeClass('has-error');
            }
	    
	    /*if($('#proyecto-plan_presupuestal_precio_unitario_'+i).val()==3 &&  $('#proyecto-plan_presupuestal_precio_unitario_'+i).val()=='')
            {
                error=error+'ingrese información en la fila #'+(i+1)+' de la columna precio unitario<br>';
                $('.field-proyecto-plan_presupuestal_precio_unitario_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-plan_presupuestal_precio_unitario_'+i).addClass('has-success');
                $('.field-proyecto-plan_presupuestal_precio_unitario_'+i).removeClass('has-error');
            }*/
	    
	    if($('#proyecto-plan_presupuestal_cantidad_'+i).val()=='')
            {
                error=error+'ingrese información en la fila #'+(i+1)+' de la columna cantidad <br>';
                $('.field-proyecto-plan_presupuestal_cantidad_'+i).addClass('has-error');
            }
            else
            {
                $('.field-proyecto-plan_presupuestal_cantidad_'+i).addClass('has-success');
                $('.field-proyecto-plan_presupuestal_cantidad_'+i).removeClass('has-error');
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
	    $('#plan_presupuestal_'+plan).html(
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_recurso_descripcion_"+plan+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_recurso_descripcion_"+plan+"' class='form-control' name='Proyecto[planes_presupuestales_recursos_descripciones][]' placeholder='Recurso'  />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_unidad_"+plan+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_unidad_"+plan+"' class='form-control' name='Proyecto[planes_presupuestales_unidades][]' placeholder='Unidad'  />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_dirigido_"+plan+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_dirigido_"+plan+"' class='form-control' name='Proyecto[planes_presupuestales_dirigidos][]' placeholder='Dirigido' />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_como_conseguirlo_"+plan+"' required' style='margin-top: 0px'>"+
						"<select onchange='ComoConseguirlo($(this).val(),"+plan+")' id='proyecto-plan_presupuestal_como_conseguirlo_"+plan+"' class='form-control' name='Proyecto[planes_presupuestales_comos_conseguirlos][]'>"+
						    "<option value>seleccionar</option>"+
						    "<option value='1'>Pedir</option>"+
						    "<option value='2'>Crear</option>"+
						    "<option value='3'>Comprar</option>"+
						"</select>"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_precio_unitario_"+plan+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_precio_unitario_"+plan+"' onfocusout='Subtotal1("+plan+",1)' class='form-control' name='Proyecto[planes_presupuestales_precios_unitarios][]' placeholder='Precio unitario'>"+
						"<input type='hidden' id='proyecto-plan_presupuestal_precio_unitario1_"+plan+"'  class='form-control numerico' name='Proyecto[planes_presupuestales_precios_unitarios][]' />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_cantidad_"+plan+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_cantidad_"+plan+"' onfocusout='Subtotal2("+plan+",2)' class='form-control' name='Proyecto[planes_presupuestales_cantidades][]' placeholder='Cantidad' >"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_subtotal_"+plan+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_subtotal1_"+plan+"' class='form-control' name='Proyecto[planes_presupuestales_subtotales1][]' placeholder='Subtotal'  disabled>"+
						"<input type='hidden' id='proyecto-plan_presupuestal_subtotal_"+plan+"' class='form-control' name='Proyecto[planes_presupuestales_subtotales][]' placeholder='Subtotal' >"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<span class='remCF glyphicon glyphicon-minus-sign'>"+
					    "</span>"+
					"</td>");
	    $('#presupuesto').append('<tr id="plan_presupuestal_'+(plan+1)+'"><input type="hidden" id="contador" value="'+(plan+1)+'" ></tr>');
	    plan++;
	}
	return true;
    }
    
    
    
    $('.numerico').keypress(function (tecla) {
	var reg = /^[0-9\s]+$/;
	if(!reg.test(String.fromCharCode(tecla.which))){
	    return false;
	}
	return true;
    });		
    $('.texto').keypress(function(tecla) {
	var reg = /^[a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ'_\s]+$/;
	if(!reg.test(String.fromCharCode(tecla.which))){
	    return false;
	}
	return true;
    });
    var x=1;
    var y=1;
    function Subtotal1(id,tipo) {
	if (tipo==1) {
	    x=$('#proyecto-plan_presupuestal_precio_unitario_'+id).val();
	}
	if ($('#proyecto-plan_presupuestal_cantidad_'+id).val()!='') {
	    y=$('#proyecto-plan_presupuestal_cantidad_'+id).val();
	}
	
	var subtotal=x*y;
	$('#proyecto-plan_presupuestal_subtotal_'+id).val(subtotal);
	$('#proyecto-plan_presupuestal_subtotal1_'+id).val(subtotal);
	
    }
    
    function Subtotal2(id,tipo) {
	
	if (tipo==2) {
	    y=$('#proyecto-plan_presupuestal_cantidad_'+id).val();
	}
	
	if ($('#proyecto-plan_presupuestal_precio_unitario_'+id).val()!='') {
	    x=$('#proyecto-plan_presupuestal_precio_unitario_'+id).val();
	}
	var subtotal=x*y;
	$('#proyecto-plan_presupuestal_subtotal_'+id).val(subtotal);
	$('#proyecto-plan_presupuestal_subtotal1_'+id).val(subtotal);
    }
    
    function ComoConseguirlo(value,id) {
	if (value==1 || value==2)
	{
	    $('#proyecto-plan_presupuestal_precio_unitario_'+id).val("");
	    $('#proyecto-plan_presupuestal_precio_unitario_'+id).prop( "disabled", true );
	    $('#proyecto-plan_presupuestal_precio_unitario1_'+id).val("");
	}
	else
	{
	    $('#proyecto-plan_presupuestal_precio_unitario_'+id).prop( "disabled", false );
	}
    }
    
    
    function presupuesto(valor) {
	
	$.ajax({
	    url: '<?= $cargatablapresupuesto ?>',
	    type: 'GET',
	    async: true,
	    dataType: 'json',
	    data: {valor:valor},
	    success: function(data){
		var tebody="";
		var i=data[0];
		var select1="";
		var select2="";
		var select3="";
		
		if (data) {
		    data.splice(0,1);
		    $.each(data, function(i,star) {
			$("#proyecto-plan_presupuestal_como_conseguirlo_"+i+" selected").val(star.como_conseguirlo);
			if (star.como_conseguirlo==1) {
			    select1="selected";
			}
			if (star.como_conseguirlo==2) {
			    select2="selected";
			}
			if (star.como_conseguirlo==3) {
			    select3="selected";
			}
			tebody=tebody+"<tr id='plan_presupuestal_"+i+"'>"+
					"<td style='padding: 2px'>"+
					    
					    "<div class='form-group field-proyecto-plan_presupuestal_recurso_descripcion_"+i+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_recurso_descripcion_"+i+"' class='form-control' name='Proyecto[planes_presupuestales_recursos_descripciones][]' placeholder='Recurso' value='"+star.recurso_descripcion+"'  />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_unidad_"+i+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_unidad_"+i+"' class='form-control' name='Proyecto[planes_presupuestales_unidades][]' placeholder='Unidad' value='"+star.unidad+"'  />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_dirigido_"+i+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_dirigido_"+i+"' class='form-control' name='Proyecto[planes_presupuestales_dirigidos][]' placeholder='Dirigido' value='"+star.dirigido+"'  />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_como_conseguirlo_"+i+"' required' style='margin-top: 0px'>"+
						"<select onchange='ComoConseguirlo($(this).val(),"+i+")' id='proyecto-plan_presupuestal_como_conseguirlo_"+i+"' class='form-control' name='Proyecto[planes_presupuestales_comos_conseguirlos][]'>"+
						    "<option value>seleccionar</option>"+
						    "<option value='1' "+select1+">Pedir</option>"+
						    "<option value='2' "+select2+">Crear</option>"+
						    "<option value='3' "+select3+">Comprar</option>"+
						"</select>"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_precio_unitario_"+i+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_precio_unitario_"+i+"' onfocusout='Subtotal1("+i+",1)' class='form-control' name='Proyecto[planes_presupuestales_precios_unitarios][]' placeholder='Precio unitario' value='"+star.precio_unitario+"'>"+
						"<input type='hidden' id='proyecto-plan_presupuestal_precio_unitario1_"+i+"'  class='form-control numerico' name='Proyecto[planes_presupuestales_precios_unitarios][]' />"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_cantidad_"+i+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_cantidad_"+i+"' onfocusout='Subtotal2("+i+",2)' class='form-control' name='Proyecto[planes_presupuestales_cantidades][]' placeholder='Cantidad' value='"+star.cantidad+"'>"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<div class='form-group field-proyecto-plan_presupuestal_subtotal_"+i+"' required' style='margin-top: 0px'>"+
						"<input id='proyecto-plan_presupuestal_subtotal1_"+i+"' class='form-control' name='Proyecto[planes_presupuestales_subtotales1][]' placeholder='Subtotal' value='"+star.subtotal+"' disabled>"+
						"<input type='hidden' id='proyecto-plan_presupuestal_subtotal_"+i+"' class='form-control' name='Proyecto[planes_presupuestales_subtotales][]' placeholder='Subtotal' value='"+star.subtotal+"'>"+
					    "</div>"+
					"</td>"+
					"<td style='padding: 2px'>"+
					    "<span class='remCF glyphicon glyphicon-minus-sign'>"+
						"<input class='id' type='hidden' name='Proyecto[planes_presupuestal_ids][]' value='"+star.id+"' />"+
					    "</span>"+
					"</td>"+
				    "</tr>";
			   // idtr=i;
		    });
		    //console.log(idtr);
		    tebody=tebody+"<tr id='plan_presupuestal_"+i+"'><input type='hidden' id='contador' value='"+i+"' ></tr>"
		    
		}
		else
		{
		    tebody="<tr id='plan_presupuestal_0'>"+
				    "<td style='padding: 2px'>"+
					"<div class='form-group field-proyecto-plan_presupuestal_recurso_descripcion_0' required' style='margin-top: 0px'>"+
					    "<input id='proyecto-plan_presupuestal_recurso_descripcion_0' class='form-control' name='Proyecto[planes_presupuestales_recursos_descripciones][]' placeholder='Recurso'   />"+
					"</div>"+
				    "</td>"+
				    "<td style='padding: 2px'>"+
					"<div class='form-group field-proyecto-plan_presupuestal_unidad_0' required' style='margin-top: 0px'>"+
					    "<input id='proyecto-plan_presupuestal_unidad_0' class='form-control' name='Proyecto[planes_presupuestales_unidades][]' placeholder='Unidad'  />"+
					"</div>"+
				    "</td>"+
				    "<td style='padding: 2px'>"+
					"<div class='form-group field-proyecto-plan_presupuestal_dirigido_0' required' style='margin-top: 0px'>"+
					    "<input id='proyecto-plan_presupuestal_dirigido_0' class='form-control' name='Proyecto[planes_presupuestales_dirigidos][]' placeholder='Dirigido'   />"+
					"</div>"+
				    "</td>"+
				    "<td style='padding: 2px'>"+
					"<div class='form-group field-proyecto-plan_presupuestal_como_conseguirlo_0' required' style='margin-top: 0px'>"+
					    "<select onchange='ComoConseguirlo($(this).val(),0)' id='proyecto-plan_presupuestal_como_conseguirlo_0' class='form-control' name='Proyecto[planes_presupuestales_comos_conseguirlos][]'>"+
						"<option value>seleccionar</option>"+
						"<option value='1'>Pedir</option>"+
						"<option value='2'>Crear</option>"+
						"<option value='3'>Comprar</option>"+
					    "</select>"+
					"</div>"+
				    "</td>"+
				    "<td style='padding: 2px'>"+
					"<div class='form-group field-proyecto-plan_presupuestal_precio_unitario_0' required' style='margin-top: 0px'>"+
					    "<input id='proyecto-plan_presupuestal_precio_unitario_0' onfocusout='Subtotal1(0,1)' class='form-control' name='Proyecto[planes_presupuestales_precios_unitarios][]' placeholder='Precio unitario'>"+
					    "<input type='hidden' id='proyecto-plan_presupuestal_precio_unitario1_0'  class='form-control numerico' name='Proyecto[planes_presupuestales_precios_unitarios][]' />"+
					"</div>"+
				    "</td>"+
				    "<td style='padding: 2px'>"+
					"<div class='form-group field-proyecto-plan_presupuestal_cantidad_"+i+"' required' style='margin-top: 0px'>"+
					    "<input id='proyecto-plan_presupuestal_cantidad_0' onfocusout='Subtotal2(0,2)' class='form-control' name='Proyecto[planes_presupuestales_cantidades][]' placeholder='Cantidad' >"+
					"</div>"+
				    "</td>"+
				    "<td style='padding: 2px'>"+
					"<div class='form-group field-proyecto-plan_presupuestal_subtotal_0' required' style='margin-top: 0px'>"+
					    "<input id='proyecto-plan_presupuestal_subtotal1_0' class='form-control' name='Proyecto[planes_presupuestales_subtotales1][]' placeholder='Subtotal'disabled>"+
					    "<input type='hidden' id='proyecto-plan_presupuestal_subtotal_0' class='form-control' name='Proyecto[planes_presupuestales_subtotales][]' placeholder='Subtotal' >"+
					"</div>"+
				    "</td>"+
				    "<td style='padding: 2px'>"+
					"<span class='remCF glyphicon glyphicon-minus-sign'>"+
					"</span>"+
				    "</td>"+
				"</tr>"+
				"<tr id='plan_presupuestal_1'></tr>";
		}
		
			
		//console.log(tebody);
		$('#presupuesto_cuerpo').html(tebody);
		$('#presupuesto').show();
		$('#btn_presupuesto').show();
		
	    }
	});
    }
</script>
