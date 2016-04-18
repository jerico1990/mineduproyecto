<?php

namespace app\controllers;

use Yii;
use app\models\Institucion;
use app\models\Ubigeo;
use app\models\UbigeoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * UbigeoController implements the CRUD actions for Ubigeo model.
 */
class UbigeoController extends Controller
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
     * Lists all Ubigeo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UbigeoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Ubigeo model.
     * @param string $department_id
     * @param string $district_id
     * @return mixed
     */
    public function actionView($department_id, $district_id)
    {
        return $this->render('view', [
            'model' => $this->findModel($department_id, $district_id),
        ]);
    }

    /**
     * Creates a new Ubigeo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Ubigeo();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'department_id' => $model->department_id, 'district_id' => $model->district_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Ubigeo model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $department_id
     * @param string $district_id
     * @return mixed
     */
    public function actionUpdate($department_id, $district_id)
    {
        $model = $this->findModel($department_id, $district_id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'department_id' => $model->department_id, 'district_id' => $model->district_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Ubigeo model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $department_id
     * @param string $district_id
     * @return mixed
     */
    public function actionDelete($department_id, $district_id)
    {
        $this->findModel($department_id, $district_id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Ubigeo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $department_id
     * @param string $district_id
     * @return Ubigeo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($department_id, $district_id)
    {
        if (($model = Ubigeo::findOne(['department_id' => $department_id, 'district_id' => $district_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionDepartamentos()
    {
        $ArrayDepartamentos=[];
        $countDepartamentos=Ubigeo::find()
                        ->select('department_id,department')
                        ->groupBy('department_id,department')
                        ->count();
        $AllDepartamentos=Ubigeo::find()->select('department_id,department')
                        ->groupBy('department_id,department')
                        ->orderBy('department')
                        ->all();
        
        if($countDepartamentos>0){
            foreach($AllDepartamentos as $OneDepartamento){
                array_push($ArrayDepartamentos,$OneDepartamento->attributes);
            }
        }
        echo json_encode($ArrayDepartamentos); 
    }
    
    
    public function actionProvincias($departamento)
    {
        $ArrayProvincias=[];
        $countProvincias=Ubigeo::find()
                        ->select('province_id,province')
                        ->innerJoin('institucion i','i.ubigeo_id=ubigeo.district_id')
                        ->where('department_id=:department_id',[':department_id'=>$departamento])
                        ->groupBy('province_id,province')
                        ->count();
                        
        $AllProvincias=Ubigeo::find()->select('province_id,province')
                        ->innerJoin('institucion i','i.ubigeo_id=ubigeo.district_id')
                        ->where('department_id=:department_id',[':department_id'=>$departamento])
                        ->groupBy('province_id,province')
                        ->orderBy('province')->all();
        
        if($countProvincias>0){
            foreach($AllProvincias as $OneProvincias){
                array_push($ArrayProvincias,$OneProvincias->attributes);
            }
        }
        echo json_encode($ArrayProvincias); 
    }
    
    
    public function actionDistritos($provincia)
    {
        $ArrayDistritos=[];
        $countDistritos=Ubigeo::find()
                        ->select('district_id,district')
                        ->innerJoin('institucion i','i.ubigeo_id=ubigeo.district_id')
                        ->where('province_id=:province_id',[':province_id'=>$provincia])
                        ->groupBy('district_id,district')
                        ->count();
        $AllDistritos=Ubigeo::find()
                    ->select('district_id,district')
                    ->innerJoin('institucion i','i.ubigeo_id=ubigeo.district_id')
                    ->where('province_id=:province_id',[':province_id'=>$provincia])
                    ->groupBy('district_id,district')
                    ->orderBy('district')
                    ->all();
      
        if($countDistritos>0){
            foreach($AllDistritos as $OneDistrito){
                array_push($ArrayDistritos,$OneDistrito->attributes);
            }
        }
        echo json_encode($ArrayDistritos);         
    }
    
    
    public function actionInstituciones($distrito)
    {
        $ArrayInstituciones=[];
        $countInstitucion=Institucion::find()
                    ->select('id,denominacion,codigo_modular')
                    ->where('ubigeo_id=:ubigeo_id and estado=1',[':ubigeo_id'=>$distrito])
                    ->groupBy('id,denominacion,codigo_modular')
                    ->count();
                    
        $AllInstituciones=Institucion::find()
                    ->select('id,denominacion,codigo_modular')
                    ->where('ubigeo_id=:ubigeo_id and estado=1',[':ubigeo_id'=>$distrito])
                    ->groupBy('id,denominacion,codigo_modular')
                    ->orderBy('denominacion asc')
                    ->all();
        
        if($countInstitucion>0){
            foreach($AllInstituciones as $OneInstitucion){
                array_push($ArrayInstituciones,$OneInstitucion->attributes);
            }
        }
        echo json_encode($ArrayInstituciones);     
    }
}
