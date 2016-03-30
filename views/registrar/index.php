<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Ubigeo ;
use yii\web\JsExpression;
use yii\widgets\Pjax;
//var_dump($registrar->errors);
?>
<script src="../bootstrap-strength-meter-master/docs/js/jquery-2.1.1.min.js"></script>
<script src="../bootstrap-strength-meter-master/docs/js/bootstrap-3.2.0.min.js"></script>
<script src="../bootstrap-strength-meter-master/docs/js/prettify.js"></script>
<script src="../bootstrap-strength-meter-master/dist/js/bootstrap-strength-meter.js"></script>

<script src="../bootstrap-strength-meter-master/password-score/password-score.js"></script>
<script src="../bootstrap-strength-meter-master/password-score/password-score-options.js"></script>
<?php $form = ActiveForm::begin(['options' => ['class' => 'formularios', ]]); ?>
<h2>Inscripción</h2>
<hr class="colorgraph">
<div class="row">
    <?php if (Yii::$app->session->hasFlash('registrar')): ?>
    <div class="col-xs-12 col-sm-12 col-md-12">
        Gracias por Registrarte
    </div>
    <?php else: ?>
    
    
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-nombres_apellidos required">
            <label class="control-label" for="registrar-nombres_apellidos">Nombres y apellidos: *</label>
            <input type="text" id="registrar-nombres_apellidos" class="form-control texto" name="Registrar[nombres_apellidos]" placeholder="Nombres y apellidos" required/>
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-sexo required">
            <label class="control-label" for="registrar-sexo">Sexo: *</label>
            <select id="registrar-sexo" class="form-control" name="Registrar[sexo]" required/>
                <option value="">Seleccionar sexo</option>
                <option value="F">Femenino</option>
                <option value="M">Masculino</option>
            </select>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-dni required">
            <label class="control-label" for="registrar-dni">DNI: *</label>
            <input type="text" id="registrar-dni" class="form-control numerico" name="Registrar[dni]" maxlength="8" placeholder="DNI">
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-fecha_nac required">
            <label class="control-label" for="registrar-fecha_nac">Fecha de nacimiento: *</label>
            <input type="date" id="registrar-fecha_nac" class="form-control" name="Registrar[fecha_nac]" placeholder="Fecha de nacimiento">
        </div>
    </div>
    
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-email required">
            <label class="control-label" for="registrar-email">Correo electrónico: *</label>
            <input type="email" id="registrar-email" class="form-control" name="Registrar[email]" placeholder="Correo electrónico">
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-celular required">
            <label class="control-label" for="registrar-celular">N°  celular: *</label>
            <input type="text" id="registrar-celular" class="form-control numerico" name="Registrar[celular]" maxlength="9" placeholder="N°  celular">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-password required">
            <label class="control-label" for="registrar-password">Contraseña: *</label>
            <input type="password" id="registrar-password" class="form-control" name="Registrar[password]" placeholder="Contraseña">
        </div>      
    </div>
    
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-repassword required">
            <label class="control-label" for="registrar-repassword">Repetir Contraseña: *</label>
            <input type="password" id="registrar-repassword" class="form-control" name="Registrar[repassword]" placeholder="Repetir contraseña">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-12 col-md-9" id="example-progress-bar-container"></div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-departamento required">
            <label class="control-label" for="registrar-departamento">Departamento: *</label>
            <select id="registrar-departamento" class="form-control" name="Registrar[departamento]" onchange='departamento($(this).val())'>
            <option value="">Seleccionar departamento</option>
            <?php foreach(Ubigeo::find()->select('department_id,department')->groupBy('department')->all() as $departamento){ ?>
            <option value="<?= $departamento->department_id ?>"><?= $departamento->department ?></option>
            <?php } ?>
            </select>
        </div>
        
    </div>
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-provincia required">
            <label class="control-label" for="registrar-provincia">Provincia: *</label>
            <select id="registrar-provincia" class="form-control" name="Registrar[provincia]" onchange='provincia($(this).val())'>
            <option value="">Seleccionar provincia</option>
            </select>
        </div>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-distrito required ">
            <label class="control-label" for="registrar-distrito">Distrito: *</label>
            <select id="registrar-distrito" class="form-control" name="Registrar[distrito]" onchange='distrito($(this).val())'>
                <option value="">Distrito</option><option value="021802">ACOCHACA</option></select>
        </div>
    </div>
    
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-institucion required">
            <label class="control-label" for="registrar-institucion">Institución: *</label>
            <select id="registrar-institucion" class="form-control" name="Registrar[institucion]"><option value="">Institución</option><option value="1027">0359570 - AGROPECUARIO YAUTAN</option></select>
        </div>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-grado required">
            <label class="control-label" for="registrar-grado">Grado de estudios: *</label>
            <select id="registrar-grado" class="form-control" name="Registrar[grado]">
                <option value="">Seleccionar grado</option>
                <option value="1">1er</option>
                <option value="2">2do</option>
                <option value="3">3ro</option>
                <option value="4">3to</option>
                <option value="5">5to</option>
            </select>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-8 col-md-8">
        <div class="form-group field-registrar-p1 required">
            <label class="control-label" for="registrar-p1">¿De qué manera planeas acceder a la plataforma?</label>
            <input type="hidden" name="Registrar[p1]" value="">
                <div id="registrar-p1">
                    <input type="checkbox" name="Registrar[p1][]" value="0"> Desde mi teléfono celular<br>
                    <input type="checkbox" name="Registrar[p1][]" value="1"> Desde una cabina de internet<br>
                    <input type="checkbox" name="Registrar[p1][]" value="2"> Desde la computadora y/o Tablet<br>
                    <input type="checkbox" name="Registrar[p1][]" value="3"> Desde las computadoras escuela</div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group field-registrar-p2 required">
            <label class="control-label" for="registrar-p2">¿Has desarrollado un proyecto participativo antes?</label>
            <input type="hidden" name="Registrar[p2]" value="">
                <div id="registrar-p2">
                    <span class="modal-radio">
                        <input type="radio" name="Registrar[p2]" value="1" "=""><span> Si</span>
                    </span>
                    <span class="modal-radio">
                        <input type="radio" name="Registrar[p2]" value="0" "=""><span> No</span>
                    </span>
                </div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-5">
        <div class="form-group field-registrar-p3 required">
            <label class="control-label" for="registrar-p3">¿De qué manera contribuyó el Proyecto participativo?</label>
            <input type="hidden" name="Registrar[p3]" value="">
                <div id="registrar-p3">
                    <input type="checkbox" name="Registrar[p3][]" value="0"> Contribuyó para mejorar mi escuela a comunidad<br>
                    <input type="checkbox" name="Registrar[p3][]" value="1"> Contribuyó para que mis ideas sean reconocidas<br>
                    <input type="checkbox" name="Registrar[p3][]" value="2"> Contribuyó para aprender cosas nuevas<br>
                    <input type="checkbox" name="Registrar[p3][]" value="3"> Contribuyó para para conocer mejor a mis compañeros<br>
                    <input type="checkbox" name="Registrar[p3][]" value="4"> No se completó<br>
                    <input type="checkbox" name="Registrar[p3][]" value="5"> No contribuyó</div>
        </div>  
    </div>
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-9 col-md-9">
        <div class="form-group field-registrar-p4 required">
            <label class="control-label" for="registrar-p4">¿Por qué quieres participar del concurso?</label>
            <input type="hidden" name="Registrar[p4]" value="">
                <div id="registrar-p4">
                    <input type="checkbox" name="Registrar[p4][]" value="0"> Porque quiero mejorar algo en mi escuela<br>
                    <input type="checkbox" name="Registrar[p4][]" value="1"> Porque quiero mejorar algo en mi comunidad<br>
                    <input type="checkbox" name="Registrar[p4][]" value="2"> Porque quiero que mis ideas sean reconocidas<br>
                    <input type="checkbox" name="Registrar[p4][]" value="3"> Porque quiero aprender algo de manera diferente<br>
                    <input type="checkbox" name="Registrar[p4][]" value="4"> Porque quiero conocer experiencias de mi región y de otras regiones<br>
                    <input type="checkbox" name="Registrar[p4][]" value="5"> Porque me interesa usar la tecnología en mis aprendizajes</div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-9 col-md-9">
        <div class="form-group field-registrar-p5 required">
            <label class="control-label" for="registrar-p5">¿Dónde planeas trabajar con tu equipo de trabajo?</label>
            <input type="hidden" name="Registrar[p5]" value="">
                <div id="registrar-p5">
                    <input type="checkbox" name="Registrar[p5][]" value="0"> En el aula de clases<br>
                    <input type="checkbox" name="Registrar[p5][]" value="1"> En tu casa
                </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-9 col-md-9">
        <div class="form-group field-registrar-p6 required">
            <label class="control-label" for="registrar-p6">¿Cuándo vas a trabajar con tu equipo de trabajo?</label>
            <input type="hidden" name="Registrar[p6]" value="">
                <div id="registrar-p6">
                    <input type="checkbox" name="Registrar[p6][]" value="0"> Durante clases<br>
                    <input type="checkbox" name="Registrar[p6][]" value="1"> Horas de recreo<br>
                    <input type="checkbox" name="Registrar[p6][]" value="2"> Después de la jornada escolar<br>
                    <input type="checkbox" name="Registrar[p6][]" value="3"> Fines de semana
                </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-md-6">
        <input type="submit" id="registrar" value="Inscribirse" class="btn btn-primary" >
        
    </div>
    
    <div class="clearfix"></div>
    <?php endif; ?>
</div>
<br>
<div class="clearfix"></div>
<?php ActiveForm::end(); ?>

<?php
    $validardni= Yii::$app->getUrlManager()->createUrl('registrar/validardni');
    $validaremail= Yii::$app->getUrlManager()->createUrl('registrar/validaremail');
?>

<script>
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
        
        if ($('#registrar-nombres_apellidos').val()=='') {
            error=error+'Ingrese nombres y apellidos <br>';
            $('.field-registrar-nombres_apellidos').addClass('has-error');
        }
        else
        {
            $('.field-registrar-nombres_apellidos').addClass('has-success');
            $('.field-registrar-nombres_apellidos').removeClass('has-error');
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
        $("#registrar-distrito").find("option").remove().end().append("<option value>Distrito</option>").val("");
        $("#registrar-institucion").find("option").remove().end().append("<option value>Institución</option>").val("");
    }
    
    function departamento(value) {
        $.post( "/mineduproyecto/web/ubigeo/provincias?departamento="+value, function( data ) {$( "#registrar-provincia" ).html( data );});
        $("#registrar-provincia").find("option").remove().end().append("<option value>Provincia</option>").val("");
        $("#registrar-distrito").find("option").remove().end().append("<option value>Distrito</option>").val("");
        $("#registrar-institucion").find("option").remove().end().append("<option value>Institución</option>").val("");
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