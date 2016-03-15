<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use app\models\Asunto;

?>

<!--
Large devices
Desktops (≥1200px)

-->
<h1>¿Qué es un Asunto Público?</h1>
<p class="text-justify visible-lg-block visible-md-block visible-sm-block">An easy and beautiful way to navigate throw the sections, An easy and beautiful way to navigate throw the sections , An easy and beautiful way to navigate throw the sections
An easy and beautiful way to navigate throw the sections An easy and beautiful way to navigate throw the sections
An easy and beautiful way to navigate throw the sections An easy and beautiful way to navigate throw the sections</p>

<div class="col-lg-4 visible-lg-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos A</div>
	<div class="panel-body text-justify">
	    <?php
		$categoriasAlg=Asunto::find()->where('padre_id=:padre_id',[':padre_id'=>1])->all();
		foreach($categoriasAlg as $categoriaAlg)
		{
		    echo '<span id="proyectolg'.$categoriaAlg->id.'" class="badge" style="cursor: pointer" >'.$categoriaAlg->descripcion_cabecera.'</span>';
		}
	    ?>
	    <!--
	    <span id="proyectolg1" class="badge" style="cursor: pointer" >1</span>
	    <span id="proyectolg2" class="badge" style="cursor: pointer" >2</span>
	    <span id="proyectolg3" class="badge" style="cursor: pointer" >3</span>
	    <span id="proyectolg4" class="badge" style="cursor: pointer" >4</span>
	    <span id="proyectolg5" class="badge" style="cursor: pointer" >5</span>
	    <span id="proyectolg6" class="badge" style="cursor: pointer" >6</span>
	    <span id="proyectolg7" class="badge" style="cursor: pointer" >7</span>
	    <span id="proyectolg8" class="badge" style="cursor: pointer" >8</span>
	    <span id="proyectolg9" class="badge" style="cursor: pointer" >9</span>
	    <span id="proyectolg10" class="badge" style="cursor: pointer" >10</span>
	    <span id="proyectolg11" class="badge" style="cursor: pointer" >11</span>-->
	</div>
    </div>
</div>
<div class="col-lg-4 visible-lg-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos B</div>
	<div class="panel-body text-justify">
	    <?php
		$categoriasBlg=Asunto::find()->where('padre_id=:padre_id',[':padre_id'=>2])->all();
		foreach($categoriasBlg as $categoriaBlg)
		{
		    echo '<span id="proyectolg'.$categoriaBlg->id.'" class="badge" style="cursor: pointer" >'.$categoriaBlg->descripcion_cabecera.'</span>';
		}
	    ?>
	
	    <!--<span id="proyectolg12" class="badge" style="cursor: pointer" >12</span>
	    <span id="proyectolg13" class="badge" style="cursor: pointer" >13</span>
	    <span id="proyectolg14" class="badge" style="cursor: pointer" >14</span>
	    <span id="proyectolg15" class="badge" style="cursor: pointer" >15</span>
	    <span id="proyectolg16" class="badge" style="cursor: pointer" >16</span>
	    <span id="proyectolg17" class="badge" style="cursor: pointer" >17</span>
	    <span id="proyectolg18" class="badge" style="cursor: pointer" >18</span>
	    <span id="proyectolg19" class="badge" style="cursor: pointer" >19</span>
	    <span id="proyectolg20" class="badge" style="cursor: pointer" >20</span>
	    <span id="proyectolg21" class="badge" style="cursor: pointer" >21</span>
	    <span id="proyectolg22" class="badge" style="cursor: pointer" >22</span>-->
	</div>
    </div>
</div>
<div class="col-lg-4 visible-lg-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos C</div>
	<div class="panel-body text-justify">
	    <?php
		$categoriasClg=Asunto::find()->where('padre_id=:padre_id',[':padre_id'=>3])->all();
		foreach($categoriasClg as $categoriaClg)
		{
		    echo '<span id="proyectolg'.$categoriaClg->id.'" class="badge" style="cursor: pointer" >'.$categoriaClg->descripcion_cabecera.'</span>';
		}
	    ?>
	    <!--
	    <span id="proyectolg23" class="badge" style="cursor: pointer" >23</span>
	    <span id="proyectolg24" class="badge" style="cursor: pointer" >24</span>
	    <span id="proyectolg25" class="badge" style="cursor: pointer" >25</span>
	    <span id="proyectolg26" class="badge" style="cursor: pointer" >26</span>
	    <span id="proyectolg27" class="badge" style="cursor: pointer" >27</span>
	    <span id="proyectolg28" class="badge" style="cursor: pointer" >28</span>
	    <span id="proyectolg29" class="badge" style="cursor: pointer" >29</span>
	    <span id="proyectolg30" class="badge" style="cursor: pointer" >30</span>
	    <span id="proyectolg31" class="badge" style="cursor: pointer" >31</span>
	    <span id="proyectolg32" class="badge" style="cursor: pointer" >32</span>
	    <span id="proyectolg33" class="badge" style="cursor: pointer" >33</span>
	    -->
	</div>
    </div>
</div>
<div class="clearfix"></div>




<div class="col-md-4 visible-md-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos A</div>
	<div class="panel-body text-justify">
	    <?php
		$categoriasAmd=Asunto::find()->where('padre_id=:padre_id',[':padre_id'=>1])->all();
		foreach($categoriasAmd as $categoriaAmd)
		{
		    echo '<span id="proyectomd'.$categoriaAmd->id.'" class="badge" style="cursor: pointer" >'.$categoriaAmd->descripcion_cabecera.'</span>';
		}
	    ?>
	<!--
	    <span id="proyectomd1" class="badge" style="cursor: pointer" >1</span>
	    <span id="proyectomd2" class="badge" style="cursor: pointer" >2</span>
	    <span id="proyectomd3" class="badge" style="cursor: pointer" >3</span>
	    <span id="proyectomd4" class="badge" style="cursor: pointer" >4</span>
	    <span id="proyectomd5" class="badge" style="cursor: pointer" >5</span>
	    <span id="proyectomd6" class="badge" style="cursor: pointer" >6</span>
	    <span id="proyectomd7" class="badge" style="cursor: pointer" >7</span>
	    <span id="proyectomd8" class="badge" style="cursor: pointer" >8</span>
	    <span id="proyectomd9" class="badge" style="cursor: pointer" >9</span>
	    <span id="proyectomd10" class="badge" style="cursor: pointer" >10</span>
	    <span id="proyectomd11" class="badge" style="cursor: pointer" >11</span>
	-->
	</div>
    </div>
</div>
<div class="col-md-4 visible-md-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos B</div>
	<div class="panel-body text-justify">
	    <?php
		$categoriasBmd=Asunto::find()->where('padre_id=:padre_id',[':padre_id'=>2])->all();
		foreach($categoriasBmd as $categoriaBmd)
		{
		    echo '<span id="proyectomd'.$categoriaBmd->id.'" class="badge" style="cursor: pointer" >'.$categoriaBmd->descripcion_cabecera.'</span>';
		}
	    ?>
	    <!--
	    <span id="proyectomd12" class="badge" style="cursor: pointer" >12</span>
	    <span id="proyectomd13" class="badge" style="cursor: pointer" >13</span>
	    <span id="proyectomd14" class="badge" style="cursor: pointer" >14</span>
	    <span id="proyectomd15" class="badge" style="cursor: pointer" >15</span>
	    <span id="proyectomd16" class="badge" style="cursor: pointer" >16</span>
	    <span id="proyectomd17" class="badge" style="cursor: pointer" >17</span>
	    <span id="proyectomd18" class="badge" style="cursor: pointer" >18</span>
	    <span id="proyectomd19" class="badge" style="cursor: pointer" >19</span>
	    <span id="proyectomd20" class="badge" style="cursor: pointer" >20</span>
	    <span id="proyectomd21" class="badge" style="cursor: pointer" >21</span>
	    <span id="proyectomd22" class="badge" style="cursor: pointer" >22</span>
	-->
	</div>
    </div>
</div>
<div class="col-md-4 visible-md-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos C</div>
	<div class="panel-body text-justify">
	    <?php
		$categoriasCmd=Asunto::find()->where('padre_id=:padre_id',[':padre_id'=>3])->all();
		foreach($categoriasCmd as $categoriaCmd)
		{
		    echo '<span id="proyectomd'.$categoriaCmd->id.'" class="badge" style="cursor: pointer" >'.$categoriaCmd->descripcion_cabecera.'</span>';
		}
	    ?>
	<!--
	    <span id="proyectomd23" class="badge" style="cursor: pointer" >23</span>
	    <span id="proyectomd24" class="badge" style="cursor: pointer" >24</span>
	    <span id="proyectomd25" class="badge" style="cursor: pointer" >25</span>
	    <span id="proyectomd26" class="badge" style="cursor: pointer" >26</span>
	    <span id="proyectomd27" class="badge" style="cursor: pointer" >27</span>
	    <span id="proyectomd28" class="badge" style="cursor: pointer" >28</span>
	    <span id="proyectomd29" class="badge" style="cursor: pointer" >29</span>
	    <span id="proyectomd30" class="badge" style="cursor: pointer" >30</span>
	    <span id="proyectomd31" class="badge" style="cursor: pointer" >31</span>
	    <span id="proyectomd32" class="badge" style="cursor: pointer" >32</span>
	    <span id="proyectomd33" class="badge" style="cursor: pointer" >33</span>
	-->
	</div>
    </div>
</div>
<div class="clearfix"></div>



<div class="col-sm-4 visible-sm-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos A</div>
	<div class="panel-body text-justify">
	    <span id="proyectosm1" class="badge" style="cursor: pointer" >1</span>
	    <span id="proyectosm2" class="badge" style="cursor: pointer" >2</span>
	    <span id="proyectosm3" class="badge" style="cursor: pointer" >3</span>
	    <span id="proyectosm4" class="badge" style="cursor: pointer" >4</span>
	    <span id="proyectosm5" class="badge" style="cursor: pointer" >5</span>
	    <span id="proyectosm6" class="badge" style="cursor: pointer" >6</span>
	    <span id="proyectosm7" class="badge" style="cursor: pointer" >7</span>
	    <span id="proyectosm8" class="badge" style="cursor: pointer" >8</span>
	    <span id="proyectosm9" class="badge" style="cursor: pointer" >9</span>
	    <span id="proyectosm10" class="badge" style="cursor: pointer" >10</span>
	    <span id="proyectosm11" class="badge" style="cursor: pointer" >11</span>
	</div>
    </div>
</div>
<div class="col-sm-4 visible-sm-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos B</div>
	<div class="panel-body text-justify">
	    <span id="proyectosm12" class="badge" style="cursor: pointer" >12</span>
	    <span id="proyectosm13" class="badge" style="cursor: pointer" >13</span>
	    <span id="proyectosm14" class="badge" style="cursor: pointer" >14</span>
	    <span id="proyectosm15" class="badge" style="cursor: pointer" >15</span>
	    <span id="proyectosm16" class="badge" style="cursor: pointer" >16</span>
	    <span id="proyectosm17" class="badge" style="cursor: pointer" >17</span>
	    <span id="proyectosm18" class="badge" style="cursor: pointer" >18</span>
	    <span id="proyectosm19" class="badge" style="cursor: pointer" >19</span>
	    <span id="proyectosm20" class="badge" style="cursor: pointer" >20</span>
	    <span id="proyectosm21" class="badge" style="cursor: pointer" >21</span>
	    <span id="proyectosm22" class="badge" style="cursor: pointer" >22</span>
	</div>
    </div>
</div>
<div class="col-sm-4 visible-sm-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos C</div>
	<div class="panel-body text-justify">
	    <span id="proyectosm23" class="badge" style="cursor: pointer" >23</span>
	    <span id="proyectosm24" class="badge" style="cursor: pointer" >24</span>
	    <span id="proyectosm25" class="badge" style="cursor: pointer" >25</span>
	    <span id="proyectosm26" class="badge" style="cursor: pointer" >26</span>
	    <span id="proyectosm27" class="badge" style="cursor: pointer" >27</span>
	    <span id="proyectosm28" class="badge" style="cursor: pointer" >28</span>
	    <span id="proyectosm29" class="badge" style="cursor: pointer" >29</span>
	    <span id="proyectosm30" class="badge" style="cursor: pointer" >30</span>
	    <span id="proyectosm31" class="badge" style="cursor: pointer" >31</span>
	    <span id="proyectosm32" class="badge" style="cursor: pointer" >32</span>
	    <span id="proyectosm33" class="badge" style="cursor: pointer" >33</span>
	</div>
    </div>
</div>
<div class="clearfix"></div>



<p class="text-justify visible-xs-block">An easy and beautiful way to navigate throw the sections, An easy and beautiful way to navigate throw the sections ,</p>

<div class="col-xs-12 visible-xs-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos A</div>
	<div class="panel-body text-justify">
	    <span id="proyectoxs1" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto1">1</span>
	    <span id="proyectoxs2" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto2" >2</span>
	    <span id="proyectoxs3" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto3" >3</span>
	    <span id="proyectoxs4" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto4" >4</span>
	    <span id="proyectoxs5" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto5" >5</span>
	    <span id="proyectoxs6" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto6">6</span>
	    <span id="proyectoxs7" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto7" >7</span>
	    <span id="proyectoxs8" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto8" >8</span>
	    <span id="proyectoxs9" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto9" >9</span>
	    <span id="proyectoxs10" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto10" >10</span>
	    <span id="proyectoxs11" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto10" >11</span>
	</div>
    </div>
</div>
<div class="col-xs-12 visible-xs-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos B</div>
	<div class="panel-body text-justify">
	    
	    <span id="proyectoxs12" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto12" >12</span>
	    <span id="proyectoxs13" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto13" >13</span>
	    <span id="proyectoxs14" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto14" >14</span>
	    <span id="proyectoxs15" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto15" >15</span>
	    <span id="proyectoxs16" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto16">16</span>
	    <span id="proyectoxs17" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto17" >17</span>
	    <span id="proyectoxs18" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto18" >18</span>
	    <span id="proyectoxs19" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto19" >19</span>
	    <span id="proyectoxs20" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto20" >20</span>
	    <span id="proyectoxs21" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto21" >21</span>
	    <span id="proyectoxs22" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto22">22</span>
	</div>
    </div>
</div>
<div class="col-xs-12 visible-xs-block">
    <div class="panel panel-default ">
	<div class="panel-heading">Asuntos C</div>
	<div class="panel-body text-justify">
	    
	    <span id="proyectoxs23" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto23" >23</span>
	    <span id="proyectoxs24" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto24" >24</span>
	    <span id="proyectoxs25" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto25" >25</span>
	    <span id="proyectoxs26" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto26">26</span>
	    <span id="proyectoxs27" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto27" >27</span>
	    <span id="proyectoxs28" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto28" >28</span>
	    <span id="proyectoxs29" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto29" >29</span>
	    <span id="proyectoxs30" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto30" >30</span>
	    <span id="proyectoxs31" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto31" >31</span>
	    <span id="proyectoxs32" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto32">32</span>
	    <span id="proyectoxs33" class="badge" style="cursor: pointer" data-toggle="modal" data-target="#myModalAsunto33" >33</span>
	</div>
    </div>
</div>
<div class="clearfix"></div>

<div>
    <button id="votar" type="button" class="btn btn-small btn-primary" >votar</button>
</div>
<?php 
    $this->registerJs(
    "$('document').ready(function(){
	
    })");
?>
<!--proyecto 1-->
