<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Ubigeo ;

//var_dump($registrar->errors);
?>

<?php $form = ActiveForm::begin(['options' => [],]); ?>
<h2>Inscripción</h2>
<hr class="colorgraph">
<div class="row">
    <?php if (Yii::$app->session->hasFlash('registrar')): ?>
    <div class="col-xs-12 col-sm-12 col-md-12">
        Gracias por Registrarte
    </div>
    <?php else: ?>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <?= Html::errorSummary($registrar, ['class' => 'errors alert alert-danger','role'=>'alert']) ?>
    </div>
    
    
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-nombres_apellidos required">
            <label class="control-label" for="registrar-nombres_apellidos">Nombres y apellidos: *</label>
            <input type="text" id="registrar-nombres_apellidos" class="form-control texto" name="Registrar[nombres_apellidos]" placeholder="Nombres y apellidos">
        </div>
        
        <?php /*= $form
            ->field($registrar, 'nombres_apellidos')
            ->textInput(['placeholder'=>'Nombres y apellidos','class' => 'form-control texto',])
            ->label('Nombres y apellidos: *')
            ->error(false)*/
        ?>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-sexo required">
            <label class="control-label" for="registrar-sexo">Sexo: *</label>
            <select id="registrar-sexo" class="form-control" name="Registrar[sexo]">
                <option value="">Seleccionar sexo</option>
                <option value="F">Femenino</option>
                <option value="M">Masculino</option>
            </select>
        </div>
        
        <?php /*= $form
            ->field($registrar, 'sexo')
            ->dropDownList(
                ['F'=>'Femenino','M'=>'Masculino'],
                ['prompt'=>'Seleccionar sexo'])
            ->label('Sexo: *')
            ->error(false);*/
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-dni required">
            <label class="control-label" for="registrar-dni">DNI: *</label>
            <input type="text" id="registrar-dni" class="form-control numerico" name="Registrar[dni]" maxlength="8" placeholder="DNI">
        </div>
        
        <?php /*= $form
            ->field($registrar, 'dni')
            ->textInput(['placeholder'=>'DNI','class' => 'form-control numerico','maxlength'=>8])
            ->label('DNI: *')
            ->error(false) */
        ?>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-fecha_nac required">
            <label class="control-label" for="registrar-fecha_nac">Fecha de nacimiento: *</label>
            <input type="date" id="registrar-fecha_nac" class="form-control" name="Registrar[fecha_nac]" placeholder="Fecha de nacimiento">
        </div>
        <?php  /*= $form
            ->field($registrar, 'fecha_nac')
            ->textInput(['type'=>'date','placeholder'=>'Fecha de nacimiento','class' => 'form-control'])
            ->label('Fecha de nacimiento: *')
            ->error(false) */
        ?>
    </div>
    
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-email required">
            <label class="control-label" for="registrar-email">Correo electrónico: *</label>
            <input type="email" id="registrar-email" class="form-control" name="Registrar[email]" placeholder="Correo electrónico">
        </div>
        <?php /*= $form
            ->field($registrar, 'email')
            ->textInput(['placeholder'=>'Correo electrónico','class' => 'form-control'])
            ->label('Correo electrónico: *')*/
        ?>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-celular required">
            <label class="control-label" for="registrar-celular">N°  celular: *</label>
            <input type="text" id="registrar-celular" class="form-control numerico" name="Registrar[celular]" maxlength="9" placeholder="N°  celular">
        </div>
        
        <?php /*= $form
            ->field($registrar, 'celular')
            ->textInput(['placeholder'=>'N°  celular','class' => 'form-control numerico','maxlength'=>9])
            ->label('N°  celular: *')
            ->error(false)*/
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <?= $form
            ->field($registrar, 'password')
            ->passwordInput(['placeholder'=>'Contraseña','class' => 'form-control'])
            ->label('Contraseña: *')
        ?>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <?= $form
            ->field($registrar, 'repassword')
            ->passwordInput(['placeholder'=>'Re contraseña','class' => 'form-control'])
            ->label('Re contraseña: *')
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-4 col-md-3">
        <?= $form
            ->field($registrar, 'departamento')
            ->dropDownList(
                ArrayHelper::map(Ubigeo::find()->select('department_id,department')->groupBy('department')->all(), 'department_id', 'department'),
                ['prompt'=>'Seleccionar departamento',
                'onchange'=>
                '$.post( "'.Yii::$app->urlManager->createUrl('ubigeo/provincias?departamento=').'"+$(this).val(), function( data ) {$( "#registrar-provincia" ).html( data );});
                 $("#registrar-provincia").find("option").remove().end().append("<option value>Provincia</option>").val("");
                 $("#registrar-distrito").find("option").remove().end().append("<option value>Distrito</option>").val("");
                 $("#registrar-institucion").find("option").remove().end().append("<option value>Institución</option>").val("");
                '])
            ->label('Departamento: *')
            ->error(false);
        ?>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-3">
        
        <?= $form
            ->field($registrar, 'provincia')
            ->dropDownList(
                [],
                ['prompt'=>'Seleccionar provincia',
                'onchange'=>
                '$.post( "'.Yii::$app->urlManager->createUrl('ubigeo/distritos?provincia=').'"+$(this).val(), function( data ) {$( "#registrar-distrito" ).html( data );});
                $("#registrar-distrito").find("option").remove().end().append("<option value>Distrito</option>").val("");
                $("#registrar-institucion").find("option").remove().end().append("<option value>Institución</option>").val("");
                '])
            ->label('Provincia: *')
            ->error(false);
        ?>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        
        <?= $form
            ->field($registrar, 'distrito')
            ->dropDownList(
                [],
                ['prompt'=>'Seleccionar distrito',
                'onchange'=>'$.post( "'.Yii::$app->urlManager->createUrl('ubigeo/instituciones?distrito=').'"+$(this).val(), function( data ) {
                $( "#registrar-institucion" ).html( data );});
                '])
            ->label('Distrito: *')
            ->error(false);
        ?>
    </div>
    
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <?= $form
            ->field($registrar, 'institucion')
            ->dropDownList(
                [],
                ['prompt'=>'Seleccionar institucion'])
            ->label('Institución: *')
            ->error(false);
        ?>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <?= $form
            ->field($registrar, 'grado')
            ->dropDownList(
                ['1'=>'1er','2'=>'2do','3'=>'3ro','4'=>'3to','5'=>'5to'],
                ['prompt'=>'Seleccionar grado'])
            ->label('Grado de estudios: *')
            ->error(false);
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-8 col-md-8">
        <?= $form->field($registrar, 'p1')
            ->checkboxList([0=>'Desde mi teléfono celular' ,
                            1=>'Desde una cabina de internet',
                            2=>'Desde la computadora y/o Tablet',
                            3=>'Desde las computadoras escuela'],
                            ['separator'=>'<br>',
                            'item'=>function ($index, $label, $name, $checked, $value){
                            $check = $checked ? ' checked="checked"' : '';
                            return "<input type='checkbox' name='$name' value='$value' $check> ".$label;
                            }])
            ->label('¿De qué manera planeas acceder a la plataforma?')
            ->error(false);
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <?= $form->field($registrar, 'p2')
                    ->radioList([1=>'Si',0=>'No'],
                    [
                        'item' => function($index, $label, $name, $checked, $value) {
                        $check = $checked ? ' checked="checked"' : '';
                        $return = '<span class="modal-radio">';
                        $return .= '<input type="radio" name="' . $name . '" value="' . $value . '" '.$check.'">';
                        $return .= '<span> ' . $label . '</span>';
                        $return .= '</span>';   
                        return $return; 
                    }])
                    ->label('¿Has desarrollado un proyecto participativo antes?')->error(false); ?>
        
    </div>
    <div class="col-xs-12 col-sm-4 col-md-5">
        
        <?= $form->field($registrar, 'p3')
            ->checkboxList([0=>'Contribuyó para mejorar mi escuela a comunidad' ,
                            1=>'Contribuyó para que mis ideas sean reconocidas',
                            2=>'Contribuyó para aprender cosas nuevas',
                            3=>'Contribuyó para para conocer mejor a mis compañeros',
                            4=>'No se completó',
                            5=>'No contribuyó'],
                            ['separator'=>'<br>',
                            'item'=>function ($index, $label, $name, $checked, $value){
                            $check = $checked ? ' checked="checked"' : '';
                            return "<input type='checkbox' name='$name' value='$value' $check> ".$label;
                            }])
            ->label('¿De qué manera contribuyó el Proyecto participativo?')
            ->error(false);
        ?>
    </div>
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-9 col-md-9">
        <?= $form->field($registrar, 'p4')
            ->checkboxList([0=>'Porque quiero mejorar algo en mi escuela' ,
                            1=>'Porque quiero mejorar algo en mi comunidad',
                            2=>'Porque quiero que mis ideas sean reconocidas',
                            3=>'Porque quiero aprender algo de manera diferente',
                            4=>'Porque quiero conocer experiencias de mi región y de otras regiones',
                            5=>'Porque me interesa usar la tecnología en mis aprendizajes'],
                            ['separator'=>'<br>',
                            'item'=>function ($index, $label, $name, $checked, $value){
                            $check = $checked ? ' checked="checked"' : '';
                            return "<input type='checkbox' name='$name' value='$value' $check> ".$label;
                            }])
            ->label('¿Por qué quieres participar del concurso?')
            ->error(false);
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-9 col-md-9">
        <?= $form->field($registrar, 'p5')
            ->checkboxList([0=>'En el aula de clases' ,
                            1=>'En tu casa',],
                            ['separator'=>'<br>',
                            'item'=>function ($index, $label, $name, $checked, $value){
                            $check = $checked ? ' checked="checked"' : '';
                            return "<input type='checkbox' name='$name' value='$value' $check> ".$label;
                            }])
            ->label('¿Dónde planeas trabajar con tu equipo de trabajo?')
            ->error(false);
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-9 col-md-9">
        <?= $form->field($registrar, 'p6')
            ->checkboxList([0=>'Durante clases' ,
                            1=>'Horas de recreo',
                            2=>'Después de la jornada escolar',
                            3=>'Fines de semana'],
                            ['separator'=>'<br>',
                            'item'=>function ($index, $label, $name, $checked, $value){
                            $check = $checked ? ' checked="checked"' : '';
                            return "<input type='checkbox' name='$name' value='$value' $check> ".$label;
                            }])
            ->label('¿Cuándo vas a trabajar con tu equipo de trabajo?')
            ->error(false);
        ?>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-md-6">
        <input type="submit" value="Inscribirse" class="btn btn-primary btn-block btn-lg" tabindex="7">
        <br>
    </div>
    <?php endif; ?>
</div>

<?php ActiveForm::end(); ?>



<?php

    $this->registerJs(
    "$('document').ready(function(){
        $('.numerico').keypress(function (tecla) {
            var reg = /^[0-9\s]+$/;
            if(!reg.test(String.fromCharCode(tecla.which))){
                return false;
            }
        });		
	$('.texto').keypress(function(tecla) {
            var reg = /^[a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ'_\s]+$/;
            if(!reg.test(String.fromCharCode(tecla.which))){
                return false;
            }      
        });
        $('#w0').submit(function(){
            
        });
        
    });");
?>