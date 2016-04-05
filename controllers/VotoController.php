<?php

namespace app\controllers;

use Yii;
use app\models\Voto;
use app\models\VotoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\StaleObjectException;
use app\models\VotacionPublica;
use app\models\VotacionFinal;

/**
 * VotoController implements the CRUD actions for Voto model.
 */
class VotoController extends Controller
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
     * Lists all Voto models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VotoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Voto model.
     * @param integer $asunto_id
     * @param string $region_id
     * @param integer $participante_id
     * @return mixed
     */
    public function actionView($asunto_id, $region_id, $participante_id)
    {
        return $this->render('view', [
            'model' => $this->findModel($asunto_id, $region_id, $participante_id),
        ]);
    }

    /**
     * Creates a new Voto model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Voto();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'asunto_id' => $model->asunto_id, 'region_id' => $model->region_id, 'participante_id' => $model->participante_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Voto model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $asunto_id
     * @param string $region_id
     * @param integer $participante_id
     * @return mixed
     */
    public function actionUpdate($asunto_id, $region_id, $participante_id)
    {
        $model = $this->findModel($asunto_id, $region_id, $participante_id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'asunto_id' => $model->asunto_id, 'region_id' => $model->region_id, 'participante_id' => $model->participante_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Voto model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $asunto_id
     * @param string $region_id
     * @param integer $participante_id
     * @return mixed
     */
    public function actionDelete($asunto_id, $region_id, $participante_id)
    {
        $this->findModel($asunto_id, $region_id, $participante_id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Voto model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $asunto_id
     * @param string $region_id
     * @param integer $participante_id
     * @return Voto the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($asunto_id, $region_id, $participante_id)
    {
        if (($model = Voto::findOne(['asunto_id' => $asunto_id, 'region_id' => $region_id, 'participante_id' => $participante_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionValidardni($dni)
    {
        $dni=Voto::find()->where('participante_id=:dni',[':dni'=>$dni])->one();
        if($dni)
        {
            echo 1;
        }
        else
        {
            echo 0;
        }
    }
    
    public function actionRegistrar()
    {
        $dni=$_GET['Voto']['dni'];
        $region=$_GET['Voto']['region'];
        $asuntos=$_GET['Asuntos'];
        
            //$participante=new Participante;
            //$participante->dni=$dni;
            //$participante->save();
            foreach($asuntos as $asunto => $key)
            {
                $voto=new Voto;
                $voto->participante_id=$dni;
                $voto->dni=$region;
                $voto->region_id=$region;
                $voto->asunto_id=$key;
                $voto->fecha_registro=date("Y-m-d H:i:s");
                $voto->estado=1;
                $voto->save();
            }
            
        //$participante=new Participante;
        //$transaction = Participante::getDb()->beginTransaction();
        try {
            
            
            $bandera=1;
        } catch(StaleObjectException  $e) {
            //$transaction->rollBack();
            $bandera=0;
            //throw $e;
        }
        echo $bandera;
        /*
        try {
            $participante=new Participante;
            $participante->dni=$dni;
            $participante->save();
            $bandera=1;
        }
        catch (Exception $e) {
            $bandera=0;
        }
        
        echo $bandera=1;*/
        /*
        try {
            $participante=new Participante;
            $participante->dni=$dni;
            $participante->save();
            
            foreach($asuntos as $asunto => $key)
            {
                $votacion=new Voto;
                $votacion->participante_id=$participante->id;
                $votacion->region_id=$region;
                $votacion->asunto_id=$key;
                $votacion->save();
            }
            echo 1;
        }
        catch (Exception $e) {
            echo 0;
        }*/
        
    }
    
    
    public function actionResultados($region)
    {
        //var_dump($_REQUEST);die;
        $table="";
        $resultados=Voto::find()
                    ->limit(3)
                    ->select(['asunto.descripcion_cabecera as asuntod','asunto_id','COUNT(asunto_id) contador'])
                    ->innerJoin('asunto','voto.asunto_id=asunto.id')
                    ->where('region_id=:region_id',[':region_id'=>$region])
                    ->groupBy('asuntod ,asunto_id')
                    ->orderBy('contador desc ')
                    ->all();
        $total=Voto::find()->select(['COUNT(asunto_id) contador'])
                    ->where('region_id=:region_id',[':region_id'=>$region])
                    ->one();
        $table="
        <table class=\"table table-hover\" id=\"dev-table\">
            <thead>
                <tr>
                        <th>#</th>
                        <th>Asunto</th>
                        <th>Resultado</th>
                </tr>
            </thead>
            <tbody>
            ";
        $i=1;
        foreach($resultados as $resultado)
        {
            $table=$table." <tr>
                                <td>$i</td>
                                <td>".$resultado->asuntod."</td>
                                <td>".$resultado->contador."</td>
                            </tr>";
            $i++;
        }
        
        $table=$table."</tbody>
        </table>";
        
        echo $table;
    }
    
    public function actionMostrarvotacionpublica($region)
    {
        $htmlvotacionespublicas='';
        $i=0;
        $votacionespublicas=VotacionPublica::find()->where('region_id=:region_id',[':region_id'=>$region])->all();
        foreach($votacionespublicas as $votacionpublica)
        {
            $htmlvotacionespublicas=$htmlvotacionespublicas.'<br>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">'.$votacionpublica->proyecto->titulo .'</h3>
                </div>
                <div class="panel-body">
                    Resumen:<p>'.$votacionpublica->proyecto->resumen .'</p>
                    Objetivo general:<p>'.$votacionpublica->proyecto->objetivo_general .'</p>
                    <button  type="button" class="" onclick="votar('.$votacionpublica->proyecto_id.')" >votar</button>
                </div>
                
            </div>
            ';
            $i++;
        }
        
        echo $htmlvotacionespublicas;
    
    }
    
    
    public function actionValidardnivotacionpublica($dni)
    {
        $dni=VotacionFinal::find()->where('dni=:dni',[':dni'=>$dni])->one();
        if($dni)
        {
            echo 1;
        }
        else
        {
            echo 0;
        }
    }
    
    public function actionVotacionfinal($dni,$proyecto)
    {
        $votacionfinal=new VotacionFinal;
        $votacionfinal->dni=$dni;
        $votacionfinal->proyecto_id=$proyecto;
        $votacionfinal->estado=1;
        $votacionfinal->save();
        echo 1;
    }
}
