<style>
.btn-circle {
  width: 49px;
  height: 49px;
  text-align: center;
  padding: 5px 0;
  font-size: 20px;
  line-height: 2.00;
  border-radius: 30px;
}
.hotspot
{
   width:26px;
height:26px;
border-radius:%50;
border:2px solid #fff;
box-shadow:0 0 1px #666,inset 0 0 1px #666;
opacity:.8;
position:absolute;
z-index:10; 
}


</style>



<div id="14" style="width: 100px;height: 100px;background: black;color: white">
    <a href="#aboutModal" class="lima btn btn-circle btn-success">L</a>
    <div class="po-content hidden">
        <div class="po-title">
            Región Lima
        </div> <!-- ./po-title -->
            
        <div class="po-body">
            
        </div><!-- ./po-body -->
    </div>  <!-- ./po-content -->
</div>
<div id="01" style="width: 100px;height: 100px;background: white">
    <a href="#aboutModal" class="amazonas btn btn-circle btn-primary">A</a>
    
</div>




<?php
    $url= Yii::$app->getUrlManager()->createUrl('voto/resultados');
    $this->registerJs(
    "$('document').ready(function(){
	    
    
	    $('.lima').popoverasync({
		'container': 'body',
                'placement': 'right',
		'trigger': 'hover',
		'title': function() {
		    return $(this).parent().find('.po-title').html();
		},
		'html': true,
		'content': function (callback, extensionRef) {
		    $.ajax({
			url: '$url',
			dataType: 'html',
			type: 'GET',
			data: {region:14},
			success: function(fetchedData){
			   callback(extensionRef, fetchedData);
			}
		    });

                }
            });
    
    })");
?>