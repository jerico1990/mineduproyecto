<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\widgets\Pjax;
use yii\web\JsExpression;
?>
<?php $form = ActiveForm::begin(); ?>
    
    <div class="col-lg-12 col-md-12 col-xs-12">
        <div class="form-group label-floating field-loginform-username required">
            <label class="control-label" for="loginform-username">Correo electrónico</label>
            <input type="email" id="loginform-username" class="form-control" name="LoginForm[username]">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-lg-12 col-md-12 col-xs-12">
        <div class="form-group label-floating field-loginform-password required">
            <label class="control-label" for="loginform-password">Contraseña</label>
            <input type="password" id="loginform-password" class="form-control" name="LoginForm[password]">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-lg-12 col-md-12 col-xs-12">
        <div class="form-group text-center">
           <button id="ingresar" type="submit" class="btn btn-raised btn-success">Ingresar</button>
        </div>
         <hr>
    </div>
    <div class="clearfix"></div>
    <?php if($tipo==2 && $resultados){ ?>
    <div class="col-lg-12 col-md-12 col-xs-12 text-center">
        <u><?= Html::a('¿Olvido su contraseña?',['site/recuperar']);?></u>
    </div>
    
    <div class="col-lg-12 col-md-12 col-xs-12 text-center">
        <div class="form-group text-center">
        <p>¿Aún no te has apuntado?</p>
        <?= Html::a('Regístrate',['registrar/index'],['class'=>'btn btn-raised btn-success']);?>
        </div>
    </div>
    <?php } ?>
    <div class="clearfix"></div>
<?php ActiveForm::end(); ?>



<script>
    $("#ingresar").click(function(event){
        var error='';
        if($('#loginform-username').val()=='')
        {
            error=error+'ingrese su usuario <br>';
            $('.field-loginform-username').addClass('has-error');
        }
        else
        {
            $('.field-loginform-username').addClass('has-success');
            $('.field-loginform-username').removeClass('has-error');
        }
        
        if($('#loginform-username').val()!='' && !validateEmail($('#loginform-username').val()))
        {
            error=error+'el usuario debe ser un correo <br>';
            $('.field-loginform-username').addClass('has-error');
        }
        
        
        if($('#loginform-password').val()=='' )
        {
            error=error+'ingrese su contraseña <br>';
            $('.field-loginform-password').addClass('has-error');
        }
        else
        {
            $('.field-loginform-password').addClass('has-success');
            $('.field-loginform-password').removeClass('has-error');
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
</script>