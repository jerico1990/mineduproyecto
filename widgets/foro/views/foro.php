<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Foro */

$this->title = $model->titulo;
$usuario=$model->usuario;
$posts = $model->posts;
?>
<div class="foro-view">
    
    <article class="thread-view">
        <header class="thread-head">
            <h1><?= Html::encode($this->title) ?></h1>
            <div class="thread-info">
                <span class="glyphicon glyphicon-user"></span> <?= $usuario->username ?>
                &nbsp;•&nbsp;
                <span class="glyphicon glyphicon-time"></span> <?= Yii::$app->formatter->asRelativeTime($model->creado_at) ?>
                <div class="pull-right">
                    <span class="glyphicon glyphicon-comment"></span> <?= $model->post_count ?>
                </div>
            </div>
        </header>
    </article>
    <!-- Post Form Begin -->
        <?= $this->render('/foro-comentario/_form',[
                'model'=>$newComentario,
            ]);
        ?>
    <!-- Post Form End -->
    <?= $this->render('/foro/_posts', [
            'posts'=>$posts['posts'],
            'pageSize'=>$posts['pages']->pageSize, //??
            'pages' => $posts['pages'], //??
            'postCount' => $model->post_count //???
        ]);
    ?>
</div>
