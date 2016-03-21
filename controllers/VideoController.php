<?php

namespace app\controllers;

use Yii;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\StaleObjectException;
use app\models\Video;
use app\models\Proyecto;
use app\models\Etapa;
use yii\filters\AccessControl;
use yii\web\UploadedFile;

Yii::setAlias('video', '@web/video_carga/');


/**
 * VotoController implements the CRUD actions for Voto model.
 */
class VideoController extends Controller
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
     * Lists all Voto models.
     * @return mixed
     */
    public function actionIndex()
    {
        $this->layout='equipo';
        $proyecto=Proyecto::find()->where('user_id=:user_id',[':user_id'=>\Yii::$app->user->id])->one();
        if($proyecto)
        {
            $video=Video::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->one();
            if(!$video)
            {
                $video=new Video;
            }
        }
        else
        {
            $video=new Video;
        }
        
        
        
        
        if (Yii::$app->request->isPost) {
            $video->archivo = UploadedFile::getInstance($video, 'archivo');
            //$etapa=Etapa::find()->where('estado=1')->one();
            if($video->archivo) {
                $video->ruta=\Yii::$app->user->id. '.' . $video->archivo->extension;
                $video->proyecto_id=$proyecto->id;
                //$video->etapa=$etapa->etapa;
                $video->save();
                $video->archivo->saveAs('video_carga/' . \Yii::$app->user->id . '.' . $video->archivo->extension);
                //$model->file->saveAs('uploads/subcategories/'.$imageName.'.'.$model->file->extension);
            }
            return $this->refresh();
        }
/*
        if (Yii::$app->request->isPost) {
            
            if ($video->upload()) {
                // file is uploaded successfully
                
                
                return $this->refresh();
            }
        }*/
        
        
        /*
        if($video->archivo)
        {
            $video->archivo->saveAs('video_carga/' .\Yii::$app->user->id. '.' . $video->archivo->extension,true);
            //$video->archivo = 'video_carga/' .\Yii::$app->user->id. '.' . $video->archivo->extension;
            
        }*/
        return $this->render('index',['video'=>$video]);
    }
    public function actionDescargar($archivo)
    {
        
        
    }

}
