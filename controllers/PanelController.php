<?php

namespace app\controllers;

use Yii;
use app\models\Equipo;
use app\models\Estudiante;
use app\models\Integrante;
use app\models\Usuario;
use app\models\Voto;
use app\models\Ubigeo;
use app\models\Participante;
use app\models\Invitacion;
use app\models\ParticipanteSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use app\models\Resultados;


/**
 * ParticipanteController implements the CRUD actions for Participante model.
 */
class PanelController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index','cerrarvotos'],
                'rules' => [
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'actions' => ['cerrarvotos'],
                        'allow' => true,
                        'roles' => ['administrador'],
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
     * Lists all Participante models.
     * @return mixed
     */
    public function actionIndex()
    {
        $this->layout='registrar';
        if(\Yii::$app->user->can('administrador'))
        {
            return $this->redirect(['acciones']);
        }
        
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $estudiante=Estudiante::find()->where('id=:id',[':id'=>$usuario->estudiante_id])->one();
        //$lider=Integrante::find()->where('estudiante_id=:estudiante_id and rol=1',[':estudiante_id'=>$estudiante->id])->one();
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$estudiante->id])->one();
        
        $invitaciones=Invitacion::find()
                        ->select('invitacion.id,equipo.descripcion_equipo,lider.nombres_apellidos,institucion.denominacion')
                        ->innerJoin('equipo','equipo.id=invitacion.equipo_id')
                        ->innerJoin('estudiante lider','invitacion.estudiante_id=lider.id')
                        ->innerJoin('institucion','institucion.id=lider.institucion_id')
                        ->where('invitacion.estudiante_invitado_id=:invitado and invitacion.estado=1',
                                [':invitado'=>$usuario->estudiante_id])
                        ->all();
                        
        
        
        return $this->render('index', ['invitaciones'=>$invitaciones,
                                       'integrante'=>$integrante,
                                       'estudiante'=>$estudiante,
                                       //'lider'=>$lider,
                            ]);
    }
    
    public function actionAcciones()
    {
        $this->layout='registrar';
        $resutaldos=Resultados::find()->all();
        $disabled='';
        if($resutaldos)
        {
            $disabled='disabled';
        }
        return $this->render('acciones',['disabled'=>$disabled]);
    }
    
    public function actionCerrar($bandera)
    {
        $resutaldos=Resultados::find()->all();
        $connection = \Yii::$app->db;
        $ubigeos=Ubigeo::find()->select('department_id,department')->groupBy('department_id')->orderBy('department desc')->all();
        if($bandera==1 && !$resutaldos)
        {
            foreach($ubigeos as $ubigeo)
            {
                $command=$connection->createCommand("
                    insert into resultados (asunto_id,region_id,cantidad)
                    select asunto_id,region_id,COUNT(asunto_id) contador from voto
                    where region_id='$ubigeo->department_id'
                    group by region_id,asunto_id
                    order by contador desc
                    limit 3;
                ");
                
                $command->execute();
                
            }
            echo 1;
        }
        else
        {
            echo 2;
        }
    }
    
    

}
