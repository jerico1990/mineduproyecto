<?php

namespace app\controllers;

use Yii;
use app\models\Actividad;
use app\models\ObjetivoEspecifico;
use app\models\Proyecto;
use app\models\ProyectoCopia;
use app\models\Reflexion;
use app\models\ProyectoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use app\models\Etapa;
use app\models\Equipo;
use app\models\Usuario;
use app\models\Integrante;
use app\models\Video;
use app\models\Evaluacion;
use app\models\VotacionInterna;



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
                'only' => ['index','actualizar','buscar'],
                'rules' => [
                    [
                        'actions' => ['index','actualizar','buscar'],
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
        $etapa=Etapa::find()->where('estado=1')->one();
        $proyecto=new Proyecto;
        $proyecto->load(Yii::$app->request->post());
        $proyectoexiste=ProyectoCopia::find()->where('id=:id and etapa=1',[':id'=>$proyecto->id])->one();
        if(!$proyectoexiste)
        {
            $proyectocopia =    'insert into proyecto_copia (id,titulo,resumen,objetivo_general,beneficiario,user_id,asunto_id,equipo_id,etapa)
                                select id,titulo,resumen,objetivo_general,beneficiario,user_id,asunto_id,equipo_id,1 from proyecto
                                where id='.$proyecto->id.'  ';
            \Yii::$app->db->createCommand($proyectocopia)->execute();
            
            $objetivosespecificoscopia =    'insert into objetivo_especifico_copia (id,proyecto_id,descripcion,etapa)
                                select id,proyecto_id,descripcion,1 from objetivo_especifico
                                where proyecto_id='.$proyecto->id.'  ';
            \Yii::$app->db->createCommand($objetivosespecificoscopia)->execute();
            
            $actividadcopia =    'insert into actividad_copia (id,objetivo_especifico_id,descripcion,resultado_esperado,estado,etapa)
                                select actividad.id,actividad.objetivo_especifico_id,actividad.descripcion,actividad.resultado_esperado,actividad.estado,1 from actividad
                                inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                                where objetivo_especifico.proyecto_id='.$proyecto->id.' and actividad.estado=1 ';
            \Yii::$app->db->createCommand($actividadcopia)->execute();
            
            
            $planpresupuestalcopia =    'insert into plan_presupuestal_copia (id,actividad_id,recurso,como_conseguirlo,precio_unitario,cantidad,subtotal,estado,etapa)
                                select plan_presupuestal.id,plan_presupuestal.actividad_id,plan_presupuestal.recurso,
                                        plan_presupuestal.como_conseguirlo,plan_presupuestal.precio_unitario,plan_presupuestal.cantidad,
                                        plan_presupuestal.subtotal,plan_presupuestal.estado,1
                                from plan_presupuestal
                                inner join actividad on plan_presupuestal.actividad_id=actividad.id
                                inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                                where objetivo_especifico.proyecto_id='.$proyecto->id.' and plan_presupuestal.estado=1  ';
            \Yii::$app->db->createCommand($planpresupuestalcopia)->execute();
            
            $cronogramacopia =    'insert into cronograma_copia (id,actividad_id,fecha_inicio,fecha_fin,duracion,responsable_id,estado,etapa)
                                select cronograma.id,cronograma.actividad_id,cronograma.fecha_inicio,cronograma.fecha_fin,
                                cronograma.duracion,cronograma.responsable_id,cronograma.estado,1
                                from cronograma
                                inner join actividad on cronograma.actividad_id=actividad.id
                                inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                                where objetivo_especifico.proyecto_id='.$proyecto->id.' and cronograma.estado=1 ';
            \Yii::$app->db->createCommand($cronogramacopia)->execute();
            
            $videocopia =    'insert into video_copia (id,proyecto_id,ruta,etapa)
                                select id,proyecto_id,ruta,1 from video
                                where proyecto_id='.$proyecto->id.' and etapa=0 ';
            \Yii::$app->db->createCommand($videocopia)->execute();
            
            
            $usuario=Usuario::findOne(\Yii::$app->user->id);
            $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
            $video=Video::find()->where('proyecto_id=:proyecto_id and etapa=:etapa',
                                        [':proyecto_id'=>$proyecto->id,':etapa'=>0])->one();
            $video->etapa=1;
            $video->update();
            $evaluacion = 'insert into evaluacion (evaluacion,proyecto_id,user_id)
                    select "" , '.$proyecto->id.' , usuario.id from integrante
                    inner join usuario on usuario.estudiante_id=integrante.estudiante_id
                    where  integrante.equipo_id='.$integrante->equipo_id.' ';
            
            \Yii::$app->db->createCommand($evaluacion)->execute();
            
            
            
            $proyectoetapa=Proyecto::findOne($proyecto->id);
            $equipo=Equipo::findOne($proyectoetapa->equipo_id);
            $equipo->etapa=$etapa->etapa;
            $equipo->update();
            
            /*$proyectoetapa=Proyecto::findOne($proyecto->id);
            $proyectoetapa->etapa=$etapa->etapa;
            $proyectoetapa->update();
            $video=Video::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->one();
            $video->etapa=$etapa->etapa;
            $video->update();
            */
            echo 1;
        }
        else
        {
            echo 2;
        }
    }
    
    
    public function actionFinalizarsegundaentrega()
    {
        $etapa=Etapa::find()->where('estado=1')->one();
        $proyecto=new Proyecto;
        $proyecto->load(Yii::$app->request->post());
        $proyectoexiste=ProyectoCopia::find()->where('id=:id and etapa=2',[':id'=>$proyecto->id])->one();
        if(!$proyectoexiste)
        {
            $proyectocopia =    'insert into proyecto_copia (id,titulo,resumen,objetivo_general,beneficiario,user_id,asunto_id,equipo_id,etapa)
                                select id,titulo,resumen,objetivo_general,beneficiario,user_id,asunto_id,equipo_id,2 from proyecto
                                where id='.$proyecto->id.'  ';
            \Yii::$app->db->createCommand($proyectocopia)->execute();
            
            $objetivosespecificoscopia =    'insert into objetivo_especifico_copia (id,proyecto_id,descripcion,etapa)
                                select id,proyecto_id,descripcion,2 from objetivo_especifico
                                where proyecto_id='.$proyecto->id.'  ';
            \Yii::$app->db->createCommand($objetivosespecificoscopia)->execute();
            
            $actividadcopia =    'insert into actividad_copia (id,objetivo_especifico_id,descripcion,resultado_esperado,estado,etapa)
                                select actividad.id,actividad.objetivo_especifico_id,actividad.descripcion,actividad.resultado_esperado,actividad.estado,2 from actividad
                                inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                                where objetivo_especifico.proyecto_id='.$proyecto->id.' and actividad.estado=1 ';
            \Yii::$app->db->createCommand($actividadcopia)->execute();
            
            
            $planpresupuestalcopia =    'insert into plan_presupuestal_copia (id,actividad_id,recurso,como_conseguirlo,precio_unitario,cantidad,subtotal,estado,etapa)
                                select plan_presupuestal.id,plan_presupuestal.actividad_id,plan_presupuestal.recurso,
                                        plan_presupuestal.como_conseguirlo,plan_presupuestal.precio_unitario,plan_presupuestal.cantidad,
                                        plan_presupuestal.subtotal,plan_presupuestal.estado,2
                                from plan_presupuestal
                                inner join actividad on plan_presupuestal.actividad_id=actividad.id
                                inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                                where objetivo_especifico.proyecto_id='.$proyecto->id.' and plan_presupuestal.estado=1  ';
            \Yii::$app->db->createCommand($planpresupuestalcopia)->execute();
            
            $cronogramacopia =    'insert into cronograma_copia (id,actividad_id,fecha_inicio,fecha_fin,duracion,responsable_id,estado,etapa)
                                select cronograma.id,cronograma.actividad_id,cronograma.fecha_inicio,cronograma.fecha_fin,
                                cronograma.duracion,cronograma.responsable_id,cronograma.estado,2
                                from cronograma
                                inner join actividad on cronograma.actividad_id=actividad.id
                                inner join objetivo_especifico on objetivo_especifico.id=actividad.objetivo_especifico_id
                                where objetivo_especifico.proyecto_id='.$proyecto->id.' and cronograma.estado=1 ';
            \Yii::$app->db->createCommand($cronogramacopia)->execute();
            
            $videocopia =    'insert into video_copia (id,proyecto_id,ruta,etapa)
                                select id,proyecto_id,ruta,2 from video
                                where proyecto_id='.$proyecto->id.' and etapa=0';
            \Yii::$app->db->createCommand($videocopia)->execute();
            
            
            $usuario=Usuario::findOne(\Yii::$app->user->id);
            $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
            $video=Video::find()->where('proyecto_id=:proyecto_id and etapa=:etapa',
                                        [':proyecto_id'=>$proyecto->id,':etapa'=>0])->one();
            $video->etapa=2;
            $video->update();
            /*$evaluacion = 'insert into evaluacion (evaluacion,proyecto_id,user_id)
                    select "" , '.$proyecto->id.' , usuario.id from integrante
                    inner join usuario on usuario.estudiante_id=integrante.estudiante_id
                    where  integrante.equipo_id='.$integrante->equipo_id.' ';
            
            \Yii::$app->db->createCommand($evaluacion)->execute();
            */
            
            
            $proyectoetapa=Proyecto::findOne($proyecto->id);
            $equipo=Equipo::findOne($proyectoetapa->equipo_id);
            $equipo->etapa=$etapa->etapa;
            $equipo->update();
            
            /*$proyectoetapa=Proyecto::findOne($proyecto->id);
            $proyectoetapa->etapa=$etapa->etapa;
            $proyectoetapa->update();
            $video=Video::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->one();
            $video->etapa=$etapa->etapa;
            $video->update();
            */
            echo 1;
        }
        else
        {
            echo 2;
        }
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
    
    public function actionEvaluacion()
    {
        $evaluacion=new Evaluacion;
        $evaluacion->load(Yii::$app->request->post());
        $evaluaciona=Evaluacion::find()->where('proyecto_id=:proyecto_id and user_id=:user_id',
                                            [':proyecto_id'=>$evaluacion->proyecto_id,':user_id'=>$evaluacion->user_id])->one();
        $evaluaciona->evaluacion=$evaluacion->evaluacion;
        $evaluaciona->update();
        echo 1;
    }
    
    public function actionCerrarprimeraentrega()
    {
        $proyectoexiste=ProyectoCopia::find()->where('etapa=1')->all();
        $etapa=Etapa::find()->where('estado=1 and etapa=1')->one();
        if($proyectoexiste && $etapa)
        {
            $pre_forum_proyectos = 'insert into pre_forum (forum_name,forum_desc,user_id,status,proyecto_id)
                    select proyecto.titulo,proyecto.titulo,1,1,proyecto.id from proyecto
                    inner join equipo on equipo.id=proyecto.equipo_id
                    where  equipo.etapa=1';
            
            \Yii::$app->db->createCommand($pre_forum_proyectos)->execute();
            
            $uppre_forum_proyectos = 'update pre_forum set forum_url=id';
            
            \Yii::$app->db->createCommand($uppre_forum_proyectos)->execute();
            
            $pre_forum_board_proyectos = 'insert into pre_forum_board (parent_id,name,columns,forum_id,user_id)
                    select 1,pre_forum.forum_name,1,pre_forum.id,1 from pre_forum
                    where  pre_forum.id not in (1,2)';
            
            \Yii::$app->db->createCommand($pre_forum_board_proyectos)->execute();
            
            $etapa->estado=0;
            $etapa->update();
            $nuevaetapa=new Etapa;
            $nuevaetapa->etapa=2;
            $nuevaetapa->estado=1;
            $nuevaetapa->save();
            echo 1;
        }
        else
        {
            echo 2;
        }
    }
    
    public function actionCerrarsegundaentrega()
    {
        $proyectoexiste=ProyectoCopia::find()->where('etapa=2')->all();
        $etapa=Etapa::find()->where('estado=1 and etapa=2')->one();
        if($proyectoexiste && $etapa)
        {
            $etapa->estado=0;
            $etapa->update();
            $nuevaetapa=new Etapa;
            $nuevaetapa->etapa=3;
            $nuevaetapa->estado=1;
            $nuevaetapa->save();
            echo 1;
        }
        else
        {
            echo 2;
        }
    }
    
    public function actionBuscar()
    {
        $this->layout='equipo';
        $searchModel = new ProyectoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        
        return $this->render('buscar',[
                                        'searchModel' => $searchModel,
                                        'dataProvider' => $dataProvider,]);
    }
    
    public function actionVotacion()
    {
        $this->layout='equipo';
        $searchModel = new ProyectoSearch();
        $dataProvider = $searchModel->votacion(Yii::$app->request->queryParams);
        ///$usuario=Usuario::findOne(\Yii::$app->user->id);
        //$integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
       // $proyecto=Proyecto::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$integrante->equipo_id])->one();
        $votacionesinternas=VotacionInterna::find()
                            ->where('user_id=:user_id and estado in (1,2)',
                                    [':user_id'=>\Yii::$app->user->id])
                            ->all();
                            
                            
        $votacionesinternasCount=VotacionInterna::find()
                            ->where('user_id=:user_id and estado=1',
                                    [':user_id'=>\Yii::$app->user->id])
                            ->count();
        $votacionesinternasfinalizadasCount=VotacionInterna::find()
                            ->where('user_id=:user_id and estado=2',
                                    [':user_id'=>\Yii::$app->user->id])
                            ->count();                    
                            
        return $this->render('votacion',[
                                        'searchModel' => $searchModel,
                                        'dataProvider' => $dataProvider,
                                        'votacionesinternas'=>$votacionesinternas,
                                        'votacionesinternasCount'=>$votacionesinternasCount,
                                        'votacionesinternasfinalizadasCount'=>$votacionesinternasfinalizadasCount]);
    }
    
    public function actionVotacioninterna($id)
    {
        $proyecto=Proyecto::findOne($id);
        $votacioninterna=VotacionInterna::find()
                            ->where('proyecto_id=:proyecto_id and user_id=:user_id and estado=1',
                                    [':proyecto_id'=>$proyecto->id,':user_id'=>\Yii::$app->user->id])
                            ->one();
        
        $countvotacioninterna=VotacionInterna::find()
                            ->where( 'user_id=:user_id',
                                    [':user_id'=>\Yii::$app->user->id])
                            ->count();
                            
        if($countvotacioninterna<4)
        {
            if(!$votacioninterna)
            {
                $votacioninterna=new VotacionInterna;
                $votacioninterna->proyecto_id=$proyecto->id;
                $votacioninterna->region_id=$proyecto->region_id;
                $votacioninterna->user_id=\Yii::$app->user->id;
                $votacioninterna->estado=1;
                $votacioninterna->save();
                echo 1;
            }
            else
            {
                VotacionInterna::find()
                                ->where('proyecto_id=:proyecto_id and user_id=:user_id and estado=1',
                                        [':proyecto_id'=>$proyecto->id,':user_id'=>\Yii::$app->user->id])
                                ->one()
                                ->delete();
                echo 2;
            }
        }
        else
        {
            echo 3;
        }
        
        
    }
    
    public function actionFinalizarvotacioninterna()
    {
        /*$votacioninterna=VotacionInterna::find()
                            ->where('proyecto_id=:proyecto_id and user_id=:user_id and estado=1',
                                    [':proyecto_id'=>$proyecto->id,':user_id'=>\Yii::$app->user->id])
                            ->all();*/
        $updatevotacioninterna =    'update votacion_interna set estado=2 where user_id='.\Yii::$app->user->id.' and estado=1';
            
        \Yii::$app->db->createCommand($updatevotacioninterna)->execute();
        
        echo 1;
    }
}
