<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Foro */

$this->title = $model->titulo;
$this->params['breadcrumbs'][] = ['label' => 'Foros', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
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
    <?= $this->render('_posts', [
            'posts'=>$posts['posts'],
            'pageSize'=>$posts['pages']->pageSize, //分页
            'pages' => $posts['pages'], //分页
            'postCount' => $model->post_count //评论数
        ]);
    ?>
</div>
