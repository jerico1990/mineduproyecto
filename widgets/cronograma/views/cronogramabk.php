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
<h2>Registrar Cronograma</h2>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-5">
	<div class="form-group field-cronograma-medicion_tiempo required">
	    <label class="control-label" for="cronograma-medicion_tiempo">Medición: *</label>
	    <select type="text" id="cronograma-medicion_tiempo" class="form-control" name="Cronograma[medicion_tiempo]" >
		<option value>Seleccionar</option>
		<option value="1">Semana</option>
		<option value="2">Mes</option>
	    </select>
	</div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <table class="table table-bordered table-hover" id="tab_logic">
            <thead>
                <tr>
                    <th class="text-center">
                        #
                    </th>
                    <th class="text-center">
                        Actividad
                    </th>
		    <th class="text-center">
                        Fecha inicio
                    </th>
		    <th class="text-center">
                        Fecha fin
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
                        <div class="form-group field-cronograma-actividad_0 required">
                            <select type="text" id="cronograma-actividad_0" class="form-control" name="Cronograma[actividades][]" >
				<option value>Seleccionar</option>
				<?= $options ?>
			    </select>
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-cronograma-fecha_inicio_0 required">
                            <input type="date" id="cronograma-fecha_inicio_0" class="form-control" name="Cronograma[fechas_inicios][]" />
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-cronograma-fecha_fin_0 required">
                            <input type="date" id="cronograma-fecha_fin_0" class="form-control" name="Cronograma[fechas_fines][]" />
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
	if ($('#cronograma-actividad_'+(i-1)).val()=='') {
	    var error=error+'seleccione la '+i+' actividad <br>';
	    $('.field-cronograma-actividad_'+(i-1)).addClass('has-error');
	}
	
        if($('#cronograma-fecha_inicio_'+(i-1)).val()=='')
        {
            var error=error+'ingrese la fecha de inicio '+i+' <br>';
	    $('.field-cronograma-fecha_inicio_'+(i-1)).addClass('has-error');
        }
	
	if($('#cronograma-fecha_fin_'+(i-1)).val()=='')
        {
            var error=error+'ingrese la fecha de inicio '+i+' <br>';
	    $('.field-cronograma-fecha_fin_'+(i-1)).addClass('has-error');
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
            $('.field-cronograma-actividad_'+(i-1)).addClass('has-success');
            $('.field-cronograma-actividad_'+(i-1)).removeClass('has-error');
	    $('.field-cronograma-fecha_inicio_'+(i-1)).addClass('has-success');
            $('.field-cronograma-fecha_inicio_'+(i-1)).removeClass('has-error');
	    $('.field-cronograma-fecha_fin_'+(i-1)).addClass('has-success');
            $('.field-cronograma-fecha_fin_'+(i-1)).removeClass('has-error');
            $('#addr'+i).html("<td>"+ (i+1) +"</td>"+
			      "<td><div class='form-group field-cronograma-actividad_"+i+" required'><select id='cronograma-actividad_"+i+"' name='Cronograma[actividades][]' class='form-control'><option value>Seleccionar</option>"+options+"</select></div></td>"+
			      "<td><div class='form-group field-cronograma-fecha_inicio_"+i+" required'><input type='date' id='cronograma-fecha_inicio_"+i+"' class='form-control' name='Cronograma[fechas_inicios][]' /></div></td>"+
			      "<td><div class='form-group field-cronograma-fecha_fin_"+i+" required'><input type='date' id='cronograma-fecha_fin_"+i+"' class='form-control' name='Cronograma[fechas_fines][]' /></div></td>"+
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
        
        var fechas_inicios=$('input[name=\'Cronograma[fechas_inicios][]\']').length;
	
	if($('#cronograma-medicion_tiempo').val()=='')
	{
	    error=error+'ingrese la medición tiempo <br>';
	    $('.field-cronograma-medicion_tiempo').addClass('has-error');
	}
	else
	{
	    $('.field-cronograma-medicion_tiempo').addClass('has-success');
	    $('.field-cronograma-medicion_tiempo').removeClass('has-error');
	}
	    
	for (var i=0; i<fechas_inicios; i++) {
	    if($('#cronograma-actividad_'+i).val()=='')
	    {
		error=error+'ingrese si quiera '+i+' la actividad <br>';
		$('.field-cronograma-actividad_'+i).addClass('has-error');
	    }
	    else
	    {
		$('.field-cronograma-actividad_'+i).addClass('has-success');
		$('.field-cronograma-actividad_'+i).removeClass('has-error');
	    }
	    
	    if($('#cronograma-fecha_inicio_'+i).val()=='')
	    {
		error=error+'ingrese si quiera '+i+' la fecha inicio <br>';
		$('.field-cronograma-fecha_inicio_'+i).addClass('has-error');
	    }
	    else
	    {
		$('.field-cronograma-fecha_inicio_'+i).addClass('has-success');
		$('.field-cronograma-fecha_inicio_'+i).removeClass('has-error');
	    }
	    
	    if($('#cronograma-fecha_fin_'+i).val()=='')
	    {
		error=error+'ingrese si quiera '+i+' la fecha fin <br>';
		$('.field-cronograma-fecha_fin_'+i).addClass('has-error');
	    }
	    else
	    {
		$('.field-cronograma-fecha_fin_'+i).addClass('has-success');
		$('.field-cronograma-fecha_fin_'+i).removeClass('has-error');
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

