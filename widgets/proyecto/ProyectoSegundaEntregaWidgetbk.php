<?php
namespace app\widgets\proyecto;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Reflexion;
use app\models\ProyectoCopia;
use app\models\Usuario;
use app\models\Integrante;
use app\models\ActividadCopia;
use app\models\Equipo;
use app\models\ObjetivoEspecificoCopia;
use app\models\Evaluacion;
use app\models\Video;

Yii::setAlias('video', '@web/video_carga/');

class ProyectoSegundaEntregaWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
        $equipo=Equipo::findOne($integrante->equipo_id);
        
        $proyecto=ProyectoCopia::find()->where('equipo_id=:equipo_id and etapa=2',[':equipo_id'=>$integrante->equipo_id])->one();
        $objetivos_especificos=ObjetivoEspecificoCopia::find()->where('proyecto_id=:proyecto_id and etapa=2',[':proyecto_id'=>$proyecto->id])->all();
        $actividades=ActividadCopia::find()
                    ->select('objetivo_especifico_copia.id objetivo_especifico_id,actividad_copia.id actividad_id,actividad_copia.descripcion')
                    ->innerJoin('objetivo_especifico_copia','objetivo_especifico_copia.id=actividad_copia.objetivo_especifico_id')
                    ->where('proyecto_id=:proyecto_id and actividad_copia.estado=1 and actividad_copia.etapa=2 and objetivo_especifico_copia.etapa=2',[':proyecto_id'=>$proyecto->id])->all();
        $i=1;
        foreach($objetivos_especificos as $objetivo_especifico)
        {
            if($i==1)
            {
                $proyecto->objetivo_especifico_1_id=$objetivo_especifico->id;
                $proyecto->objetivo_especifico_1=$objetivo_especifico->descripcion;
            }
            if($i==2)
            {
                $proyecto->objetivo_especifico_2_id=$objetivo_especifico->id;
                $proyecto->objetivo_especifico_2=$objetivo_especifico->descripcion;
            }
            if($i==3)
            {
                $proyecto->objetivo_especifico_3_id=$objetivo_especifico->id;
                $proyecto->objetivo_especifico_3=$objetivo_especifico->descripcion;
            }
            $i++;
        }
        
        $reflexion=Reflexion::find()->where('user_id=:user_id',[':user_id'=>$usuario->id])->one();
        $proyecto->reflexion=$reflexion->reflexion;
        if($equipo->etapa==1 || $equipo->etapa==2)
        {
            $evaluacion=Evaluacion::find()->where('user_id=:user_id',[':user_id'=>$usuario->id])->one();
            $proyecto->evaluacion=$evaluacion->evaluacion;
        }
        $videoprimeraentrega=Video::find()->where('proyecto_id=:proyecto_id and etapa=:etapa',
                                        [':proyecto_id'=>$proyecto->id,':etapa'=>2])->one();
        
        
        return $this->render('proyectosegundaentrega',
                             ['proyecto'=>$proyecto,
                              'objetivos_especificos'=>$objetivos_especificos,
                              'actividades'=>$actividades,
                              'equipo'=>$equipo,
                              'videoprimeraentrega'=>$videoprimeraentrega]);
    }
}