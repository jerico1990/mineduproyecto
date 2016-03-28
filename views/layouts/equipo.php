<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\models\PreForum;
use app\models\Usuario;
use app\models\Integrante;
use app\models\Equipo;
use app\models\Proyecto;
use app\models\Etapa;
AppAsset::register($this);

if (!\Yii::$app->user->isGuest) {

$etapa2=Etapa::find()->where('etapa=2')->one();
$usuario=Usuario::find()->where('id=:id',[':id'=>\Yii::$app->user->id])->one();

$integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
if($integrante)
{
    $equipo=Equipo::find()->where('id=:id and estado=1',[':id'=>$integrante->equipo_id])->one();
    if($equipo)
    {
        $proyecto=Proyecto::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$equipo->id])->one();
    }
    
}



$forums=PreForum::find()->where('status=1')->orderBy('id DESC')->all();
$myForums = Yii::$app->db->createCommand('SELECT forum_url, forum_name, forum_icon, status FROM {{%pre_forum}} WHERE user_id=' . Yii::$app->user->id)->queryAll();
        
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" ng-app="app">
<head>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../js/bootbox.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <link rel="stylesheet" type="text/css" href="../css/equipo.css">
    <style>
    .post-area{
        position:relative;
        margin-top: 10px;
        padding: 20px 30px 0;
        background: #fff;
        border: 1px solid #e6e6e6;
        
    }
    .post-area .post-user img
    {
        width:64px;
        height:64px;
        margin:0 auto 28px;
        display:block;
    }
    .posts .post-user-info img
    {
        width:64px;
        height:64px;
        margin:0 auto 28px;
        display:block;
    }
    .thread-view
    {
        background:#fff;
        border:1px solid #e6e6e6;
        margin:0 0 10px 0;
        padding:26px;
    }
    .img-user-avatar
    {
        width:50px;
        height:50px;
    }
    
    </style>
    <?php $this->head() ?>
</head>
<body oncontextmenu="return false">
<?php $this->beginBody() ?>
<div class="container">
<div class="row">
  <div class="col-sm-3" >
    <div class="sidebar-nav">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand"></span>
        </div>
        <div class="navbar-collapse collapse sidebar-navbar-collapse">
          <ul class="nav navbar-nav">
                <li><a href="../panel/index"> Principal</a></li>
            <?php if (!empty($forums)): ?>
                <?php foreach($forums as $model): ?>
                    <?php if($model->id==1 || $model->id==2){?>
                    <li><a href="#" onclick="window.location.href= '<?= \yii\helpers\Url::toRoute(['/pre-forum/view', 'id' => $model->forum_url]) ?>';return false"> <?= Html::encode($model->forum_name); ?></a></li>
                    <?php } ?>
                <?php endforeach; ?>
            <?php else: ?>
            <?php endif; ?>
                <?php if($integrante && $equipo && !$proyecto && $integrante->rol==1){ ?>
                <li><a href="../proyecto/index"> Mi proyecto</a></li>
                <?php } elseif($integrante && $equipo && $proyecto && $integrante->rol==1){ ?>
                <li><a href="../proyecto/actualizar"> Mi proyecto</a></li>
                <li><a href="../video/index"> Mi video</a></li>
                <li><a href="../entrega/index"> Mis entregas</a></li>
                <?php } elseif($integrante && $equipo && $proyecto && $integrante->rol==2){ ?>
                <li><a href="../proyecto/actualizar"> Mi proyecto</a></li>
                <li><a href="../video/index"> Mi video</a></li>
                <?php } ?>
                
                <?php if($integrante && $equipo && $etapa2 && $equipo->etapa=1){?>
                <li><a href="../proyecto/buscar">Búsqueda de proyectos</a></li>
                <?php } ?>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
  </div>
  <div class="col-sm-9">
    <?= $content ?>
  </div>
</div>
</div>
<!--
<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>
-->
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
<?php } else {?>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    window.location.replace('../web/site/index')
</script>
<?php } ?>