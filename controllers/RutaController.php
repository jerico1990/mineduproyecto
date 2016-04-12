<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use app\models\Equipo;
use app\models\Usuario;
use app\models\Integrante;
use app\models\Etapa;

/**
 * ActividadController implements the CRUD actions for Actividad model.
 */
class RutaController extends Controller
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
        $usuario=Usuario::find()->where('id=:id',[':id'=>\Yii::$app->user->id])->one();
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
        $equipo=Equipo::find()->where('id=:id',[':id'=>$integrante->equipo_id])->one();
        $integrantes=Integrante::find()
                            ->select('usuario.id user_id,estudiante.id,estudiante.nombres,estudiante.apellido_paterno,estudiante.apellido_materno')
                            ->innerJoin('estudiante','estudiante.id=integrante.estudiante_id')
                            ->innerJoin('usuario','usuario.estudiante_id=estudiante.id')
                            ->where('equipo_id=:equipo_id',[':equipo_id'=>$equipo->id])
                            ->all();
        
        
        
        
        return $this->render('index',['equipo'=>$equipo,'integrantes'=>$integrantes,'etapa'=>$etapa]);
        
        
    }
    
}
