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
use app\models\ProyectoCopia;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Cronograma;
use app\models\Reflexion;
use app\models\Video;
use app\models\Etapa;
use app\models\Evaluacion;
use app\models\PlanPresupuestal;
use app\models\Equipo;


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
        $etapa=Etapa::find()->where('estado=1')->one();
        $etapa1=Etapa::find()->where('estado=1 and etapa=1')->one();
        $etapa2=Etapa::find()->where('estado=1 and etapa=2')->one();
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
        $equipo=Equipo::findOne($integrante->equipo_id);
        
        $proyecto=Proyecto::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$integrante->equipo_id])->one();
        $proyectoCopia=ProyectoCopia::find()->where('equipo_id=:equipo_id and etapa=1',[':equipo_id'=>$integrante->equipo_id])->one();
        $videoprimera=Video::find()->where('proyecto_id=:proyecto_id and etapa in (0,1)',[':proyecto_id'=>$proyecto->id])->count();
        $videosegunda=Video::find()->where('proyecto_id=:proyecto_id and etapa in (0,2)',[':proyecto_id'=>$proyecto->id])->count();
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
               
        $asuntosprivados=Integrante::find()
                ->innerJoin('usuario','usuario.estudiante_id=integrante.estudiante_id')
                ->where('integrante.equipo_id=:equipo_id and usuario.id not in (select user_id from pre_forum_thread where board_id=1)',[':equipo_id'=>$integrante->equipo_id])
                ->all();
        $errorasuntoprivado='';
        foreach($asuntosprivados as $asuntoprivado)
        {
            $errorasuntoprivado='Falta comentar en el foro de "Asuntos Privados" ha '.$asuntoprivado->estudiante->nombres_apellidos.' <br>'.$errorasuntoprivado;
            
        }
        
        $asuntospublicos=Integrante::find()
                ->innerJoin('usuario','usuario.estudiante_id=integrante.estudiante_id')
                ->where('integrante.equipo_id=:equipo_id and usuario.id not in (select user_id from pre_forum_thread where board_id=2)',[':equipo_id'=>$integrante->equipo_id])
                ->all();
        $errorasuntopublico='';
        foreach($asuntospublicos as $asuntopublico)
        {
            $errorasuntopublico='Falta comentar en el foro de "Asuntos Públicos" ha '.$asuntopublico->estudiante->nombres_apellidos.' <br>'.$errorasuntopublico;
            
        }
        
        $reflexiones=Reflexion::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        $errorreflexion="";
        foreach($reflexiones as $reflexion)
        {
            if(trim($reflexion->reflexion)=='')
            {
                $errorreflexion="Falta ingresar una reflexión ".$reflexion->usuario->estudiante->nombres_apellidos." <br>".$errorreflexion;
            }
            
        }
        
        
        $evaluaciones=Evaluacion::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        //var_dump($evaluaciones);die;
        $errorevaluacion="";
        foreach($evaluaciones as $evaluacion)
        {
            if(trim($evaluacion->evaluacion)=='')
            {
                $errorevaluacion="Falta ingresar una evaluación de ".$evaluacion->usuario->estudiante->nombres_apellidos." <br>".$errorevaluacion;
            }
        }
        
        $recomendaciones=Integrante::find()
                ->innerJoin('usuario','usuario.estudiante_id=integrante.estudiante_id')
                ->where('integrante.equipo_id=:equipo_id and usuario.id not in (select user_id from pre_forum_thread where board_id not in (1,2))',[':equipo_id'=>$integrante->equipo_id])
                ->all();
        $errorrecomendaciones='';
        foreach($recomendaciones as $recomendacion)
        {
            $errorrecomendaciones='Falta realizar mínimo una recomendación en cualquiera de los proyectos '.$recomendacion->estudiante->nombres_apellidos.' <br>'.$errorrecomendaciones;
        }
        
        
        return $this->render('index',['proyecto'=>$proyecto,'actividades'=>$actividades,
                                      'cronogramas'=>$cronogramas,'planepresupuestales'=>$planepresupuestales,
                                      'errorasuntopublico'=>$errorasuntopublico,'errorreflexion'=>$errorreflexion,
                                      'videoprimera'=>$videoprimera,'videosegunda'=>$videosegunda,'etapa'=>$etapa,'proyectoCopia'=>$proyectoCopia,
                                      'errorevaluacion'=>$errorevaluacion,'errorasuntoprivado'=>$errorasuntoprivado,'errorrecomendaciones'=>$errorrecomendaciones,
                                      'equipo'=>$equipo,'etapa1'=>$etapa1,'etapa2'=>$etapa2]);
    }

}
