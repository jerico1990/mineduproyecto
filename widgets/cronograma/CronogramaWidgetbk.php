<?php
namespace app\widgets\cronograma;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Proyecto;
use app\models\Cronograma;

class CronogramaWidget extends Widget
{
    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $cronograma = new Cronograma;
        $actividades=Actividad::find()
                        ->select('actividad.id,actividad.descripcion')
                        ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                        ->innerJoin('proyecto','proyecto.id=objetivo_especifico.proyecto_id')
                        ->where('proyecto.user_id=:user_id',[':user_id'=>\Yii::$app->user->id])
                        ->all();
        //$proyecto=Proyecto::find()->where('user_id=:user_id',[':user_id'=>\Yii::$app->user->id])->one();
        //$objetivosespecificos=ObjetivoEspecifico::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        if ($cronograma->load(\Yii::$app->request->post()) && $cronograma->validate()) {
            
            $countActividades=count($cronograma->actividades);
            for($i=0;$i<$countActividades;$i++)
            {
                $cronogramau=new Cronograma;
                $cronogramau->actividad_id=$cronograma->actividades[$i];
                $cronogramau->medicion_tiempo=$cronograma->medicion_tiempo;
                $cronogramau->fecha_inicio=$cronograma->fechas_inicios[$i];
                $cronogramau->fecha_fin=$cronograma->fechas_fines[$i];
                //$cronogramau->duracion=$cronograma->fechas_fines[$i];
                $cronogramau->save();
            }
            
            return \Yii::$app->getResponse()->refresh();
        }
        
        return $this->render('cronograma',['cronograma'=>$cronograma,'actividades'=>$actividades]);
    }
}