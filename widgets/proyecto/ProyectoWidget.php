<?php
namespace app\widgets\proyecto;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Proyecto;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
class ProyectoWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $proyecto = new Proyecto;
        if ($proyecto->load(\Yii::$app->request->post()) && $proyecto->save()) {
            //var_dump($proyecto->actividades_3);die;
            $countActividades1=count($proyecto->actividades_1);
            $countActividades2=count($proyecto->actividades_2);
            $countActividades3=count($proyecto->actividades_3);
            
            if($proyecto->objetivo_especifico_1!=='')
            {
                $objetivoespecifico1=new ObjetivoEspecifico;
                $objetivoespecifico1->proyecto_id=$proyecto->id;
                $objetivoespecifico1->descripcion=$proyecto->objetivo_especifico_1;
                $objetivoespecifico1->save();
                
                for($i=0;$i<$countActividades1;$i++)
                {
                    $actividad=new Actividad;
                    $actividad->objetivo_especifico_id=$objetivoespecifico1->id;
                    $actividad->descripcion=$proyecto->actividades_1[$i];
                    $actividad->estado=1;
                    $actividad->save();
                }
            }
            
            if($proyecto->objetivo_especifico_2!=='')
            {
                $objetivoespecifico2=new ObjetivoEspecifico;
                $objetivoespecifico2->proyecto_id=$proyecto->id;
                $objetivoespecifico2->descripcion=$proyecto->objetivo_especifico_2;
                $objetivoespecifico2->save();
                
                for($i=0;$i<$countActividades2;$i++)
                {
                    $actividad=new Actividad;
                    $actividad->objetivo_especifico_id=$objetivoespecifico2->id;
                    $actividad->descripcion=$proyecto->actividades_2[$i];
                    $actividad->estado=1;
                    $actividad->save();
                }
            }
            
            if($proyecto->objetivo_especifico_3!=='')
            {
                $objetivoespecifico3=new ObjetivoEspecifico;
                $objetivoespecifico3->proyecto_id=$proyecto->id;
                $objetivoespecifico3->descripcion=$proyecto->objetivo_especifico_3;
                $objetivoespecifico3->save();
                
                for($i=0;$i<$countActividades3;$i++)
                {
                    $actividad=new Actividad;
                    $actividad->objetivo_especifico_id=$objetivoespecifico3->id;
                    $actividad->descripcion=$proyecto->actividades_3[$i];
                    $actividad->estado=1;
                    $actividad->save();
                }
            }
            
            
            
            return \Yii::$app->getResponse()->refresh();
        }
        
        return $this->render('proyecto',['proyecto'=>$proyecto]);
    }
}