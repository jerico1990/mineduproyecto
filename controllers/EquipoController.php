<?php

namespace app\controllers;

use Yii;

use app\models\Usuario;
use app\models\Integrante;
use app\models\Invitacion;
use app\models\Equipo;
use app\models\EquipoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * EquipoController implements the CRUD actions for Equipo model.
 */
class EquipoController extends Controller
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
     * Lists all Equipo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new EquipoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Equipo model.
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
     * Creates a new Equipo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Equipo();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Equipo model.
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
     * Deletes an existing Equipo model.
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
     * Finds the Equipo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Equipo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Equipo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionUnirme($id)
    {
        $invitacion=Invitacion::findOne($id);
        $invitacion->estado=2;
        $invitacion->fecha_aceptacion=date("Y-m-d H:i:s");
        $invitacion->update();
        
        Invitacion::updateAll(['estado' => 0], 'estado = 1 and estudiante_invitado_id=:estudiante_invitado_id and not id=:id',
                              [':estudiante_invitado_id'=>$invitacion->estudiante_invitado_id,':id'=>$id]);
        
        
        
        $integrante=new Integrante;
        $integrante->equipo_id=$invitacion->equipo_id;
        $integrante->estudiante_id=$invitacion->estudiante_invitado_id;
        $integrante->rol=2;
        $integrante->estado=1;
        $integrante->save();
        echo 1;
    }
    
    public function actionRechazar($id)
    {
        $invitacion=Invitacion::findOne($id);
        $invitacion->estado=0;
        $invitacion->fecha_rechazo=date("Y-m-d H:i:s");
        $invitacion->update();
        
        echo 1;
        
    }
    
    public function actionDejarequipo($id)
    {
        $lider=Integrante::find()->where('estudiante_id=:estudiante_id and rol=1',[':estudiante_id'=>$id])->one();
        if($lider)
        {
            //Integrante::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$lider->equipo_id])->one()->deleteAll();
            Invitacion::updateAll(['estado' => 0], 'equipo_id=:equipo_id',
                              [':equipo_id'=>$lider->equipo_id]);
            
            Integrante::deleteAll('equipo_id=:equipo_id',[':equipo_id'=>$lider->equipo_id]);
            
            Equipo::find()->where('id=:id',[':id'=>$lider->equipo_id])->one()->delete();
        }
        else
        {
            Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$id])->one()->delete();
            Invitacion::updateAll(['estado' => 0], 'estudiante_invitado_id=:estudiante_invitado_id',
                              [':estudiante_invitado_id'=>$id]);
        }
        echo 1;
    }
    public function actionValidarintegrante($id)
    {
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$id])->one();
        if($integrante)
        {
            echo 0;
        }
        else{
            echo 1;
        }
    }
    
    public function actionEliminarinvitado($id,$equipo)
    {
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id and equipo_id=:equipo_id',[':estudiante_id'=>$id,':equipo_id'=>$equipo])->one();
        if($integrante)
        {
            Integrante::find()->where('estudiante_id=:estudiante_id and equipo_id=:equipo_id',[':estudiante_id'=>$id,':equipo_id'=>$equipo])->one()->delete();
            echo 1;
        }
        else
        {
            $invitacion=Invitacion::find()
                        ->where('estudiante_invitado_id=:estudiante_invitado_id and estado=1 and equipo_id=:equipo_id',
                                [':estudiante_invitado_id'=>$id,':equipo_id'=>$equipo])->one();
            if($invitacion)
            {
                $invitacion->estado=0;
                $invitacion->fecha_rechazo=date("Y-m-d H:i:s");
                $invitacion->update();
            }
            
            echo 0;
        }
        
    }
    
    
    public function actionEliminarintegrante($id)
    {
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$id])->one();
        if($integrante)
        {
            $integrante->delete();
            
            Invitacion::updateAll(['estado' => 0], 'estudiante_invitado_id=:estudiante_invitado_id and estado=2',
                              [':estudiante_invitado_id'=>$id]);
            echo 1;
        }
        else
        {
            echo 2;
        }
        
        
    }
    public function actionValidarunirme($id)
    {
        $invitacion=Invitacion::find()->where('id=:id and estado=1',[':id'=>$id])->one();
        
        if($invitacion)
        {
            echo 1;
        }
        else
        {
            echo 0;
        }
        
    }
    
    public function actionValidarequipo($id)
    {
        
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$id])->one();
        
        if(!$integrante)
        {
            echo 1;
        }
        
        if($integrante && $integrante->estado==1)
        {
            echo 2;
        }
        elseif($integrante && $integrante->estado==2)
        {
            echo 3;
        }
        
    }
    
    public function actionFinalizarequipo($id)
    {
        $integrante=Integrante::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$id])->count();
        //var_dump($integrante);die;
        if($integrante>=4)
        {
            $equipo=Equipo::findOne($id);
            $equipo->estado=1;
            $equipo->etapa=0;
            $equipo->update();
            
            Integrante::updateAll(['estado' => 2], 'estado = 1 and equipo_id=:equipo_id',
                              [':equipo_id'=>$id]);
            
            Invitacion::updateAll(['estado' => 0,'fecha_rechazo'=>date("Y-m-d H:i:s")], 'estado = 1 and equipo_id=:equipo_id',
                              [':equipo_id'=>$id]);
            
            echo 1;
        }
        elseif($integrante<4)
        {
            echo 2; 
        }
    }
    
    public function actionValidarintegrante2()
    {
        $datos[]=["bandera"=>0];
        if(isset($_REQUEST['Invitacion']))
        {
            foreach($_REQUEST['Invitacion'] as $invitados => $key)
            {
                
                $integrante=Integrante::find()
                            ->select('estudiante.nombres_apellidos')
                            ->innerJoin('estudiante','estudiante.id=integrante.estudiante_id')
                            ->where('estudiante_id=:estudiante_id',[':estudiante_id'=>(integer) $key])->one();
                if($integrante)
                {
                    $datos[] =  ["bandera"=>1,"nombres_apellidos"=>$integrante->nombres_apellidos];
                }
            }
        }
        echo json_encode($datos);
    }
    
    public function actionValidarinvitacioneintegrante($estudiante,$equipo)
    {
        $lider=Usuario::findOne(\Yii::$app->user->id);
        
        $lider_integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$lider->estudiante_id])->one();
        
        if($lider_integrante && $equipo==0)
        {
            $equipo=$lider_integrante->equipo_id;
        }
        
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$estudiante])->one();
        $invitacion=Invitacion::find()->where('estudiante_invitado_id=:estudiante_invitado_id and estado=1 and equipo_id=:equipo_id ',
                                              [':estudiante_invitado_id'=>(integer) $estudiante,':equipo_id'=>(integer) $equipo])->one();
        
        $invitacionContador=Invitacion::find()->where('estado=1 and equipo_id=:equipo_id ',
                                              [':equipo_id'=>(integer) $equipo])->count();
        
        $integranteContador=Integrante::find()->where('equipo_id=:equipo_id ',
                                              [':equipo_id'=>(integer) $equipo])->count();
        $invitacionContador=$invitacionContador+$integranteContador;
        $bandera=0;
        if($integrante)
        {
            $bandera=1;
        }
        
        if($invitacion)
        {
            $bandera=2;
        }
        if($invitacionContador>3)
        {
            $bandera=3;
        }
        
        echo $bandera;
    }
    
    
    public function actionValidarinvitacioneintegrante2()
    {
        $error="";
        $bandera=0;
        $equipo= new Equipo;
        $equipo->load(Yii::$app->request->post());
        $countEstudiantes=count($equipo->invitaciones);
        //var_dump($countEstudiantes);
        for($i=0;$i<$countEstudiantes;$i++)
        {
            $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$equipo->invitaciones[$i]])->one();
            
            $invitacion=Invitacion::find()->where('estudiante_invitado_id=:estudiante_invitado_id and estado=1 and equipo_id=:equipo_id ',
                                              [':estudiante_invitado_id'=>$equipo->invitaciones[$i],':equipo_id'=>$equipo->id])->one();
            //var_dump($equipo->invitaciones[$i]);die;
            if($integrante)
            {
                $bandera=1;
                $error=$integrante->estudiante->nombres_apellidos." ya pertenece a un equipo <br>".$error;
            }
            
            if($invitacion)
            {
                $error=$invitacion->estudianteInvitado->nombres_apellidos." ya ha recibido una invitación tuya <br>".$error;
                $bandera=1;
            }
        }
        
        //var_dump($equipo->tipo);die;
        if($equipo->tipo==1 && $bandera==1)
        {
            echo 1;
        }
        if($equipo->tipo==2)
        {
            echo $error;
        }
        
        
        
        
    }
    
    public function actionExisteequipo()
    {
        $bandera=0;
        $lider=Usuario::findOne(\Yii::$app->user->id);
        $lider_integrante=Integrante::find()->where('estudiante_id=:estudiante_id and rol=1',[':estudiante_id'=>$lider->estudiante_id])->one();
        $equipo=Equipo::findOne($lider_integrante->equipo_id);
        if($equipo)
        {
            $bandera=1;    
        }
        echo $bandera;
    }
}
