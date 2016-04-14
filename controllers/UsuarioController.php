<?php

namespace app\controllers;

use Yii;
use app\models\Estudiante;
use app\models\Registrar;

use app\models\Usuario;
use app\models\UsuarioSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * UsuarioController implements the CRUD actions for Usuario model.
 */
class UsuarioController extends Controller
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
     * Lists all Usuario models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UsuarioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Usuario model.
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
     * Creates a new Usuario model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Usuario();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Usuario model.
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
     * Deletes an existing Usuario model.
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
     * Finds the Usuario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Usuario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Usuario::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionConfiguracion()
    {
        $this->layout='equipo';
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $estudiante=Estudiante::find()->where('id=:id',[':id'=>$usuario->estudiante_id])->one();
        $registrar= new Registrar;
        $registrar->nombres=$estudiante->nombres;
        $registrar->apellido_paterno=$estudiante->apellido_paterno;
        $registrar->apellido_materno=$estudiante->apellido_materno;
        $registrar->sexo=$estudiante->sexo;
        $registrar->dni=$estudiante->dni;
        $registrar->fecha_nac=date('Y-m-d',strtotime($estudiante->fecha_nac));
        $registrar->email=$estudiante->email;
        $registrar->celular=$estudiante->celular;
        
        if ($registrar->load(Yii::$app->request->post())) {
            $estudiante->nombres=$registrar->nombres;
            $estudiante->apellido_paterno=$registrar->apellido_paterno;
            $estudiante->apellido_materno=$registrar->apellido_materno;
            $estudiante->sexo=$registrar->sexo;
            $estudiante->dni=$registrar->dni;
            $estudiante->email=$registrar->email;
            $estudiante->celular=$registrar->celular;
            $estudiante->update();
            
            if(trim($registrar->password)!='')
            {
                $usuario->password=md5($registrar->password);
            }
            $usuario->save();
            return $this->refresh();
        } else {
            return $this->render('configuracion',['registrar'=>$registrar]);
        }
        
    }
}
