<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use app\models\Usuario;
use app\models\Integrante;
use app\models\Proyecto;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Cronograma;
use app\models\Reflexion;
use app\models\PlanPresupuestal;
/**
 * ActividadController implements the CRUD actions for Actividad model.
 */
class EntregaController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index'],
                'rules' => [
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Actividad models.
     * @return mixed
     */
    public function actionIndex()
    {
        $this->layout='equipo';
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
        
        
        $proyecto=Proyecto::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$integrante->equipo_id])->one();
        
        $objetivosEspecificos=ObjetivoEspecifico::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        $actividades=Actividad::find()
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('objetivo_especifico.proyecto_id=:proyecto_id and actividad.estado=1',[':proyecto_id'=>$proyecto->id])
                    ->count();
        
        $cronogramas=Cronograma::find()
                    ->innerJoin('actividad','actividad.id=cronograma.actividad_id')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('objetivo_especifico.proyecto_id=:proyecto_id and cronograma.estado=1',[':proyecto_id'=>$proyecto->id])
                    ->count();
                    
        $planepresupuestales=PlanPresupuestal::find()
                    ->innerJoin('actividad','actividad.id=plan_presupuestal.actividad_id')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('objetivo_especifico.proyecto_id=:proyecto_id and plan_presupuestal.estado=1',[':proyecto_id'=>$proyecto->id])
                    ->count();
        
        $forums1025=Integrante::find()
                ->innerJoin('usuario','usuario.estudiante_id=integrante.estudiante_id')
                ->innerJoin('pre_forum_thread','pre_forum_thread.user_id=usuario.id')
                ->where('integrante.equipo_id=:equipo_id and pre_forum_thread.board_id=1025',[':equipo_id'=>$integrante->equipo_id])
                ->count();
        
        $forums1028=Integrante::find()
                ->innerJoin('usuario','usuario.estudiante_id=integrante.estudiante_id')
                ->innerJoin('pre_forum_thread','pre_forum_thread.user_id=usuario.id')
                ->where('integrante.equipo_id=:equipo_id and pre_forum_thread.board_id=1028',[':equipo_id'=>$integrante->equipo_id])
                ->count();
        
        $reflexiones=Reflexion::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        $errorreflexion="";
        foreach($reflexiones as $reflexion)
        {
            if(trim($reflexion->reflexion)=='')
            {
                $errorreflexion="Falta ingresar una reflexión ".$reflexion->usuario->estudiante->nombres_apellidos." <br>".$errorreflexion;
            }
            
        }
        
        
        return $this->render('index',['proyecto'=>$proyecto,'actividades'=>$actividades,
                                      'cronogramas'=>$cronogramas,'planepresupuestales'=>$planepresupuestales,
                                      'forums1025'=>$forums1025,'forums1028'=>$forums1028,'errorreflexion'=>$errorreflexion]);
    }

}
