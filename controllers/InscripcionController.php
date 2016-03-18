<?php

namespace app\controllers;

use Yii;
use app\models\Integrante;
use app\models\Registrar;
use app\models\Invitacion;
use app\models\Institucion;
use app\models\Estudiante;
use app\models\EstudianteSearch;
use app\models\Equipo;
use app\models\Usuario;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Json;
use yii\filters\AccessControl;
use kartik\widgets\Growl;
/**
 * ParticipanteController implements the CRUD actions for Participante model.
 */
class InscripcionController extends Controller
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
     * Lists all Participante models.
     * @return mixed
     */
    public function actionIndex()
    {
        $this->layout='equipo';
        
        $equipo=new Equipo;
        
        $institucion=Institucion::find()
                    ->select('institucion.id,estudiante.id as estudiante_id')
                    ->innerJoin('estudiante','estudiante.institucion_id=institucion.id')
                    ->innerJoin('usuario','usuario.estudiante_id=estudiante.id')
                    ->where('usuario.id='.\Yii::$app->user->id.'')
                    ->one();
        
        $estudiantes=Estudiante::find()
                    ->where('estudiante.institucion_id=:institucion_id and estudiante.id
                            not in  (select estudiante_id from integrante where estado=1) and estudiante.id!=:id
                            ',[':institucion_id'=>$institucion->id,':id'=>$institucion->estudiante_id])
                    ->all();
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$institucion->estudiante_id])->one();
        if($integrante)
        {
            return $this->redirect(['panel/index']);
        }
        
        $invitacionContador=0;
        
        if ($equipo->load(Yii::$app->request->post()) && $equipo->validate() ) {
            $bandera=true;
            $nombres="";
            $equipo->fecha_registro=date("Y-m-d H:i:s");
            $equipo->estado=0;
            $equipo->save();
            
            $lider=new Integrante;
            $lider->equipo_id=$equipo->id;
            $lider->estudiante_id=$institucion->estudiante_id;
            $lider->rol=1;//lider
            $lider->estado=1;
            $lider->save();
            
            Invitacion::updateAll(['estado' => 0], 'estado = 1 and estudiante_invitado_id=:estudiante_invitado_id',
                              [':estudiante_invitado_id'=>$institucion->estudiante_id]);
            
            if(isset($equipo->invitaciones))
            {
                $countInvitaciones=count($equipo->invitaciones);
                for($i=0;$i<$countInvitaciones;$i++)
                {
                    $invitacion=new Invitacion;
                    $integrante=Integrante::find()
                    ->select('estudiante.nombres_apellidos')
                    ->innerJoin('estudiante','estudiante.id=integrante.estudiante_id')
                    ->where('integrante.estudiante_id=:estudiante_id',[':estudiante_id'=>$equipo->invitaciones[$i]])->one();
                    if(!$integrante)
                    {
                        $invitacion->estudiante_id=$institucion->estudiante_id;
                        $invitacion->equipo_id=$equipo->id;
                        $invitacion->estudiante_invitado_id=$equipo->invitaciones[$i];
                        $invitacion->estado=1;
                        $invitacion->fecha_invitacion=date("Y-m-d H:i:s");
                        $invitacion->save();
                    }/*
                    else
                    {
                        $bandera=false;
                        $nombres=$nombres." ".$integrante->nombres_apellidos." ";
                    }*/
                }
            }
            //if($bandera)
            //{
                return $this->redirect(['panel/index']);
            //}
            /*else
            {
                $actualizar= Yii::$app->getUrlManager()->createUrl('inscripcion/actualizar?id='.$institucion->estudiante_id);
                echo "<script>
                            alert('".$nombres." ya  estan en un equipo');
                            window.location.href = '$actualizar';
                            
                        </script>";          
            }  */ 
        }
        return $this->render('index',[
                                      'equipo'=>$equipo,
                                      'estudiantes'=>$estudiantes,
                                      'invitacionContador'=>$invitacionContador]);
    }
    
    public function actionParticipante($q = null) {
        
        $participantes=  Estudiante::find()
                    ->where('nombres_apellidos like "%'.$q.'%"')
                    ->all();
        $out = [];
        foreach ($participantes as $participante) {
            $out[] = ['value' => $participante->id,'label' => $participante->nombres_apellidos." ".$participante->dni];
        }
        echo Json::encode($out);
    }
    
    public function actionActualizar($id)
    {
        $this->layout='equipo';
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$id])->one();
        $equipo=Equipo::find()->where('id=:id',[':id'=>$integrante->equipo_id])->one();
        $institucion=Institucion::find()
                    ->select('institucion.id,estudiante.id as estudiante_id')
                    ->innerJoin('estudiante','estudiante.institucion_id=institucion.id')
                    ->where('estudiante.id='.$id.'')
                    ->one();
        $estudiantes=Estudiante::find()
                    ->where('estudiante.institucion_id=:institucion_id and estudiante.id
                            not in (select estudiante_invitado_id from invitacion where estudiante_id='.$institucion->estudiante_id.' and estado=1)
                            and estudiante.id
                            not in (select estudiante_id from integrante where estado=1) and estudiante.id!=:id
                            ',[':institucion_id'=>$institucion->id,':id'=>$institucion->estudiante_id])
                    ->all();
        
        $invitacionContador=Invitacion::find()->where('estado=1 and equipo_id=:equipo_id ',
                                              [':equipo_id'=>$equipo->id])->count();
        
        $integranteContador=Integrante::find()->where('equipo_id=:equipo_id ',
                                              [':equipo_id'=>$equipo->id])->count();
        
        $invitacionContador=$invitacionContador+$integranteContador;
        if ($equipo->load(Yii::$app->request->post()) && $equipo->validate()) {
            $equipo->update();
            if(isset($equipo->invitaciones))
            {
                $countInvitaciones=count($equipo->invitaciones);
                for($i=0;$i<$countInvitaciones;$i++)
                {
                    $invitacion=new Invitacion;
                    $invitacion->estudiante_id=$institucion->estudiante_id;
                    $invitacion->equipo_id=$equipo->id;
                    $invitacion->estudiante_invitado_id=$equipo->invitaciones[$i];
                    $invitacion->estado=1;
                    $invitacion->fecha_invitacion=date("Y-m-d H:i:s");
                    $invitacion->save();
                }
            }
            
            return $this->redirect(['panel/index']);
        }
        return $this->render('index',[
                                      'equipo'=>$equipo,
                                      'estudiantes'=>$estudiantes,
                                      'invitacionContador'=>$invitacionContador]);
    }

}
