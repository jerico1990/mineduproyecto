<?php

namespace app\controllers;

use Yii;
use app\models\Foro;
use app\models\ForoSearch;
use app\models\ForoComentario;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ForoController implements the CRUD actions for Foro model.
 */
class ForoController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Foro models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ForoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Foro model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $this->layout='equipo';
        $newComentario = new ForoComentario();
        $model=$this->findModel($id);
        if ($newComentario->load(Yii::$app->request->post())) {
            $newComentario->foro_id = $model->id;
            if ($newComentario->save()){
                Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Create successfully.'));
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }
        
        return $this->render('view', [
            'model' => $model,
            'newComentario'=>$newComentario
        ]);
    }

    /**
     * Creates a new Foro model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Foro();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Foro model.
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
     * Deletes an existing Foro model.
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
     * Finds the Foro model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Foro the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Foro::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
