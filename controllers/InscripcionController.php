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
use yii\web\UploadedFile;
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
        $this->layout='estandar';
        
        $equipo=new Equipo;
        $equipo->foto='no_disponible.jpg';
        $institucion=Institucion::find()
                    ->select('institucion.id,estudiante.id as estudiante_id,ubigeo.department_id')
                    ->innerJoin('estudiante','estudiante.institucion_id=institucion.id')
                    ->innerJoin('usuario','usuario.estudiante_id=estudiante.id')
                    ->innerJoin('ubigeo','ubigeo.district_id=institucion.ubigeo_id')
                    ->where('usuario.id='.\Yii::$app->user->id.'')
                    ->one();
        
        $estudiantes=Estudiante::find()
                    ->where('estudiante.institucion_id=:institucion_id and estudiante.id
                            not in (select estudiante_id from integrante) and estudiante.id!=:id
                            ',[':institucion_id'=>$institucion->id,':id'=>$institucion->estudiante_id])
                    ->orderBy('grado asc')->all();
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$institucion->estudiante_id])->one();
        if($integrante)
        {
            return $this->redirect(['panel/index']);
        }
        
        $invitacionContador=0;
        
        if ($equipo->load(Yii::$app->request->post()) && $equipo->validate() ) {
            $equipo->foto_img = UploadedFile::getInstance($equipo, 'foto_img');
            
            $bandera=true;
            $nombres="";
            $equipo->fecha_registro=date("Y-m-d H:i:s");
            $equipo->estado=0;
            $equipo->save();
            if($equipo->foto_img)
            {
                $equipo->foto=$equipo->id. '.' . $equipo->foto_img->extension;
            }
            else
            {
                $equipo->foto="no_disponible.jpg";
            }
            $equipo->update();
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
                    }
                }
            }
            if($equipo->foto_img)
            {
                $equipo->foto_img->saveAs('foto_equipo/' . $equipo->id . '.' . $equipo->foto_img->extension);
            }
            
            
            return $this->redirect(['panel/index']);
           
        }
        return $this->render('index',[
                                      'equipo'=>$equipo,
                                      'estudiantes'=>$estudiantes,
                                      'invitacionContador'=>$invitacionContador,'institucion'=>$institucion]);
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
        $this->layout='estandar';
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$id])->one();
        $equipo=Equipo::find()->where('id=:id',[':id'=>$integrante->equipo_id])->one();
        if(!$equipo->foto)
        {
            $equipo->foto='no_disponible.jpg';
        }
        
        $institucion=Institucion::find()
                    ->select('institucion.id,estudiante.id as estudiante_id,ubigeo.department_id')
                    ->innerJoin('estudiante','estudiante.institucion_id=institucion.id')
                    ->innerJoin('usuario','usuario.estudiante_id=estudiante.id')
                    ->innerJoin('ubigeo','ubigeo.district_id=institucion.ubigeo_id')
                    ->where('usuario.id='.\Yii::$app->user->id.'')
                    ->one();
                    
        $estudiantes=Estudiante::find()
                    ->where('estudiante.institucion_id=:institucion_id and estudiante.id
                            not in (select estudiante_invitado_id from invitacion where estudiante_id='.$institucion->estudiante_id.' and estado=1)
                            and estudiante.id
                            not in (select estudiante_id from integrante) and estudiante.id!=:id
                            ',[':institucion_id'=>$institucion->id,':id'=>$institucion->estudiante_id])
                    ->orderBy('grado asc')->all();
        
        $invitacionContador=Invitacion::find()->where('estado=1 and equipo_id=:equipo_id ',
                                              [':equipo_id'=>$equipo->id])->count();
        
        $integranteContador=Integrante::find()->where('equipo_id=:equipo_id ',
                                              [':equipo_id'=>$equipo->id])->count();
        
        $invitacionContador=$invitacionContador+$integranteContador;
        if ($equipo->load(Yii::$app->request->post()) && $equipo->validate()) {
            $equipo->foto_img = UploadedFile::getInstance($equipo, 'foto_img');
            //var_dump($equipo->foto_img);die;
            if($equipo->foto_img)
            {
                $equipo->foto=$equipo->id. '.' . $equipo->foto_img->extension; 
            }
            else
            {
                $equipo->foto="no_disponible.jpg"; 
            }
            
            
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
            if($equipo->foto_img)
            {
                $equipo->foto_img->saveAs('foto_equipo/' . $equipo->id . '.' . $equipo->foto_img->extension);
            }
            
            return $this->refresh();
            //return $this->redirect(['panel/index']);
        }
        return $this->render('index',[
                                      'equipo'=>$equipo,
                                      'estudiantes'=>$estudiantes,
                                      'invitacionContador'=>$invitacionContador,
                                      'institucion'=>$institucion]);
    }

}
