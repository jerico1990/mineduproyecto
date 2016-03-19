<?php

namespace app\controllers;

use Yii;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Proyecto;
use app\models\ProyectoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
/**
 * ProyectoController implements the CRUD actions for Proyecto model.
 */
class ProyectoController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index','actualizar'],
                'rules' => [
                    [
                        'actions' => ['index','actualizar'],
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
     * Lists all Proyecto models.
     * @return mixed
     */
    public function actionIndex()
    {
        $this->layout='equipo';
        $proyecto=Proyecto::find()->where('user_id=:user_id',[':user_id'=>\Yii::$app->user->id])->one();
        if($proyecto)
        {
            return $this->redirect(['panel/index']);
        }
        return $this->render('index');
    }

    /**
     * Displays a single Proyecto model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Proyecto model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Proyecto();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Proyecto model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Proyecto model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Proyecto model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Proyecto the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Proyecto::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionActualizar()
    {
        $this->layout='equipo';
        $actualizar=Proyecto::find()->where('user_id=:user_id',[':user_id'=>\Yii::$app->user->id])->one();
        
        return $this->render('actualizar');
    }
    
    public function actionEliminaractividad($id)
    {
        //var_dump($id);die;
        $actividad=Actividad::findOne($id);
        $actividad->estado=0;
        $actividad->update();
    }
    
    public function actionFinalizarprimeraentrega()
    {
        $proyecto= new Proyecto;
        $proyecto->load(Yii::$app->request->post());
        $proyecto=Proyecto::findOne($proyecto->id);
        $objetivosEspecificos=ObjetivoEspecifico::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto-id])->all();
        $actividades=Actividad::find()
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('objetivo_especifico.proyecto_id=:proyecto_id and actividad.estado=1',[':proyecto_id'=>$proyecto-id])
                    ->count();
        
        $cronogramas=Cronograma::find()
                    ->innerJoin('actividad','actividad.id=cronograma.actividad_id')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('objetivo_especifico.proyecto_id=:proyecto_id and cronograma.estado=1',[':proyecto_id'=>$proyecto-id])
                    ->count();
                    
        $planepresupuestales=PlanPresupuestal::find()
                    ->innerJoin('actividad','actividad.id=plan_presupuestal.actividad_id')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('objetivo_especifico.proyecto_id=:proyecto_id and plan_presupuestal.estado=1',[':proyecto_id'=>$proyecto-id])
                    ->count();
        
        if($actividades<1)
        {
            
        }
        
    }
}
