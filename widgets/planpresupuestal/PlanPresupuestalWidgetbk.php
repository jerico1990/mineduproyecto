<?php
namespace app\widgets\planpresupuestal;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Proyecto;
use app\models\Cronograma;
use app\models\PlanPresupuestal;

class PlanPresupuestalWidget extends Widget
{
    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $planpresupuestal = new PlanPresupuestal;
        $actividades=Actividad::find()
                        ->select('actividad.id,actividad.descripcion')
                        ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                        ->innerJoin('proyecto','proyecto.id=objetivo_especifico.proyecto_id')
                        ->where('proyecto.user_id=:user_id',[':user_id'=>\Yii::$app->user->id])
                        ->all();
        if ($planpresupuestal->load(\Yii::$app->request->post()) && $planpresupuestal->validate()) {
            
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
        
        return $this->render('planpresupuestal',['planpresupuestal'=>$planpresupuestal,'actividades'=>$actividades]);
    }
}