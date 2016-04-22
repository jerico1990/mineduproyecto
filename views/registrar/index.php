<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Ubigeo ;
use yii\web\JsExpression;
use yii\widgets\Pjax;
//var_dump($registrar->errors);
?>
<style>
.img-responsive {
    max-width: 100%;
    height: auto;
    display: block;
}
</style>
<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-strength-meter-master/docs/js/jquery-2.1.1.min.js"></script>
<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-strength-meter-master/docs/js/bootstrap-3.2.0.min.js"></script>
<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-strength-meter-master/docs/js/prettify.js"></script>
<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-strength-meter-master/dist/js/bootstrap-strength-meter.js"></script>

<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-strength-meter-master/password-score/password-score.js"></script>
<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-strength-meter-master/password-score/password-score-options.js"></script>



		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
		<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
		<script type="text/javascript" src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
                
                
<div class="col-xs-12 col-sm-3 col-md-3"></div>
<div class="col-xs-12 col-sm-6 col-md-6">
<?php $form = ActiveForm::begin(['options'=>['enctype'=>'multipart/form-data']]); ?>
<h1 class="text-center">Formulario de Inscripción</h1>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-8" style="padding-left:0px;padding-right:0px">
    <div class="col-xs-12 col-sm-12 col-md-12" style="padding-right:0px">
        <div class="form-group label-floating field-registrar-nombres required">
            <label for="registrar-nombres" class="control-label">Nombres</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-nombres" class="form-control texto" name="Registrar[nombres]" required/>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-6 col-md-6" style="padding-right:10px">
        <div class="form-group label-floating field-registrar-apellido_paterno required">
            <label class="control-label" for="registrar-apellido_paterno">Apellido paterno</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-apellido_paterno" class="form-control texto" name="Registrar[apellido_paterno]" required/>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6" style="padding-right:0px">
        <div class="form-group label-floating field-registrar-apellido_materno required">
            <label class="control-label" for="registrar-apellido_materno">Apellido materno</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-apellido_materno" class="form-control texto" name="Registrar[apellido_materno]" required/>
        </div>
    </div>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-4 text-center">
        <div class="form-group label-floating field-registrar-foto required">
            <input type="file" id="registrar-foto" class="form-control img-responsive" name="Registrar[foto]" onchange="Imagen($(this))" required/>
            <img id="img_destino" class="" style="height: 140px;width: 140px" src="../foto_personal/no_disponible.jpg">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group label-floating field-registrar-sexo required">
            <label class="control-label" for="registrar-sexo">Sexo</label>
            <select id="registrar-sexo" class="form-control" name="Registrar[sexo]" required/>
                <option value=""></option>
                <option value="F">Femenino</option>
                <option value="M">Masculino</option>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group label-floating field-registrar-dni required">
            <label class="control-label" for="registrar-dni">DNI</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-dni" class="form-control numerico" name="Registrar[dni]" maxlength="8">
        </div>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group  field-registrar-fecha_nac required form-control-wrapper">
            <input type="text" id="registrar-fecha_nac" class="form-control label-floating" name="Registrar[fecha_nac]" placeholder="Fecha de nacimiento">
        </div>
    </div>
    
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-8 col-md-8">
        <div class="form-group label-floating field-registrar-email required">
            <label class="control-label" for="registrar-email">Correo electrónico</label>
            <input type="email" onpaste="return false;" onCopy="return false" id="registrar-email" class="form-control" name="Registrar[email]">
        </div>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group label-floating field-registrar-celular required">
            <label class="control-label" for="registrar-celular">N°  celular</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-celular" class="form-control numerico" name="Registrar[celular]" maxlength="9" >
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-6 col-md-6">
        <div class="form-group label-floating field-registrar-password required">
            <label class="control-label" for="registrar-password">Contraseña</label>
            <input type="password" onpaste="return false;" onCopy="return false" id="registrar-password" class="form-control" name="Registrar[password]">
        </div>      
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6">
        <div class="form-group label-floating field-registrar-repassword required">
            <label class="control-label" for="registrar-repassword">Repetir Contraseña</label>
            <input type="password" onpaste="return false;" onCopy="return false" id="registrar-repassword" class="form-control" name="Registrar[repassword]">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-12 col-md-12" id="example-progress-bar-container"></div>
    <div class="clearfix"></div>
</div>
<h1>Datos de la Institución Educativa</h1>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group label-floating field-registrar-departamento required">
            <label class="control-label" for="registrar-departamento">Departamento</label>
            <select id="registrar-departamento" class="form-control" name="Registrar[departamento]" onchange='departamento($(this).val())'>
            <option value=""></option>
            <?php foreach(Ubigeo::find()->select('department_id,department')->groupBy('department')->all() as $departamento){ ?>
            <option value="<?= $departamento->department_id ?>"><?= $departamento->department ?></option>
            <?php } ?>
            </select>
        </div>
        
    </div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group label-floating field-registrar-provincia required">
            <label class="control-label" for="registrar-provincia">Provincia</label>
            <select id="registrar-provincia" class="form-control" name="Registrar[provincia]" onchange='provincia($(this).val())'>
            <option value=""></option>
            </select>
        </div>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group label-floating field-registrar-distrito required ">
            <label class="control-label" for="registrar-distrito">Distrito</label>
            <select id="registrar-distrito" class="form-control" name="Registrar[distrito]" onchange='distrito($(this).val())'>
                <option value=""></option>
            </select>
        </div>
    </div>
    
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-8 col-md-8">
        <div class="form-group label-floating field-registrar-institucion required">
            <label class="control-label" for="registrar-institucion">Institución</label>
            <select id="registrar-institucion" class="form-control" name="Registrar[institucion]">
                <option value=""></option>
            </select>
        </div>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group label-floating field-registrar-grado required">
            <label class="control-label" for="registrar-grado">Grado de estudios</label>
            <select id="registrar-grado" class="form-control" name="Registrar[grado]">
                <option value=""></option>
                <option value="1">1er</option>
                <option value="2">2do</option>
                <option value="3">3ro</option>
                <option value="4">3to</option>
                <option value="5">5to</option>
            </select>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="row pull-right">
    <div class="col-xs-12 col-md-12 pull-right">
        <input type="submit" id="registrar" value="Registrar" class="btn btn-raised btn-success" >
    </div>
    <div class="clearfix"></div>
</div>
<br>
<div class="clearfix"></div>
<?php ActiveForm::end(); ?>
</div>
<?php
    $validardni= Yii::$app->getUrlManager()->createUrl('registrar/validardni');
    $validaremail= Yii::$app->getUrlManager()->createUrl('registrar/validaremail');
?>

<script>
    
    
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
            mostrarImagen(elemento);
            return true;
        }
    }
    
    function mostrarImagen(input) {
        console.log(input);
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#img_destino').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#registrar-foto").change(function(){
        var ext = $('#registrar-foto').val().split('.').pop().toLowerCase();
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
            return false;
        }
        else
        {
            mostrarImagen(this);
            return true;
        }
        
        
    });
    
    
    $('#registrar-fecha_nac').bootstrapMaterialDatePicker({ weekStart : 0, time: false ,format : 'DD/MM/YYYY' });
    $('#registrar-password').focusout(function() {
        if($(this).val()!='')
        {
            if($(this).val().length<8)
            {
                $.notify({
                    // options
                    message: 'La contraseña debe contener mínimo 8 caracteres' 
                },{
                    // settings
                    type: 'danger',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                });
                $('.field-registrar-password').addClass('has-error');
            }
            else
            {
                $('.field-registrar-password').addClass('has-success');
                $('.field-registrar-password').removeClass('has-error');
            }
        }
    });
    $('#registrar-password').strengthMeter('progressBar', {
        
            container: $('#example-progress-bar-container'),
            
    });
    
    $( '#registrar-dni' ).focusout(function() {
        if($(this).val()!='')
        {
            if($(this).val().length<8)
            {
                $.notify({
                    // options
                    message: 'El DNI debe contener 8 caracteres' 
                },{
                    // settings
                    type: 'danger',
                    z_index: 1000000,
                    placement: {
                            from: 'bottom',
                            align: 'right'
                    },
                });
                $('.field-registrar-dni').addClass('has-error');
                $('#registrar-dni').val('');
                return false;
            }
            
            $.ajax({
                url: '<?= $validardni ?>',
                type: 'POST',
                async: true,
                data: {dni:$(this).val()},
                success: function(data){
                    if(data==1)
                    {
                        $('.field-registrar-dni').addClass('has-error');
                        $.notify({
                            // options
                            message: 'El DNI ya existe' 
                        },{
                            // settings
                            type: 'danger',
                            z_index: 1000000,
                            placement: {
                                    from: 'bottom',
                                    align: 'right'
                            },
                        });
                        $('#registrar-dni').val('');
                    }
                }
            });
            
        }
        return true;
    });
    
    
    $( '#registrar-email' ).focusout(function() {
        if($(this).val()!='')
        {
            
            $.ajax({
                url: '<?= $validaremail ?>',
                type: 'POST',
                async: true,
                data: {email:$(this).val()},
                success: function(data){
                    if(data==1)
                    {
                        $('.field-registrar-email').addClass('has-error');
                        $.notify({
                            // options
                            message: 'El email ya existe' 
                        },{
                            // settings
                            type: 'danger',
                            z_index: 1000000,
                            placement: {
                                    from: 'bottom',
                                    align: 'right'
                            },
                        });
                        $('#registrar-email').val('');
                    }
                }
            });
            
        }
        return true;
    });
    
    
    $( '#registrar-repassword' ).focusout(function() {
        if($('#registrar-repassword').val()!=$('#registrar-password').val())
        {
            $('.field-registrar-repassword').addClass('has-error');
            $.notify({
                // options
                message: 'La contraseña no es idéntica' 
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
        else
        {
            $('.field-registrar-repassword').addClass('has-success');
            $('.field-registrar-repassword').removeClass('has-error');
            return true;
        }
    });
    
    
   
    
    
    $('#registrar').click(function(){
        var error='';
        var p1=$('input[name=\'Registrar[p1][]\']:checked').length;
        var p2=$('input[type=radio]:checked').length;
        var p3=$('input[name=\'Registrar[p3][]\']:checked').length;
        var p4=$('input[name=\'Registrar[p4][]\']:checked').length;
        var p5=$('input[name=\'Registrar[p5][]\']:checked').length;
        var p6=$('input[name=\'Registrar[p6][]\']:checked').length;
        var ext = $('#registrar-foto').val().split('.').pop().toLowerCase();
        
            if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
                error=error+'Solo se permite subir archivos con extensiones .gif,.png,.jpg,.jpeg';
            }

        if ($('#registrar-nombres').val()=='') {
            error=error+'Ingrese nombres <br>';
            $('.field-registrar-nombres').addClass('has-error');
        }
        else
        {
            $('.field-registrar-nombres').addClass('has-success');
            $('.field-registrar-nombres').removeClass('has-error');
        }
        
        if ($('#registrar-apellido_paterno').val()=='') {
            error=error+'Ingrese su apellido paterno <br>';
            $('.field-registrar-apellido_paterno').addClass('has-error');
        }
        else
        {
            $('.field-registrar-apellido_paterno').addClass('has-success');
            $('.field-registrar-apellido_paterno').removeClass('has-error');
        }
        
        if ($('#registrar-apellido_materno').val()=='') {
            error=error+'Ingrese su apellido materno <br>';
            $('.field-registrar-apellido_materno').addClass('has-error');
        }
        else
        {
            $('.field-registrar-apellido_materno').addClass('has-success');
            $('.field-registrar-apellido_materno').removeClass('has-error');
        }
        
        if ($('#registrar-sexo').val()=='') {
            error=error+'Ingrese sexo <br>';
            $('.field-registrar-sexo').addClass('has-error');
        }
        else
        {
            $('.field-registrar-sexo').addClass('has-success');
            $('.field-registrar-sexo').removeClass('has-error');
        }
        
        if ($('#registrar-dni').val()=='') {
            error=error+'Ingrese dni <br>';
            $('.field-registrar-dni').addClass('has-error');
        }
        else
        {
            $('.field-registrar-dni').addClass('has-success');
            $('.field-registrar-dni').removeClass('has-error');
        }
        
        if ($('#registrar-fecha_nac').val()=='') {
            error=error+'Ingrese fecha de nacimiento <br>';
            $('.field-registrar-fecha_nac').addClass('has-error');
        }
        else
        {
            $('.field-registrar-fecha_nac').addClass('has-success');
            $('.field-registrar-fecha_nac').removeClass('has-error');
        }
        
        if ($('#registrar-email').val()=='') {
            error=error+'Ingrese email <br>';
            $('.field-registrar-email').addClass('has-error');
        }
        else
        {
            $('.field-registrar-email').addClass('has-success');
            $('.field-registrar-email').removeClass('has-error');
        }
        
        if($('#registrar-email').val()!='' && !validateEmail($('#registrar-email').val()))
        {
            error=error+'el usuario debe ser un correo <br>';
            $('.field-registrar-email').addClass('has-error');
        }
        
        if ($('#registrar-celular').val()=='') {
            error=error+'Ingrese celular <br>';
            $('.field-registrar-celular').addClass('has-error');
        }
        else
        {
            $('.field-registrar-celular').addClass('has-success');
            $('.field-registrar-celular').removeClass('has-error');
        }
        
        
        if ($('#registrar-password').val()=='') {
            error=error+'Ingrese contraseña <br>';
            $('.field-registrar-password').addClass('has-error');
        }
        else
        {
            $('.field-registrar-password').addClass('has-success');
            $('.field-registrar-password').removeClass('has-error');
        }
        
        if ($('#registrar-repassword').val()=='') {
            error=error+'Ingrese repetir contraseña <br>';
            $('.field-registrar-repassword').addClass('has-error');
        }
        else
        {
            $('.field-registrar-repassword').addClass('has-success');
            $('.field-registrar-repassword').removeClass('has-error');
        }
        
        if ($('#registrar-departamento').val()=='') {
            error=error+'Ingrese departamento <br>';
            $('.field-registrar-departamento').addClass('has-error');
        }
        else
        {
            $('.field-registrar-departamento').addClass('has-success');
            $('.field-registrar-departamento').removeClass('has-error');
        }
        
        if ($('#registrar-provincia').val()=='') {
            error=error+'Ingrese provincia <br>';
            $('.field-registrar-provincia').addClass('has-error');
        }
        else
        {
            $('.field-registrar-provincia').addClass('has-success');
            $('.field-registrar-provincia').removeClass('has-error');
        }
        
        if ($('#registrar-distrito').val()=='') {
            error=error+'Ingrese distrito <br>';
            $('.field-registrar-distrito').addClass('has-error');
        }
        else
        {
            $('.field-registrar-distrito').addClass('has-success');
            $('.field-registrar-distrito').removeClass('has-error');
        }
        
        if ($('#registrar-institucion').val()=='') {
            error=error+'Ingrese institución <br>';
            $('.field-registrar-institucion').addClass('has-error');
        }
        else
        {
            $('.field-registrar-institucion').addClass('has-success');
            $('.field-registrar-institucion').removeClass('has-error');
        }
        
        if ($('#registrar-grado').val()=='') {
            error=error+'Ingrese grado <br>';
            $('.field-registrar-grado').addClass('has-error');
        }
        else
        {
            $('.field-registrar-grado').addClass('has-success');
            $('.field-registrar-grado').removeClass('has-error');
        }
        
        /*
        if (p1==0) {
            error=error+'Seleccione al menos 1 opción en la primera pregunta <br>';
            $('.field-registrar-p1').addClass('has-error');
        }
        else
        {
            $('.field-registrar-p1').addClass('has-success');
            $('.field-registrar-p1').removeClass('has-error');
        }
        
        if (p2==0) {
            error=error+'Seleccione al menos 1 opción en la segunda pregunta <br>';
            $('.field-registrar-p2').addClass('has-error');
        }
        else
        {
            $('.field-registrar-p2').addClass('has-success');
            $('.field-registrar-p2').removeClass('has-error');
        }
        
        
        if (p3==0) {
            error=error+'Seleccione al menos 1 opción en la tercera pregunta <br>';
            $('.field-registrar-p3').addClass('has-error');
        }
        else
        {
            $('.field-registrar-p3').addClass('has-success');
            $('.field-registrar-p3').removeClass('has-error');
        }
        
        if (p4==0) {
            error=error+'Seleccione al menos 1 opción en la cuarta pregunta <br>';
            $('.field-registrar-p4').addClass('has-error');
        }
        else
        {
            $('.field-registrar-p4').addClass('has-success');
            $('.field-registrar-p4').removeClass('has-error');
        }
        
        if (p5==0) {
            error=error+'Seleccione al menos 1 opción en la quinta pregunta <br>';
            $('.field-registrar-p5').addClass('has-error');
        }
        else
        {
            $('.field-registrar-p5').addClass('has-success');
            $('.field-registrar-p5').removeClass('has-error');
        }
        
        if (p6==0) {
            error=error+'Seleccione al menos 1 opción en la sexta pregunta <br>';
            $('.field-registrar-p6').addClass('has-error');
        }
        else
        {
            $('.field-registrar-p6').addClass('has-success');
            $('.field-registrar-p6').removeClass('has-error');
        }
        */
        if($('#registrar-password').val()!='' && $('#registrar-password').val().length<8)
        {
            error=error+'La contraseña debe contener mínimo 8 caracteres <br>';
            /*$.notify({
                // options
                message: 'La contraseña debe contener mínimo 8 caracteres' 
            },{
                // settings
                type: 'danger',
                z_index: 1000000,
                placement: {
                        from: 'bottom',
                        align: 'right'
                },
            });*/
            $('.field-registrar-password').addClass('has-error');
        }
        
        if ($('#registrar-password').val()!='' && $('#registrar-repassword').val() && $('#registrar-password').val()!=$('#registrar-repassword').val()) {
            error=error+'Las contraseñas no son idénticas <br>';
            $('.field-registrar-password').addClass('has-error');
            $('.field-registrar-repassword').addClass('has-error');
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
        /*else
        {
            $.notify({
                message: 'Tus datos han sido registrados' 
            },{
                type: 'success',
                z_index: 1000000,
                placement: {
                    from: 'bottom',
                    align: 'right'
                },
            });
        }*/
        return true;
    });
    
    
    function validateEmail(sEmail) {
        var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (filter.test(sEmail)) {
            return true;
        }
        else {
            return false;
        }
    }
    
    function distrito(value) {
        $.post( "/mineduproyecto/web/ubigeo/instituciones?distrito="+value, function( data ) {
        $( "#registrar-institucion" ).html( data );});
    }
    
    function provincia(value) {
        $.post( "/mineduproyecto/web/ubigeo/distritos?provincia="+value, function( data ) {$( "#registrar-distrito" ).html( data );});
        $("#registrar-distrito").find("option").remove().end().append("<option value></option>").val("");
        $("#registrar-institucion").find("option").remove().end().append("<option value></option>").val("");
    }
    
    function departamento(value) {
        $.post( "/mineduproyecto/web/ubigeo/provincias?departamento="+value, function( data ) {$( "#registrar-provincia" ).html( data );});
        $("#registrar-provincia").find("option").remove().end().append("<option value></option>").val("");
        $("#registrar-distrito").find("option").remove().end().append("<option value></option>").val("");
        $("#registrar-institucion").find("option").remove().end().append("<option value></option>").val("");
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
</script>