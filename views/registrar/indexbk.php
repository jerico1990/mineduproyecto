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
<?php $form = ActiveForm::begin(); ?>
<div ng-controller="RegistrarController">

<h1>Registro de estudiantes</h1>
<hr class="colorgraph">

<div class="row" >
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-nombres ">
            <label class="control-label" for="registrar-nombres">Nombres: *</label>
            <input ng-model="registrar.nombres" type="text" onpaste="return false;" onCopy="return false" id="registrar-nombres" class="form-control texto" name="Registrar[nombres]" placeholder="Nombres" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-apellido_paterno ">
            <label class="control-label" for="registrar-apellido_paterno">Apellido paterno: *</label>
            <input ng-model="registrar.apellido_paterno" type="text" onpaste="return false;" onCopy="return false" id="registrar-apellido_paterno" class="form-control texto" name="Registrar[apellido_paterno]" placeholder="Apellido paterno" />
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-apellido_materno ">
            <label class="control-label" for="registrar-apellido_materno">Apellido materno: *</label>
            <input ng-model="registrar.apellido_materno" type="text" onpaste="return false;" onCopy="return false" id="registrar-apellido_materno" class="form-control texto" name="Registrar[apellido_materno]" placeholder="Apellido materno" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-sexo ">
            <label class="control-label" for="registrar-sexo">Sexo: *</label>
            <select ng-model="registrar.sexo" id="registrar-sexo" class="form-control" name="Registrar[sexo]" />
                <option value="">Seleccionar sexo</option>
                <option value="F">Femenino</option>
                <option value="M">Masculino</option>
            </select>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-dni ">
            <label class="control-label" for="registrar-dni">DNI: *</label>
            <input ng-model="registrar.dni" type="text" onpaste="return false;" onCopy="return false" id="registrar-dni" class="form-control numerico" name="Registrar[dni]" maxlength="8" placeholder="DNI">
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-fecha_nac ">
            <label class="control-label" for="registrar-fecha_nac">Fecha de nacimiento: *</label>
            <input ng-model="registrar.fecha_nac" type="date" onpaste="return false;" onCopy="return false" id="registrar-fecha_nac" class="form-control" name="Registrar[fecha_nac]" placeholder="Fecha de nacimiento">
        </div>
    </div>
    
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-email ">
            <label class="control-label" for="registrar-email">Correo electrónico: *</label>
            <input ng-model="registrar.email" type="email" onpaste="return false;" onCopy="return false" id="registrar-email" class="form-control" name="Registrar[email]" placeholder="Correo electrónico">
        </div>
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-celular ">
            <label class="control-label" for="registrar-celular">N°  celular: *</label>
            <input ng-model="registrar.celular" type="text" onpaste="return false;" onCopy="return false" id="registrar-celular" class="form-control numerico" name="Registrar[celular]" maxlength="9" placeholder="N°  celular">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-7 col-md-5">
        <div class="form-group field-registrar-password ">
            <label class="control-label" for="registrar-password">Contraseña: *</label>
            <input ng-model="registrar.password" type="password" onpaste="return false;" onCopy="return false" id="registrar-password" class="form-control" name="Registrar[password]" placeholder="Contraseña">
        </div>      
    </div>
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="form-group field-registrar-repassword ">
            <label class="control-label" for="registrar-repassword">Repetir Contraseña: *</label>
            <input ng-model="registrar.repassword" type="password" onpaste="return false;" onCopy="return false" id="registrar-repassword" class="form-control" name="Registrar[repassword]" placeholder="Repetir contraseña" ng-focus="validarRecontrasena()">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-12 col-md-9" id="example-progress-bar-container"></div>
    <div class="clearfix"></div>
</div>
<h1>Datos de la Institución Educativa</h1>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-departamento ">
            <label class="control-label" for="registrar-departamento">Departamento: *</label>
            <select ng-model="registrar.departamento" id="registrar-departamento" class="form-control" name="Registrar[departamento]" ng-options="departamento.department_id as departamento.department for departamento in departamentos"  ng-change="provincia(registrar.departamento)"><!--onchange='departamento($(this).val())'-->
                <option value="">Seleccionar departamento</option>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-provincia ">
            <label class="control-label" for="registrar-provincia">Provincia: *</label>
            <select ng-model="registrar.provincia" id="registrar-provincia" class="form-control" name="Registrar[provincia]" ng-options="provincia.province_id as provincia.province for provincia in provincias" ng-change="distrito(registrar.provincia)">
                <option value="">Seleccionar provincia</option>
            </select>
        </div>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-distrito  ">
            <label class="control-label" for="registrar-distrito">Distrito: *</label>
            <select ng-model="registrar.distrito" id="registrar-distrito" class="form-control" name="Registrar[distrito]" ng-options="distrito.district_id as distrito.district for distrito in distritos" ng-change="institucion(registrar.distrito)">
                <option value="">Distrito</option>
            </select>
        </div>
    </div>
    
    <div class="clearfix"></div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-institucion ">
            <label class="control-label" for="registrar-institucion">Institución: *</label>
            <select ng-model="registrar.institucion" id="registrar-institucion" class="form-control" name="Registrar[institucion]" ng-options="institucion.id as (institucion.codigo_modular+'-'+institucion.denominacion) for institucion in instituciones">
                <option value="">Institución</option>
            </select>
        </div>
    </div>
    
    <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="form-group field-registrar-grado ">
            <label class="control-label" for="registrar-grado">Grado de estudios: *</label>
            <select ng-model="registrar.grado" id="registrar-grado" class="form-control" name="Registrar[grado]">
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
</div>
<h1>Encuesta</h1>
<hr class="colorgraph">
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-8">
        <div class="form-group field-registrar-p1 ">
            <label class="control-label" for="registrar-p1">¿De qué manera planeas acceder a la plataforma?</label>
            <input ng-model="registrar.p1" type="hidden" name="Registrar[p1]" value="">
                <div id="registrar-p1">
                    <input type="checkbox" name="Registrar[p1][]" value="0"> Desde mi teléfono celular<br>
                    <input type="checkbox" name="Registrar[p1][]" value="1"> Desde una cabina de internet<br>
                    <input type="checkbox" name="Registrar[p1][]" value="2"> Desde la computadora y/o Tablet<br>
                    <input type="checkbox" name="Registrar[p1][]" value="3"> Desde las computadoras escuela
                </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-4 col-md-4">
        <div class="form-group field-registrar-p2 ">
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
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-4 col-md-5">
        <div class="form-group field-registrar-p3 ">
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
        <div class="form-group field-registrar-p4 ">
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
        <div class="form-group field-registrar-p5 ">
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
        <div class="form-group field-registrar-p6 ">
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
        <input type="button"  ng-click="guardar()"  class="btn btn-primary" value="Registrar">
        
    </div>
    
    <div class="clearfix"></div>
</div>
<br>
<div class="clearfix"></div>

</div>
<?php ActiveForm::end(); ?>


<?php
    $validardni= Yii::$app->getUrlManager()->createUrl('registrar/validardni');
    $validaremail= Yii::$app->getUrlManager()->createUrl('registrar/validaremail');
    $guardar= Yii::$app->getUrlManager()->createUrl('registrar/index');
?>
<script>
    var app = angular.module('app', []);
    app.controller('RegistrarController', function($scope,$http) {
        $scope.registrar={};
        $scope.validateEmail =function (sEmail) {
            $scope.filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if ($scope.filter.test(sEmail)) {
                return true;
            }
            else {
                return false;
            }
        }
        
        $scope.departamento=function(departamento) {
            $scope.departamentos = [];
            $http.get("/mineduproyecto/web/ubigeo/departamentos").success(function (data) {
		$scope.departamentos = data;
	    });
        }
        $scope.departamento($scope.registrar.departamento);
        
        
        $scope.provincia=function(departamento){
            $http.get("/mineduproyecto/web/ubigeo/provincias?departamento="+departamento).success(function (data) {
                $scope.provincias = [];
		$scope.provincias = data;
	    });
        }
        
        $scope.distrito=function(provincia){
            $http.get("/mineduproyecto/web/ubigeo/distritos?provincia="+provincia).success(function (data) {
                $scope.distritos = [];
		$scope.distritos = data;
	    });
        }
        
        $scope.institucion=function(distrito){
            $http.get("/mineduproyecto/web/ubigeo/instituciones?distrito="+distrito).success(function (data) {
                $scope.instituciones = [];
		$scope.instituciones = data;
	    });
        }
        
        //$scope.validarRecontrasena($scope.registrar.password,$scope.registrar.repassword);
        
        $scope.guardar = function(){
            $scope.p1=$('input[name=\'Registrar[p1][]\']:checked').length;
            $scope.p2=$('input[type=radio]:checked').length;
            $scope.p3=$('input[name=\'Registrar[p3][]\']:checked').length;
            $scope.p4=$('input[name=\'Registrar[p4][]\']:checked').length;
            $scope.p5=$('input[name=\'Registrar[p5][]\']:checked').length;
            $scope.p6=$('input[name=\'Registrar[p6][]\']:checked').length;
            $scope.error="";
            if ($scope.registrar.nombres==null) {
                $scope.error=$scope.error+"Ingrese nombres <br>";
                $(".field-registrar-nombres").addClass("has-error");
            }
            else
            {
                $(".field-registrar-nombres").addClass("has-success");
                $(".field-registrar-nombres").removeClass("has-error");
            }
            if ($scope.registrar.apellido_paterno==null) {
                $scope.error=$scope.error+"Ingrese su apellido paterno <br>";
                $(".field-registrar-apellido_paterno").addClass("has-error");
            }
            else
            {
                $(".field-registrar-apellido_paterno").addClass("has-success");
                $(".field-registrar-apellido_paterno").removeClass("has-error");
            }
            
            if ($scope.registrar.apellido_materno==null) {
                $scope.error=$scope.error+"Ingrese su apellido materno <br>";
                $(".field-registrar-apellido_materno").addClass("has-error");
            }
            else
            {
                $(".field-registrar-apellido_materno").addClass("has-success");
                $(".field-registrar-apellido_materno").removeClass("has-error");
            }
            
            if ($scope.registrar.sexo==null) {
                $scope.error=$scope.error+"Ingrese sexo <br>";
                $(".field-registrar-sexo").addClass("has-error");
            }
            else
            {
                $(".field-registrar-sexo").addClass("has-success");
                $(".field-registrar-sexo").removeClass("has-error");
            }
            
            if ($scope.registrar.dni==null) {
                $scope.error=$scope.error+"Ingrese dni <br>";
                $(".field-registrar-dni").addClass("has-error");
            }
            else
            {
                $(".field-registrar-dni").addClass("has-success");
                $(".field-registrar-dni").removeClass("has-error");
            }
            
            if ($scope.registrar.fecha_nac==null) {
                $scope.error=$scope.error+"Ingrese fecha de nacimiento <br>";
                $(".field-registrar-fecha_nac").addClass("has-error");
            }
            else
            {
                $(".field-registrar-fecha_nac").addClass("has-success");
                $(".field-registrar-fecha_nac").removeClass("has-error");
            }
            
            if ($scope.registrar.email==null) {
                $scope.error=$scope.error+"Ingrese email <br>";
                $(".field-registrar-email").addClass("has-error");
            }
            else
            {
                $(".field-registrar-email").addClass("has-success");
                $(".field-registrar-email").removeClass("has-error");
            }
            
            if($scope.registrar.email!=null && !$scope.validateEmail($scope.registrar.email)){
                $scope.error=$scope.error+"el usuario debe ser un correo <br>";
                $(".field-registrar-email").addClass("has-error");
            }
            
            if ($scope.registrar.celular==null) {
                $scope.error=$scope.error+"Ingrese celular <br>";
                $(".field-registrar-celular").addClass("has-error");
            }
            else
            {
                $(".field-registrar-celular").addClass("has-success");
                $(".field-registrar-celular").removeClass("has-error");
            }
            
            
            if ($scope.registrar.password==null) {
                $scope.error=$scope.error+"Ingrese contraseña <br>";
                $(".field-registrar-password").addClass("has-error");
            }
            else
            {
                $(".field-registrar-password").addClass("has-success");
                $(".field-registrar-password").removeClass("has-error");
            }
            
            if ($scope.registrar.repassword==null) {
                $scope.error=$scope.error+"Ingrese repetir contraseña <br>";
                $(".field-registrar-repassword").addClass("has-error");
            }
            else
            {
                $(".field-registrar-repassword").addClass("has-success");
                $(".field-registrar-repassword").removeClass("has-error");
            }
            
            if ($scope.registrar.departamento==null) {
                $scope.error=$scope.error+'Ingrese departamento <br>';
                $('.field-registrar-departamento').addClass('has-error');
            }
            else
            {
                $(".field-registrar-departamento").addClass("has-success");
                $(".field-registrar-departamento").removeClass("has-error");
            }
            
            if ($scope.registrar.provincia==null) {
                $scope.error= $scope.error+"Ingrese provincia <br>";
                $(".field-registrar-provincia").addClass("has-error");
            }
            else
            {
                $(".field-registrar-provincia").addClass("has-success");
                $(".field-registrar-provincia").removeClass("has-error");
            }
            
            if ($scope.registrar.distrito==null) {
                $scope.error=$scope.error+"Ingrese distrito <br>";
                $(".field-registrar-distrito").addClass("has-error");
            }
            else
            {
                $(".field-registrar-distrito").addClass("has-success");
                $(".field-registrar-distrito").removeClass("has-error");
            }
            
            if ($scope.registrar.institucion==null) {
                $scope.error=$scope.error+"Ingrese institución <br>";
                $(".field-registrar-institucion").addClass("has-error");
            }
            else
            {
                $(".field-registrar-institucion").addClass("has-success");
                $(".field-registrar-institucion").removeClass("has-error");
            }
            
            if ($scope.registrar.grado==null) {
                $scope.error=$scope.error+"Ingrese grado <br>";
                $(".field-registrar-grado").addClass("has-error");
            }
            else
            {
                $(".field-registrar-grado").addClass("has-success");
                $(".field-registrar-grado").removeClass("has-error");
            }
            
            if ($scope.p1==0) {
                $scope.error=$scope.error+"Seleccione al menos 1 opción en la primera pregunta <br>";
                $(".field-registrar-p1").addClass("has-error");
            }
            else
            {
                $(".field-registrar-p1").addClass("has-success");
                $(".field-registrar-p1").removeClass("has-error");
            }
            
            if ($scope.p2==0) {
                $scope.error=$scope.error+"Seleccione al menos 1 opción en la segunda pregunta <br>";
                $(".field-registrar-p2").addClass("has-error");
            }
            else
            {
                $(".field-registrar-p2").addClass("has-success");
                $(".field-registrar-p2").removeClass("has-error");
            }
            
            
            if ($scope.p3==0) {
                $scope.error=$scope.error+"Seleccione al menos 1 opción en la tercera pregunta <br>";
                $(".field-registrar-p3").addClass("has-error");
            }
            else
            {
                $(".field-registrar-p3").addClass("has-success");
                $(".field-registrar-p3").removeClass("has-error");
            }
            
            if ($scope.p4==0) {
                $scope.error=$scope.error+"Seleccione al menos 1 opción en la cuarta pregunta <br>";
                $(".field-registrar-p4").addClass("has-error");
            }
            else
            {
                $(".field-registrar-p4").addClass("has-success");
                $(".field-registrar-p4").removeClass("has-error");
            }
            
            if ($scope.p5==0) {
                $scope.error=$scope.error+"Seleccione al menos 1 opción en la quinta pregunta <br>";
                $(".field-registrar-p5").addClass("has-error");
            }
            else
            {
                $(".field-registrar-p5").addClass("has-success");
                $(".field-registrar-p5").removeClass("has-error");
            }
            
            if ($scope.p6==0) {
                $scope.error=$scope.error+"Seleccione al menos 1 opción en la sexta pregunta <br>";
                $(".field-registrar-p6").addClass("has-error");
            }
            else
            {
                $(".field-registrar-p6").addClass("has-success");
                $(".field-registrar-p6").removeClass("has-error");
            }
            
            if($scope.registrar.password!=null && $scope.registrar.password.length<8){
                $scope.error=$scope.error+"La contraseña debe contener mínimo 8 caracteres <br>";
                $(".field-registrar-password").addClass("has-error");
            }
            
            if ($scope.registrar.password!=null && $scope.registrar.repassword && $scope.registrar.password!=$scope.registrar.repassword) {
                $scope.error=$scope.error+"Las contraseñas no son idénticas <br>";
                $(".field-registrar-password").addClass("has-error");
                $(".field-registrar-repassword").addClass("has-error");
            }
            
        
            if ($scope.error!="")
            {
                $.notify({
                    message: $scope.error 
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
                /*$http.post('<?= $guardar ?>', {'Registrar[]':$scope.registrar}).success(
                    function(data){
                      $scope.response = data
                });*/
            }
            console.log($scope.registrar.nombres);
            return true;
            
        }
    });
</script>

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
    
    $('#registrar-password').strengthMeter('progressBar', {
        
            container: $('#example-progress-bar-container'),
            
    });
    
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