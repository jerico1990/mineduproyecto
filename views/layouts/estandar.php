<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppEstandarAsset;
use app\models\Foro;
use app\models\Usuario;
use app\models\Integrante;
use app\models\Equipo;
use app\models\Proyecto;
use app\models\Etapa;
use app\models\Invitacion;
AppEstandarAsset::register($this);

if (!\Yii::$app->user->isGuest) {

$etapa2=Etapa::find()->where('etapa=2')->one();
$etapa3=Etapa::find()->where('etapa=3')->one();
$usuario=Usuario::find()->where('id=:id',[':id'=>\Yii::$app->user->id])->one();
//$invitacion=Invitacion::find()->where('equipo_id=:equipo_id and estado=1',[':equipo_id'=>$equipo->id])->one();
$integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
if($integrante)
{
    $equipo=Equipo::find()->where('id=:id and estado=1',[':id'=>$integrante->equipo_id])->one();
    if($equipo)
    {
        
        $proyecto=Proyecto::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$equipo->id])->one();
    }
}
$foros=Foro::find()->orderBy('id DESC')->all();

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" ng-app="app">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
        
        

  <!-- jQuery -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  
  <!-- Material Design fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <title><?= Html::encode($this->title) ?></title>
    <!-- Bootstrap -->
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    
    
    <link href="http://t00rk.github.io/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
  
  <!-- Bootstrap Material Design -->
  <link href="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-material-design-master/dist/css/bootstrap-material-design.css" rel="stylesheet">
  <link href="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-material-design-master/dist/css/ripples.min.css" rel="stylesheet">

  <!-- Dropdown.js -->
  <link href="http://cdn.rawgit.com/FezVrasta/dropdown.js/master/jquery.dropdown.css" rel="stylesheet">

  <!-- Page style -->
  <link href="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-material-design-master/index.css" rel="stylesheet">
    
    <?php $this->head() ?>
</head>
<body class="skin-blue">
<?php $this->beginBody() ?>
<div class="wrapper">
      <header class="main-header">
        <!-- Logo -->
        <a href="index2.html" class="logo"><?= Html::img('../images/logo_ministerio_educacion.png',['class'=>'img-responsive logo', 'alt'=>'Responsive image']) ?></a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!--
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="../foto_personal/<?= $usuario->avatar?>" class="user-image" alt="User Image"/>
                  <span class="hidden-xs"><?= $usuario->estudiante->nombres." ".$usuario->estudiante->apellido_paterno." ".$usuario->estudiante->apellido_materno ?></span>
                </a>
                <ul class="dropdown-menu" style="width:350px !important">
                  <li class="user-header">
                    <img src="../foto_personal/<?= $usuario->avatar?>" class="img-circle" alt="User Image" />
                    <p>
                        <?= $usuario->estudiante->nombres." ".$usuario->estudiante->apellido_paterno." ".$usuario->estudiante->apellido_materno ?>
                        <small><?= date('d-m-Y')?></small>
                    </p>
                  </li>
                  <li class="user-footer">
                    <div class="pull-left">
                        <?= Html::a('Configuración',['usuario/configuracion'],['class'=>'btn btn-default btn-flat']);?>
                    </div>
                    <div class="pull-right">
                        <?= Html::a('Cerrar sesión',['login/logout'],['class'=>'btn btn-default btn-flat']);?>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        -->
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="../foto_personal/<?= $usuario->avatar?>" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p style="font-size: 9px"><?= $usuario->estudiante->nombres." ".$usuario->estudiante->apellido_paterno." ".$usuario->estudiante->apellido_materno ?></p>
                <?= Html::a('Cerrar sesión',['login/logout'],[]);?>
              <!--<a href="#"><i class="fa fa-circle text-success"></i> En linea</a>-->
            </div>
          </div>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">Menú</li>
            <?php if($integrante){ ?>
            <li><?= Html::a('<i class="fa fa-book"></i> Ideas en acción',['panel/ideas-accion'],[]);?></li>
            <?php } ?>
            <li><?= Html::a('<i class="fa fa-book"></i> Mi equipo',['panel/index'],[]);?></li>
            <?php if($integrante){ ?>
            <!--<li><?= Html::a('<i class="fa fa-book"></i> Ruta',['ruta/index'],[]);?></li>-->
            <?php } ?>
            <?php if ($integrante && $equipo){ ?>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-share"></i> <span>Foros</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                <?php foreach($foros as $foro): ?>
                    <?php if($foro->id==2 || ($integrante && $foro->asunto_id==$equipo->asunto_id)){?>
                    <li><?= Html::a("$foro->titulo",['foro/view','id'=>$foro->id],[]);?></li>
                    <?php } ?>
                <?php endforeach; ?>
                </ul>
            </li>
            <?php } ?>
            <?php if($integrante && $equipo && !$proyecto && $integrante->rol==1){ ?>
            <li><?= Html::a("Mi proyecto",['proyecto/index'],[]);?> </li>
            <?php } elseif($integrante && $equipo && $proyecto && ($integrante->rol==1 || $integrante->rol==2)){ ?>
            <li><?= Html::a("Mi proyecto",['proyecto/actualizar'],[]);?></li>
            <!--<li><?= Html::a("Mi video",['video/index'],[]);?></li>-->
            <li><?= Html::a("Mis entregas",['entrega/index'],[]);?></li>
            <?php } ?>
            <?php if($integrante && $equipo && $etapa2 && ($equipo->etapa==1 || $equipo->etapa==2)){?>
            <li><?= Html::a("Búsqueda de proyectos",['proyecto/buscar'],[]);?></li>
            <?php } ?>
            <?php if($integrante && $equipo && $etapa3 && ($equipo->etapa==2)){?>
            <li><?= Html::a("Votación interna",['proyecto/votacion'],[]);?></li>
            <?php } ?>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper" style="background-color: white !important">
        <section class="content">
        <?= $content ?>
        </section>
      </div><!-- /.content-wrapper -->
      <!--<footer class="main-footer">
        <div class="pull-right hidden-xs">
         
        </div>
        
      </footer>-->
    </div><!-- ./wrapper -->


<?php $this->endBody() ?>
<!-- Open source code -->
<script>
  window.page = window.location.hash || "#about";

  $(document).ready(function () {
    if (window.page != "#about") {
      $(".menu").find("li[data-target=" + window.page + "]").trigger("click");
    }
  });

  $(window).on("resize", function () {
    $("html, body").height($(window).height());
    $(".main, .menu").height($(window).height() - $(".header-panel").outerHeight());
    $(".pages").height($(window).height());
  }).trigger("resize");

  $(".menu li").click(function () {
    // Menu
    if (!$(this).data("target")) return;
    if ($(this).is(".active")) return;
    $(".menu li").not($(this)).removeClass("active");
    $(".page").not(page).removeClass("active").hide();
    window.page = $(this).data("target");
    var page = $(window.page);
    window.location.hash = window.page;
    $(this).addClass("active");


    page.show();

    var totop = setInterval(function () {
      $(".pages").animate({scrollTop: 0}, 0);
    }, 1);

    setTimeout(function () {
      page.addClass("active");
      setTimeout(function () {
        clearInterval(totop);
      }, 1000);
    }, 100);
  });

  function cleanSource(html) {
    var lines = html.split(/\n/);

    lines.shift();
    lines.splice(-1, 1);

    var indentSize = lines[0].length - lines[0].trim().length,
        re = new RegExp(" {" + indentSize + "}");

    lines = lines.map(function (line) {
      if (line.match(re)) {
        line = line.substring(indentSize);
      }

      return line;
    });

    lines = lines.join("\n");

    return lines;
  }

  $("#opensource").click(function () {
    $.get(window.location.href, function (data) {
      var html = $(data).find(window.page).html();
      html = cleanSource(html);
      $("#source-modal pre").text(html);
      $("#source-modal").modal();
    });
  });
</script>

<!-- Twitter Bootstrap -->
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- Material Design for Bootstrap -->
<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-material-design-master/dist/js/material.js"></script>
<script src="<?= \Yii::$app->request->BaseUrl ?>/bootstrap-material-design-master/dist/js/ripples.min.js"></script>
<script>
  $.material.init();
</script>


<!-- Dropdown.js -->
<script src="https://cdn.rawgit.com/FezVrasta/dropdown.js/master/jquery.dropdown.js"></script>
<script>
  $("#dropdown-menu select").dropdown();
</script>

</body>
</html>
<?php $this->endPage() ?>
<?php } else {?>
<script>
    window.location.replace('../web/site/index')
</script>
<?php } ?>