<?php

/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>

    
<div class="site-index">    
    <div class="jumbotron">
        <h2>Congratulations!</h2>
    </div>
    
    <div id="myCarousel" class="carousel slide center-block" data-ride="carousel" >
        <!-- Indicators -->
        <ol class="carousel-indicators" >
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner center-block" role="listbox">
            <div class="item active center-block">
                <img src="images/pic1.jpg" class="img-responsive img-slider" alt="Chania" >
            </div>

            <div class="item">
                <img src="images/pic2.jpg" class="img-responsive img-slider" alt="Chania" >
            </div>
    
            <div class="item">
                <img src="images/pic3.jpg" class="img-responsive img-slider" alt="Flower" >
            </div>

            <div class="item">
                <img src="images/pic4.jpg" class="img-responsive img-slider" alt="Flower" >
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon " aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


    <p></p>
    <p></p>
        <div class="row">
            <div class="col-md-4 text-center ">
                <img src="images/cua1.jpg" class="center-block img-responsive img-contenido" alt="Chania" >
                <p></p>
                <p><a class="center-block" href="http://www.yiiframework.com/doc/">Bases</a></p>
            </div>
            <div class="col-md-4 text-center">
                <img src="images/cua2.jpg" class="center-block img-responsive img-contenido" alt="Chania" >
                <p></p>
                <p><a class="center-block" href="http://www.yiiframework.com/forum/">Info</a></p>
            </div>
            <div class="col-md-4 text-center">
                <img src="images/cua3.jpg" class="center-block img-responsive img-contenido" alt="Chania" >
                <p></p>
                <p><a class="center-block" href="http://www.yiiframework.com/extensions/">Asuntos públicos</a></p>
            </div>
        </div>

</div>


