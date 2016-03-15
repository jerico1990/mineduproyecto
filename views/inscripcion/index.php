<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Resultados;
use yii\widgets\Pjax;
use yii\web\JsExpression;


?>

<?php $form = ActiveForm::begin(); ?>
<h2>Inscripción de Nuevos Equipos</h2>
<hr class="colorgraph">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-5">
            <div class="form-group field-equipo-descripcion_equipo required">
                <label class="control-label" for="equipo-descripcion_equipo">Nombre de equipo: *</label>
                <input value="<?= $equipo->descripcion_equipo?>" type="text" id="equipo-descripcion_equipo" class="form-control texto" name="Equipo[descripcion_equipo]" placeholder="Nombre de equipo">
            </div>
        </div>
   
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-equipo-descripcion required">
            <label class="control-label" for="equipo-descripcion">Danos una breve descripción de tu equipo: *</label>
            <textarea  id="equipo-descripcion" class="form-control" name="Equipo[descripcion]"><?= $equipo->descripcion?>
            </textarea>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-equipo-asunto_id required">
            <label class="control-label" for="equipo-asunto_id">Asunto: *</label>
            <select id="equipo-asunto_id" class="form-control" name="Equipo[asunto_id]">
                <option value="">Seleccionar asunto</option>
                <?php
                    $resultados=Resultados::find()->all();
                    foreach($resultados as $resultado)
                    {
                        if($equipo->asunto_id==$resultado->asunto_id)
                        {
                            echo "<option value='$resultado->asunto_id' selected='selected'>$resultado->asunto_id</option>";
                        }
                        else
                        {
                            echo "<option value='$resultado->asunto_id'>$resultado->asunto_id</option>";
                        }
                    }
                ?>
                
            </select>
        </div>
    </div>
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-7 col-md-5">
        
        <div class="table-responsive">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th></th>
                        <th>N°</th>
                        <th>Participante</th>
                    </tr>
                    
                        <?php
                            $i=1;
                            foreach($estudiantes as $estudiante)
                            {
                                echo "<tr>
                                        <td><input name='Invitacion[invitacion_$i]' type='checkbox' value='$estudiante->id' onclick='validar($estudiante->id)'></td>
                                        <td><span id='snum'>$i</span></td>
                                        <td>$estudiante->nombres_apellidos</td>
                                </tr>";
                                 
                                $i++;
                            }
                        ?>
                       
                        
                        
                   
                </tbody>
            </table>
        </div>
       
    </div>
    <div class="clearfix"></div>
    <div class="modal-footer">
       <button type="submit" id="btnequipo" class="btn btn-primary">Guardar</button>
    </div>
    <?php ActiveForm::end(); ?>
</div> 




<?php
    $validarintegrante= Yii::$app->getUrlManager()->createUrl('equipo/validarintegrante');
    $validarintegrante2= Yii::$app->getUrlManager()->createUrl('equipo/validarintegrante2');
    
    $this->registerJs(
    "$('document').ready(function(){
        
        
        $( '#btnequipo' ).click(function( event ) {
            var error='';
            var bandera=true;
            if($('#equipo-descripcion_equipo').val()=='')
            {
                error=error+'ingrese descripcion del equipo <br>';
                $('.field-equipo-descripcion_equipo').addClass('has-error');
            }
            
            if($('#equipo-descripcion').val()=='')
            {
                error=error+'ingrese descripcion del proyecto <br>';
                $('.field-equipo-descripcion').addClass('has-error');
            }
            
            if($('#equipo-asunto_id').val()=='')
            {
                error=error+'ingrese asunto <br>';
                $('.field-equipo-asunto_id').addClass('has-error');
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
            /*
            function calledFromAjaxSuccess(result) {
                $.ajax({
                    url: '$validarintegrante2',
                    type: 'POST',
                    dataType: 'json',
                    data: $('#w0').serialize(),
                    success: function(key,value){
                        calledFromAjaxSuccess(false);
                        if(key[0]['bandera']==1)
                        {
                            $.notify({
                            // options
                            message: 'El invitado'+key[0]['nombres_apellidos']+' ya es miembro de un equipo' 
                            },{
                                // settings
                                type: 'danger',
                                z_index: 1000000,
                                placement: {
                                    from: 'bottom',
                                    align: 'right'
                                },
                            });
                        }
                    }
                });
            }
            return calledFromAjaxSuccess;*/
        });
    })");
?>

<script>
    function validar(id)
        {
            $.ajax({
                url: '<?= $validarintegrante ?>',
                type: 'GET',
                async: true,
                data: {id:id},
                success: function(data){
                    if(data==0)
                    {
                        $.notify({
                            // options
                            message: 'Oe ya pues, ya pertenece a un equipo no seas vivo por tu f5 :v ' 
                        },{
                            // settings
                            type: 'danger',
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
                }
            });
        }
</script>