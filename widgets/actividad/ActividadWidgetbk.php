<?php
namespace app\widgets\actividad;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Proyecto;
class ActividadWidget extends Widget
{
    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $actividad = new Actividad;
        $proyecto=Proyecto::find()->where('user_id=:user_id',[':user_id'=>\Yii::$app->user->id])->one();
        $objetivosespecificos=ObjetivoEspecifico::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        if ($actividad->load(\Yii::$app->request->post()) && $actividad->validate()) {
            
            $countObjetivos=count($actividad->objetivos_especificos);
            for($i=0;$i<$countObjetivos;$i++)
            {
                $actividadu=new Actividad;
                $actividadu->objetivo_especifico_id=$actividad->objetivos_especificos[$i];
                $actividadu->descripcion=$actividad->actividades[$i];
                $actividadu->resultado_esperado=$actividad->resultados_esperados[$i];
                $actividadu->save();
            }
            
            return \Yii::$app->getResponse()->refresh();
        }
        
        return $this->render('actividad',['actividad'=>$actividad,'objetivosespecificos'=>$objetivosespecificos]);
    }
}