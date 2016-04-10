<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

use yii\widgets\Pjax;
use yii\web\JsExpression;

/* @var $this \yii\web\View */
/* @var $user \common\models\LoginForm */
/* @var $title string */
$options='';
foreach($actividades as $actividad){ 
    $options=$options.'<option value="'.$actividad->id.'">'.$actividad->descripcion.'</option>';
}

?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<?php $form = ActiveForm::begin(); ?>
<h2>Registrar Plan presupuestal</h2>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <table class="table table-bordered table-hover" id="tab_logic">
            <thead>
                <tr>
                    <th class="text-center"  rowspan="2" style="vertical-align: middle">
                        #
                    </th>
                    <th class="text-center"  rowspan="2" style="vertical-align: middle">
                        Actividad
                    </th>
		    <th class="text-center" colspan="2">
                        Recursos
                    </th>
		    <th class="text-center" colspan="2">
                        Precio
                    </th>
		    <th>
			
		    </th>
                </tr>
		<tr>
		    <th class="text-center">
                        Humanos
                    </th>
		    <th class="text-center">
                        Materiales
                    </th>
		    <th class="text-center">
                        Unitario
                    </th>
		    <th class="text-center">
                        Subtotal
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
                        <div class="form-group field-planpresupuestal-actividad_0 required">
                            <select type="text" id="planpresupuestal-actividad_0" class="form-control" name="PlanPresupuestal[actividades][]" >
				<option value>Seleccionar</option>
				<?= $options ?>
			    </select>
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-planpresupuestal-cantidad_rrhh_0 required">
                            <input type="text" id="planpresupuestal-cantidad_rrhh_0" class="form-control" name="PlanPresupuestal[cantidades_rrhhs][]" />
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-planpresupuestal-cantidad_material_0 required">
                            <input type="text" id="planpresupuestal-cantidad_material_0" class="form-control" name="PlanPresupuestal[cantidades_materiales][]" />
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-planpresupuestal-precio_unitario_0 required">
                            <input type="text" id="planpresupuestal-precio_unitario_0" class="form-control" name="PlanPresupuestal[precios_unitarios][]" />
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-planpresupuestal-subtotal_0 required">
                            <input type="text" id="planpresupuestal-subtotal_0" class="form-control" name="PlanPresupuestal[subtotales][]" />
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
        <a id='delete_row' class="pull-right btn btn-default">Delete Row</a>
        <br>
    </div>
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
    var i=1;
    var options='<?= $options ?>';
    
    $("#tab_logic").on('click','.remCF',function(){
        $(this).parent().parent().remove();
    });
    
    $("#add_row").click(function(){
	var error='';
	if ($('#planpresupuestal-actividad_'+(i-1)).val()=='') {
	    var error=error+'seleccione la '+i+' actividad <br>';
	    $('.field-planpresupuestal-actividad_'+(i-1)).addClass('has-error');
	}
	
        if($('#planpresupuestal-cantidad_rrhh_'+(i-1)).val()=='')
        {
            var error=error+'ingrese la cantidad de rrhh '+i+' <br>';
	    $('.field-planpresupuestal-cantidad_rrhh_'+(i-1)).addClass('has-error');
        }
	
	if($('#planpresupuestal-cantidad_material_'+(i-1)).val()=='')
        {
            var error=error+'ingrese la cantidad de material '+i+' <br>';
	    $('.field-planpresupuestal-cantidad_material_'+(i-1)).addClass('has-error');
        }
	
	if($('#planpresupuestal-precio_unitario_'+(i-1)).val()=='')
        {
            var error=error+'ingrese el precio unitario '+i+' <br>';
	    $('.field-planpresupuestal-precio_unitario_'+(i-1)).addClass('has-error');
        }
	
	if($('#planpresupuestal-subtotal_'+(i-1)).val()=='')
        {
            var error=error+'ingrese el subtotal '+i+' <br>';
	    $('.field-planpresupuestal-subtotal_'+(i-1)).addClass('has-error');
        }
	
	if (error!='')
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
            $('.field-planpresupuestal-actividad_'+(i-1)).addClass('has-success');
            $('.field-planpresupuestal-actividad_'+(i-1)).removeClass('has-error');
	    $('.field-planpresupuestal-cantidad_rrhh_'+(i-1)).addClass('has-success');
            $('.field-planpresupuestal-cantidad_rrhh_'+(i-1)).removeClass('has-error');
	    $('.field-planpresupuestal-cantidad_material_'+(i-1)).addClass('has-success');
            $('.field-planpresupuestal-cantidad_material_'+(i-1)).removeClass('has-error');
	    $('.field-planpresupuestal-precio_unitario_'+(i-1)).addClass('has-success');
            $('.field-planpresupuestal-precio_unitario_'+(i-1)).removeClass('has-error');
	    $('.field-planpresupuestal-subtotal_'+(i-1)).addClass('has-success');
            $('.field-planpresupuestal-subtotal_'+(i-1)).removeClass('has-error');
            $('#addr'+i).html("<td>"+ (i+1) +"</td>"+
			      "<td><div class='form-group field-planpresupuestal-actividad_"+i+" required'><select id='planpresupuestal-actividad_"+i+"' name='PlanPresupuestal[actividades][]' class='form-control'><option value>Seleccionar</option>"+options+"</select></div></td>"+
			      "<td><div class='form-group field-planpresupuestal-cantidad_rrhh_"+i+" required'><input type='text' id='planpresupuestal-cantidad_rrhh_"+i+"' class='form-control' name='PlanPresupuestal[cantidades_rrhhs][]' /></div></td>"+
			      "<td><div class='form-group field-planpresupuestal-cantidad_material_"+i+" required'><input type='text' id='planpresupuestal-cantidad_material_"+i+"' class='form-control' name='PlanPresupuestal[cantidades_materiales][]' /></div></td>"+
			      "<td><div class='form-group field-planpresupuestal-precio_unitario_"+i+" required'><input type='text' id='planpresupuestal-precio_unitario_"+i+"' class='form-control' name='PlanPresupuestal[precios_unitarios][]' /></div></td>"+
			      "<td><div class='form-group field-planpresupuestal-subtotal_"+i+" required'><input type='text' id='planpresupuestal-subtotal_"+i+"' class='form-control' name='PlanPresupuestal[subtotales][]' /></div></td>"+
			      "<td><span class='remCF glyphicon glyphicon-minus-sign'></span></td>");
            $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
            i++;
        }
        return true;
    });
    
    
    $("#delete_row").click(function(){
        if(i>1){
            $("#addr"+(i-1)).html('');
            i--;
        }
    });
    
    
    
    $("#btnproyecto").click(function(event){
        var error='';
        
        var cantidades_rrhhs=$('input[name=\'PlanPresupuestal[cantidades_rrhhs][]\']').length;
	 
	for (var i=0; i<cantidades_rrhhs; i++) {
	    if($('#planpresupuestal-actividad_'+i).val()=='')
	    {
		error=error+'ingrese si quiera '+i+' la actividad <br>';
		$('.field-planpresupuestal-actividad_'+i).addClass('has-error');
	    }
	    else
	    {
		$('.field-planpresupuestal-actividad_'+i).addClass('has-success');
		$('.field-planpresupuestal-actividad_'+i).removeClass('has-error');
	    }
	    
	    if($('#planpresupuestal-cantidad_rrhh_'+i).val()=='')
	    {
		error=error+'ingrese si quiera '+i+' la fecha inicio <br>';
		$('.field-planpresupuestal-cantidad_rrhh_'+i).addClass('has-error');
	    }
	    else
	    {
		$('.field-planpresupuestal-cantidad_rrhh_'+i).addClass('has-success');
		$('.field-planpresupuestal-cantidad_rrhh_'+i).removeClass('has-error');
	    }
	    
	    if($('#planpresupuestal-fecha_fin_'+i).val()=='')
	    {
		error=error+'ingrese si quiera '+i+' la fecha fin <br>';
		$('.field-planpresupuestal-fecha_fin_'+i).addClass('has-error');
	    }
	    else
	    {
		$('.field-planpresupuestal-fecha_fin_'+i).addClass('has-success');
		$('.field-planpresupuestal-fecha_fin_'+i).removeClass('has-error');
	    }
	}	
	
        
    
        
        
        //var objetivos_especificos=$('input[name=\'Proyecto[objetivos_especificos][]\']:checked').length;
        
        
        
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
    

</script>

