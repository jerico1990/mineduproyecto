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
foreach($objetivosespecificos as $objetivoespecifico){ 
    $options=$options.'<option value="'.$objetivoespecifico->id.'">'.$objetivoespecifico->descripcion.'</option>';
}

?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<?php $form = ActiveForm::begin(); ?>
<h2>Registrar Actividades</h2>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <table class="table table-bordered table-hover" id="tab_logic">
            <thead>
                <tr>
                    <th class="text-center">
                        #
                    </th>
                    <th class="text-center">
                        Objetivo especifico
                    </th>
		    <th class="text-center">
                        Actividad
                    </th>
		    <th class="text-center">
                        Resultado esperado
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
                        <div class="form-group field-actividad-objetivos_especificos_0 required">
                            <select type="text" id="actividad-objetivos_especificos_0" class="form-control" name="Actividad[objetivos_especificos][]" >
				<option value>Seleccionar</option>
				<?= $options ?>
			    </select>
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-actividad-actividades_0 required">
                            <input type="text" id="actividad-actividades_0" class="form-control" name="Actividad[actividades][]" placeholder="Actividad" maxlength="30" title="Máximo 30 palabras"/>
                        </div>
                    </td>
		    <td>
                        <div class="form-group field-actividad-resultados_esperados_0 required">
                            <input type="text" id="actividad-resultados_esperados_0" class="form-control" name="Actividad[resultados_esperados][]" placeholder="Resultado esperado" maxlength="15" title="Máximo 15 palabras"/>
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
	if ($('#actividad-objetivos_especificos_'+(i-1)).val()=='') {
	    var error=error+'seleccione el '+i+' objetivo <br>';
	    $('.field-actividad-objetivos_especificos_'+(i-1)).addClass('has-error');
	}
	
        if($('#actividad-actividades_'+(i-1)).val()=='')
        {
            var error=error+'ingrese la '+i+' actividad <br>';
	    $('.field-actividad-actividades_'+(i-1)).addClass('has-error');
        }
	
	if($('#actividad-resultados_esperados_'+(i-1)).val()=='')
        {
            var error=error+'ingrese el '+i+' resultado esperado <br>';
	    $('.field-actividad-resultados_esperados_'+(i-1)).addClass('has-error');
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
            $('.field-actividad-objetivos_especificos_'+(i-1)).addClass('has-success');
            $('.field-actividad-objetivos_especificos_'+(i-1)).removeClass('has-error');
	    $('.field-actividad-actividades_'+(i-1)).addClass('has-success');
            $('.field-actividad-actividades_'+(i-1)).removeClass('has-error');
	    $('.field-actividad-resultados_esperados_'+(i-1)).addClass('has-success');
            $('.field-actividad-resultados_esperados_'+(i-1)).removeClass('has-error');
            $('#addr'+i).html("<td>"+ (i+1) +"</td>"+
			      "<td><div class='form-group field-actividad-objetivos_especificos_"+i+" required'><select id='actividad-objetivos_especificos_"+i+"' name='Actividad[objetivos_especificos][]' class='form-control'><option value>Seleccionar</option>"+options+"</select></div></td>"+
			      "<td><div class='form-group field-actividad-actividades_"+i+" required'><input type='text' id='actividad-actividades_"+i+"' class='form-control' name='Actividad[actividades][]' placeholder='Actividad' maxlength='30' title='Máximo 30 palabras'/></div></td>"+
			      "<td><div class='form-group field-actividad-resultados_esperados_"+i+" required'><input type='text' id='actividad-resultados_esperados_"+i+"' class='form-control' name='Actividad[resultados_esperados][]' placeholder='Resultado esperado' maxlength='15' title='Máximo 15 palabras'/></div></td>"+
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
        
        var actividades=$('input[name=\'Actividad[actividades][]\']').length;
	
	    for (var i=0; i<actividades; i++) {
		if($('#actividad-objetivos_especificos_'+i).val()=='')
		{
		    error=error+'ingrese si quiera '+i+' objetivo especifico <br>';
		    $('.field-actividad-objetivos_especificos_'+i).addClass('has-error');
		}
		else
		{
		    $('.field-actividad-objetivos_especificos_'+i).addClass('has-success');
		    $('.field-actividad-objetivos_especificos_'+i).removeClass('has-error');
		}
		
		if($('#actividad-actividades_'+i).val()=='')
		{
		    error=error+'ingrese si quiera '+i+' objetivo especifico <br>';
		    $('.field-actividad-actividades_'+i).addClass('has-error');
		}
		else
		{
		    $('.field-actividad-actividades_'+i).addClass('has-success');
		    $('.field-actividad-actividades_'+i).removeClass('has-error');
		}
		
		if($('#actividad-resultados_esperados_'+i).val()=='')
		{
		    error=error+'ingrese si quiera '+i+' objetivo especifico <br>';
		    $('.field-actividad-resultados_esperados_'+i).addClass('has-error');
		}
		else
		{
		    $('.field-actividad-resultados_esperados_'+i).addClass('has-success');
		    $('.field-actividad-resultados_esperados_'+i).removeClass('has-error');
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

