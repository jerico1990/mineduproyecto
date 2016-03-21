<?php

namespace app\controllers;

use Yii;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Proyecto;
use app\models\Reflexion;
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
        $actividad=Actividad::findOne($id);
        $actividad->estado=0;
        $actividad->update();
    }
    
    public function actionFinalizarprimeraentrega()
    {
        $proyecto=new Proyecto;
        $proyecto->load(Yii::$app->request->post());
        //var_dump($proyecto->id);die;
        $proyectocopia =    'insert into proyecto_copia (id,titulo,resumen,objetivo_general,beneficiario,user_id,asunto_id,equipo_id)
                            select id,titulo,resumen,objetivo_general,beneficiario,user_id,asunto_id,equipo_id from proyecto
                            where id='.$proyecto->id.'  ';
        \Yii::$app->db->createCommand($proyectocopia)->execute();
        
        $objetivosespecificoscopia =    'insert into objetivo_especifico_copia (id,proyecto_id,descripcion)
                            select id,proyecto_id,descripcion from objetivo_especifico
                            where proyecto_id='.$proyecto->id.'  ';
        \Yii::$app->db->createCommand($objetivosespecificoscopia)->execute();
        
        $actividadcopia =    'insert into actividad_copia (id,objetivo_especifico_id,descripcion,resultado_esperado,estado)
                            select actividad.id,actividad.objetivo_especifico_id,actividad.descripcion,actividad.resultado_esperado,actividad.estado from actividad
                            inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                            where objetivo_especifico.proyecto_id='.$proyecto->id.' and actividad.estado=1 ';
        \Yii::$app->db->createCommand($actividadcopia)->execute();
        
        
        $planpresupuestalcopia =    'insert into plan_presupuestal_copia (id,actividad_id,recurso,como_conseguirlo,precio_unitario,cantidad,subtotal,estado)
                            select plan_presupuestal.id,plan_presupuestal.actividad_id,plan_presupuestal.recurso,
                                    plan_presupuestal.como_conseguirlo,plan_presupuestal.precio_unitario,plan_presupuestal.cantidad,
                                    plan_presupuestal.subtotal,plan_presupuestal.estado
                            from plan_presupuestal
                            inner join actividad on plan_presupuestal.actividad_id=actividad.id
                            inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                            where objetivo_especifico.proyecto_id='.$proyecto->id.' and plan_presupuestal.estado=1  ';
        \Yii::$app->db->createCommand($planpresupuestalcopia)->execute();
        
        $cronogramacopia =    'insert into cronograma_copia (id,actividad_id,fecha_inicio,fecha_fin,duracion,responsable_id,estado)
                            select cronograma.id,cronograma.actividad_id,cronograma.fecha_inicio,cronograma.fecha_fin,
                            cronograma.duracion,cronograma.responsable_id,cronograma.estado
                            from cronograma
                            inner join actividad on cronograma.actividad_id=actividad.id
                            inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                            where objetivo_especifico.proyecto_id='.$proyecto->id.' and cronograma.estado=1 ';
        \Yii::$app->db->createCommand($cronogramacopia)->execute();
    }
    
    public function actionReflexion()
    {
        $reflexion=new Reflexion;
        $reflexion->load(Yii::$app->request->post());
        $reflexiona=Reflexion::find()->where('proyecto_id=:proyecto_id and user_id=:user_id',
                                            [':proyecto_id'=>$reflexion->proyecto_id,':user_id'=>$reflexion->user_id])->one();
        $reflexiona->reflexion=$reflexion->reflexion;
        $reflexiona->update();
        echo 1;
    }
}
