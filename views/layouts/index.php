<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <style>

	/* Style for our header texts
	* --------------------------------------- */
	h1{
		font-size: 5em;
		font-family: arial,helvetica;
		color: #fff;
		margin:0;
	}
	.intro p{
		color: #fff;
	}

	/* Centered texts in each section
	* --------------------------------------- */
	.section{
		text-align:center;
	}

	/* Overwriting styles for control arrows for slides
	* --------------------------------------- */
	.controlArrow.prev {
		left: 50px;
	}
	.controlArrow.next{
		right: 50px;
	}


	/* Bottom menu
	* --------------------------------------- */
	#infoMenu li a {
		color: #fff;
	}
        
        


	</style>
    <?php $this->head() ?>
    <?php 
    $this->registerJs(
    "$('document').ready(function(){
        $('#fullpage').fullpage({
				anchors: ['1Page', '2Page', '3Page' , '4Page'],
				sectionsColor: ['#C63D0F', '#1BBC9B', '#7E8F7C' , 'green'],
				navigation: true,
				navigationPosition: 'left',
				navigationTooltips: ['Presentación', 'Bases del concurso', 'Ideas en acción' , 'Asuntos púbicos']
			});
        /*                
         $.scrollIt({
            upKey: 38,             // key code to navigate to the next section
            downKey: 40,           // key code to navigate to the previous section
            easing: 'linear',      // the easing function for animation
            scrollTime: 600,       // how long (in ms) the animation takes
            activeClass: 'active', // class given to the active nav element
            onPageChange: null,    // function(pageIndex) that is called when page is changed
            topOffset: 0           // offste (in px) for fixed top navigation
          });*/
    })");
    ?>
</head>
<body>
<?php $this->beginBody() ?>
<!--
    <div id="sidebar" >
        <nav>
            <ul>
                <li>
                    <a class='active' data-scroll-nav='0'>Presentación</a>
                </li>
                <li>
                    <a data-scroll-nav='1'>Bases del Concurso</a>
                </li>
                <li>
                    <a data-scroll-nav='2'>Ideas en Acción</a>
                </li>
                <li>
                    <a data-scroll-nav='3'>Asuntos Públicos</a>
                </li>
            </ul>
        </nav>
    </div>
    -->
    
    <?= $content ?>
    


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
