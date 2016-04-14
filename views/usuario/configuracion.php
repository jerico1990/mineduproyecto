
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form yii\widgets\ActiveForm */
?>
<script src="../bootstrap-strength-meter-master/docs/js/prettify.js"></script>
<script src="../bootstrap-strength-meter-master/dist/js/bootstrap-strength-meter.js"></script>

<script src="../bootstrap-strength-meter-master/password-score/password-score.js"></script>
<script src="../bootstrap-strength-meter-master/password-score/password-score-options.js"></script>
<?php $form = ActiveForm::begin(); ?>
<div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-nombres required">
            <label class="control-label" for="registrar-nombres">Nombres: *</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-nombres" class="form-control texto" name="Registrar[nombres]" placeholder="Nombres" value="<?= $registrar->nombres ?>" required/>
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-apellido_paterno required">
            <label class="control-label" for="registrar-apellido_paterno">Apellido paterno: *</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-apellido_paterno" class="form-control texto" name="Registrar[apellido_paterno]" placeholder="Apellido paterno" value="<?= $registrar->apellido_paterno ?>" required/>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-apellido_materno required">
            <label class="control-label" for="registrar-apellido_materno">Apellido materno: *</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-apellido_materno" class="form-control texto" name="Registrar[apellido_materno]" placeholder="Apellido materno" value="<?= $registrar->apellido_materno ?>" required/>
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-sexo required">
            <label class="control-label" for="registrar-sexo">Sexo: *</label>
            <select id="registrar-sexo" class="form-control" name="Registrar[sexo]" required/>
                <option value="">Seleccionar sexo</option>
                <option value="F" <?= ($registrar->sexo=="F")?'selected':'' ?> >Femenino</option>
                <option value="M" <?= ($registrar->sexo=="M")?'selected':'' ?> >Masculino</option>
            </select>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-dni required">
            <label class="control-label" for="registrar-dni">DNI: *</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-dni" class="form-control numerico" name="Registrar[dni]" maxlength="8" placeholder="DNI" value="<?= $registrar->dni ?>">
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-fecha_nac required">
            <label class="control-label" for="registrar-fecha_nac">Fecha de nacimiento: *</label>
            <input type="date" onpaste="return false;" onCopy="return false" id="registrar-fecha_nac" class="form-control" name="Registrar[fecha_nac]" placeholder="Fecha de nacimiento" value="<?= $registrar->fecha_nac ?>">
        </div>
    </div>
    
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-email required">
            <label class="control-label" for="registrar-email">Correo electrónico: *</label>
            <input type="email" onpaste="return false;" onCopy="return false" id="registrar-email" class="form-control" name="Registrar[email]" placeholder="Correo electrónico" value="<?= $registrar->email ?>">
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-celular required">
            <label class="control-label" for="registrar-celular">N°  celular: *</label>
            <input type="text" onpaste="return false;" onCopy="return false" id="registrar-celular" class="form-control numerico" name="Registrar[celular]" maxlength="9" placeholder="N°  celular" value="<?= $registrar->celular ?>">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-password required">
            <label class="control-label" for="registrar-password">Contraseña: *</label>
            <input type="password" onpaste="return false;" onCopy="return false" id="registrar-password" class="form-control" name="Registrar[password]" placeholder="Contraseña">
        </div>      
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-repassword required">
            <label class="control-label" for="registrar-repassword">Repetir Contraseña: *</label>
            <input type="password" onpaste="return false;" onCopy="return false" id="registrar-repassword" class="form-control" name="Registrar[repassword]" placeholder="Repetir contraseña">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-12 col-md-9" id="example-progress-bar-container"></div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-md-12 pull-right">
        <input type="submit" id="registrar" value="Guardar" class="btn btn-primary" >
    </div>
    
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
        $('.field-registrar-celular').addClass('has-success');
        /*if ($('#registrar-celular').val()=='') {
            error=error+'Ingrese celular <br>';
            $('.field-registrar-celular').addClass('has-error');
        }
        else
        {
            $('.field-registrar-celular').addClass('has-success');
            $('.field-registrar-celular').removeClass('has-error');
        }*/
        $('.field-registrar-password').addClass('has-success');
        //$('.field-registrar-repassword').addClass('has-success');
        /*
        if ($('#registrar-password').val()=='') {
            error=error+'Ingrese contraseña <br>';
            $('.field-registrar-password').addClass('has-error');
        }
        else
        {
            $('.field-registrar-password').addClass('has-success');
            $('.field-registrar-password').removeClass('has-error');
        }
        */
        if ($('#registrar-password').val()!='' && $('#registrar-repassword').val()=='') {
            error=error+'Ingrese repetir contraseña <br>';
            $('.field-registrar-repassword').addClass('has-error');
        }
        else
        {
            $('.field-registrar-repassword').addClass('has-success');
            $('.field-registrar-repassword').removeClass('has-error');
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
        
        
        if($('#registrar-password').val()!='' && $('#registrar-password').val().length<8)
        {
            error=error+'La contraseña debe contener mínimo 8 caracteres <br>';
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