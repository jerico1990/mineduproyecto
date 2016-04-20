<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Resultados;
use yii\widgets\Pjax;
use yii\web\JsExpression;
$equipoid=0;
if($equipo->id)
{
    $equipoid=$equipo->id;
}
?>

<?php $form = ActiveForm::begin(['options'=>['enctype'=>'multipart/form-data']]); ?>
<h1>Mi equipo</h1>
<hr class="colorgraph">
    <div class="row">
        <div class="row col-xs-12 col-sm-8 col-md-8">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group label-floating field-equipo-descripcion_equipo required">
                    <label class="control-label" for="equipo-descripcion_equipo">Nombre de equipo</label>
                    <input value="<?= $equipo->descripcion_equipo?>" type="text" id="equipo-descripcion_equipo" class="form-control texto" name="Equipo[descripcion_equipo]">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group label-floating field-equipo-descripcion required">
                    <label class="control-label" for="equipo-descripcion">Danos una breve descripción de tu equipo</label>
                    <textarea  id="equipo-descripcion" class="form-control" name="Equipo[descripcion]"><?= $equipo->descripcion?></textarea>
                </div>
            </div>
        </div>
        <div class="row col-xs-12 col-sm-4 col-md-4 text-center">
            <div class="form-group label-floating field-equipo-foto_img required text-center">
                <label>Agrega una imagen para tu equipo</label>
                <input type="file" id="equipo-foto_img" class="form-control file" name="Equipo[foto_img]" onchange="Imagen($(this))">
                <?= Html::img('../foto_equipo/'.$equipo->foto,['id'=>'img_destino','class'=>'text-center', 'alt'=>'Responsive image','style'=>"height: 120px;width: 120px;align:center"]) ?>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-xs-12 col-sm-7 col-md-5">
            <div class="form-group label-floating field-equipo-asunto_id required">
                <label class="control-label" for="equipo-asunto_id">Selecciona el Asunto de Público sobre el que trabajará tu equipo</label>
                <select id="equipo-asunto_id" class="form-control" name="Equipo[asunto_id]">
                    <option value=""></option>
                    <?php
                        $resultados=Resultados::find()->where('region_id=:region_id',['region_id'=>$institucion->department_id])->all();
                        foreach($resultados as $resultado)
                        {
                            if($equipo->asunto_id==$resultado->asunto_id)
                            {
                                echo "<option value='$resultado->asunto_id' selected='selected'>".$resultado->asunto->descripcion_cabecera."</option>";
                            }
                            else
                            {
                                echo "<option value='$resultado->asunto_id'>".$resultado->asunto->descripcion_cabecera."</option>";
                            }
                        }
                    ?>
                    
                </select>
            </div>
        </div>
        
        <div class="clearfix"></div>
        <div class="col-xs-12 col-sm-12 col-md-12">
        <p>Selecciona a los miembros de tu equipo.</p>
        </div>
        <div class="clearfix"></div>
    
        <div class="col-xs-12 col-sm-12 col-md-12">
            
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr>
                            <th class="text-center"></th>
                            <th>Apellidos y Nombre</th>
                            <th>Grado</th>
                        </tr>
                            <?php
                                $i=1;
                                foreach($estudiantes as $estudiante)
                                {
                                    echo "<tr>
                                            <td class='text-center'><div class='checkbox'><label><input name='Equipo[invitaciones][]' type='checkbox' value='$estudiante->id' onclick='validar($estudiante->id,$equipoid,$(this))'><span class='checkbox-material'></span></label></div></td>
                                            
                                            <td>$estudiante->nombres $estudiante->apellido_paterno $estudiante->apellido_materno</td>
                                            <td>$estudiante->grado</td>
                                    </tr>";
                                     
                                    $i++;
                                }
                            ?>
                           
                            
                            
                       
                    </tbody>
                </table>
           
        </div>
        <div class="clearfix"></div>
        <div class="modal-footer">
           <button type="submit" id="btnequipo" class="btn btn-raised btn-success"><?= $equipo->isNewRecord ? Yii::t('app', 'Crear equipo') : Yii::t('app', 'Modificar equipo') ?></button>
        </div>
    <?php ActiveForm::end(); ?>
</div> 




<?php
    //$validarintegrante= Yii::$app->getUrlManager()->createUrl('equipo/validarintegrante');
    $validarinvitacioneintegrante= Yii::$app->getUrlManager()->createUrl('equipo/validarinvitacioneintegrante');
    $validarinvitacioneintegrante2= Yii::$app->getUrlManager()->createUrl('equipo/validarinvitacioneintegrante2');
    $validarintegrante2= Yii::$app->getUrlManager()->createUrl('equipo/validarintegrante2');
    $existeequipo=Yii::$app->getUrlManager()->createUrl('equipo/existeequipo');
    
    $this->registerJs(
    "$('document').ready(function(){
        
        
        
    })");
?>

<script>
    function mostrarImagen(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#img_destino').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function Imagen(elemento) {
        var ext = elemento.val().split('.').pop().toLowerCase();
        var error='';
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
            error=error+'Solo se permite subir archivos con extensiones .gif,.png,.jpg,.jpeg';
        }
        if (error!='') {
            /*$.notify({
                message: error
            },{
                // settings
                type: 'danger',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });*/
            //fileupload = $('#equipo-foto_img');  
            //fileupload.replaceWith($fileupload.clone(true));
            elemento.replaceWith(elemento.val('').clone(true));
            //$('#equipo-foto_img').val('');
            return false;
        }
        else
        {
            mostrarImagen($('#equipo-foto_img'));
            return true;
        }
    }
    
    $("#equipo-foto_img").change(function(){
        var ext = $('#equipo-foto_img').val().split('.').pop().toLowerCase();
        var error='';
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
            error=error+'Solo se permite subir archivos con extensiones .gif,.png,.jpg,.jpeg';
        }
        if (error!='') {
            $.notify({
                message: error
            },{
                // settings
                type: 'danger',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });
            //fileupload = $('#equipo-foto_img');  
            //fileupload.replaceWith($fileupload.clone(true));
            $('#equipo-foto_img').replaceWith($('#equipo-foto_img').val('').clone(true));
            //$('#equipo-foto_img').val('');
            return false;
        }
        else
        {
            mostrarImagen(this);
            return true;
        }
        
    });
    
    var contador=<?= $invitacionContador ?>;
    console.log(contador);
    var equipo=<?= $invitacionContador ?>;
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
        
        
        if (equipo==0)
        {
            var existeequipo=$.ajax({
                url: '<?= $existeequipo ?>',
                //type: 'GET',
                async: false,
                //data: {},
                success: function(data){
                    
                }
            });
            
            if (existeequipo.responseText==1) {
                $.notify({
                    // options
                    message: 'Ya creastes un equipo' 
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
                return false;
            }
        }
        else
        {
            var estudiantes = $('input[name="Equipo[invitaciones][]"]:checked').map(function(){ 
                    return this.value; 
                }).get();
            var validarestudiantes=$.ajax({
                url: '<?= $validarinvitacioneintegrante2 ?>',
                type: 'POST',
                async: false,
                data: {'Equipo[invitaciones][]':estudiantes,'Equipo[id]':<?= $equipoid ?>,'Equipo[tipo]':1},
                success: function(data){
                    
                }
            });
            //console.log(validarestudiantes.responseText);
            //return false;
            if (validarestudiantes.responseText==1) {
                
                $.ajax({
                    url: '<?= $validarinvitacioneintegrante2 ?>',
                    type: 'POST',
                    async: true,
                    data: {'Equipo[invitaciones][]':estudiantes,'Equipo[id]':<?= $equipoid ?>,'Equipo[tipo]':2},
                    success: function(data){
                        $.notify({
                            // options
                            message: data 
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
                }); 
                return false;
            }
            
        }
        
           
        
        return true;
    });
    
    function validar(estudiante,equipo,elemento)
    {
        var invitaciones=($('input[name=\'Equipo[invitaciones][]\']:checked').length) + contador;
        console.log(invitaciones);
        if (invitaciones>=6) {
            elemento.prop( "checked", false );
            $.notify({
                // options
                message: 'No puede realizar mas invitaciones' 
            },{
                // settings
                type: 'danger',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });
            return false;
        }
        
        $.ajax({
            url: '<?= $validarinvitacioneintegrante ?>',
            type: 'GET',
            async: true,
            data: {estudiante:estudiante,equipo:equipo},
            success: function(data){
                if(data==1)
                {
                    $.notify({
                        // options
                        message: 'Ya pertenece a un equipo ' 
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
                else if (data==2)
                {
                    $.notify({
                        // options
                        message: 'Ya le has enviado una invitación ' 
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
                else if (data==3)
                {
                    $.notify({
                        // options
                        message: 'Solo se permite 4 invitaciones como máximo' 
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
        return true;
    }
</script>