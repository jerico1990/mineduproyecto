<?php
namespace app\widgets\proyecto;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Reflexion;
use app\models\Proyecto;
use app\models\Usuario;
use app\models\Integrante;
use app\models\Actividad;
use app\models\Equipo;
use app\models\ObjetivoEspecifico;
use app\models\Evaluacion;
use app\models\PlanPresupuestal;
use app\models\Cronograma;
use app\models\Video;
use app\models\VideoCopia;
use app\models\Etapa;
use app\models\ForoComentario;
use app\models\Foro;


use yii\web\UploadedFile;
Yii::setAlias('video', '@web/video_carga/');
class ActualizarProyectoWidget extends Widget
{
    public $message;
    public $entrega;
    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $newComentario = new ForoComentario();
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
        $equipo=Equipo::findOne($integrante->equipo_id);
        $disabled='';
        if($integrante->rol==2)
        {
            $disabled='disabled';
        }
        
        $proyecto=Proyecto::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$integrante->equipo_id])->one();
        $objetivos_especificos=ObjetivoEspecifico::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        
        $video=Video::find()->where('proyecto_id=:proyecto_id and etapa=:etapa',
                                    [':proyecto_id'=>$proyecto->id,':etapa'=>0])->one();
        if(!$video)
        {
            $video=new Video;
        }
        
        $i=1;
        foreach($objetivos_especificos as $objetivo_especifico)
        {
            if($i==1)
            {
                $proyecto->objetivo_especifico_1_id=$objetivo_especifico->id;
                $proyecto->objetivo_especifico_1=$objetivo_especifico->descripcion;
            }
            if($i==2)
            {
                $proyecto->objetivo_especifico_2_id=$objetivo_especifico->id;
                $proyecto->objetivo_especifico_2=$objetivo_especifico->descripcion;
            }
            if($i==3)
            {
                $proyecto->objetivo_especifico_3_id=$objetivo_especifico->id;
                $proyecto->objetivo_especifico_3=$objetivo_especifico->descripcion;
            }
            $i++;
        }
        $actividades=Actividad::find()
                    ->select('objetivo_especifico.id objetivo_especifico_id,actividad.id actividad_id,actividad.descripcion,actividad.resultado_esperado')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('proyecto_id=:proyecto_id and actividad.estado=1',[':proyecto_id'=>$proyecto->id])->all();
        $actividades1=Actividad::find()
                    ->select('objetivo_especifico.id objetivo_especifico_id,actividad.id actividad_id,actividad.descripcion')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('proyecto_id=:proyecto_id and actividad.estado=1 and objetivo_especifico.id=:id',[':proyecto_id'=>$proyecto->id,':id'=>$proyecto->objetivo_especifico_1_id])->all();
        $actividades2=Actividad::find()
                    ->select('objetivo_especifico.id objetivo_especifico_id,actividad.id actividad_id,actividad.descripcion')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('proyecto_id=:proyecto_id and actividad.estado=1 and objetivo_especifico.id=:id',[':proyecto_id'=>$proyecto->id,':id'=>$proyecto->objetivo_especifico_2_id])->all();
        $actividades3=Actividad::find()
                    ->select('objetivo_especifico.id objetivo_especifico_id,actividad.id actividad_id,actividad.descripcion')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('proyecto_id=:proyecto_id and actividad.estado=1 and objetivo_especifico.id=:id',[':proyecto_id'=>$proyecto->id,':id'=>$proyecto->objetivo_especifico_3_id])->all();
                    
        $reflexion=Reflexion::find()->where('proyecto_id=:proyecto_id and user_id=:user_id',[':user_id'=>$usuario->id,':proyecto_id'=>$proyecto->id])->one();
        $proyecto->reflexion=$reflexion->reflexion;
        //var_dump($proyecto->reflexion);die;
        if($equipo->etapa==1 || $equipo->etapa==2)
        {
            $evaluacion=Evaluacion::find()->where('proyecto_id=:proyecto_id and user_id=:user_id',[':user_id'=>$usuario->id,':proyecto_id'=>$proyecto->id])->one();
            $proyecto->evaluacion=$evaluacion->evaluacion;
        }
        
        
        
        if ($proyecto->load(\Yii::$app->request->post())) {
            //var_dump(\Yii::$app->request->post());die;
            $reflexion->reflexion=$proyecto->reflexion;
            $reflexion->update();
            $proyecto->update();
            if(!$proyecto->actividades_1)
            {
                $countActividades1=0;
            }
            else
            {
                $countActividades1=count(array_filter($proyecto->actividades_1));
            }
            if(!$proyecto->actividades_2)
            {
                $countActividades2=0;
            }
            else
            {
                $countActividades2=count(array_filter($proyecto->actividades_2));
            }
            if(!$proyecto->actividades_3)
            {
                $countActividades3=0;
            }
            else
            {
                $countActividades3=count(array_filter($proyecto->actividades_3));
            }
            
            if(!$proyecto->planes_presupuestales_cantidades)
            {
                $countPlanesPresupuestalesCantidades=0;
            }
            else
            {
                $countPlanesPresupuestalesCantidades=count(array_filter($proyecto->planes_presupuestales_cantidades));
            }
            
            if(!$proyecto->cronogramas_fechas_inicios)
            {
                $countCronogramasFechasInicios=0;
            }
            else
            {
                $countCronogramasFechasInicios=count(array_filter($proyecto->cronogramas_fechas_inicios));
            }
            
            if(!$proyecto->resultados_esperados)
            {
                $countResultadosEsperados=0;
            }
            else
            {
                $countResultadosEsperados=count(array_filter($proyecto->resultados_esperados));
            }
            
            
            if($proyecto->objetivo_especifico_1!=='')
            {
                if(isset($proyecto->objetivo_especifico_1_id))
                {
                    $objetivoespecifico1=ObjetivoEspecifico::find()->where('id=:id',[':id'=>$proyecto->objetivo_especifico_1_id])->one();
                    $objetivoespecifico1->descripcion=$proyecto->objetivo_especifico_1;
                    $objetivoespecifico1->update();
                }
                
                
                for($i=0;$i<$countActividades1;$i++)
                {
                    if(isset($proyecto->actividades_ids_1[$i]))
                    {
                        $actividad=Actividad::find()->where('id=:id',[':id'=>$proyecto->actividades_ids_1[$i]])->one();
                        //var_dump($actividad);die;
                        $actividad->descripcion=$proyecto->actividades_1[$i];
                        $actividad->update();
                    }
                    else
                    {
                        $actividad=new Actividad;
                        $actividad->objetivo_especifico_id=$objetivoespecifico1->id;
                        $actividad->descripcion=$proyecto->actividades_1[$i];
                        $actividad->estado=1;
                        $actividad->save();
                    }
                    
                }
            }
            
            if($proyecto->objetivo_especifico_2!=='')
            {
                if(isset($proyecto->objetivo_especifico_2_id))
                {
                    $objetivoespecifico2=ObjetivoEspecifico::find()->where('id=:id',[':id'=>$proyecto->objetivo_especifico_2_id])->one();
                    $objetivoespecifico2->descripcion=$proyecto->objetivo_especifico_2;
                    $objetivoespecifico2->update(); 
                }
                
                
                for($i=0;$i<$countActividades2;$i++)
                {
                    if(isset($proyecto->actividades_ids_2[$i]))
                    {
                        $actividad=Actividad::find()->where('id=:id',[':id'=>$proyecto->actividades_ids_2[$i]])->one();
                        $actividad->descripcion=$proyecto->actividades_2[$i];
                        $actividad->update();
                    }
                    else
                    {
                        $actividad=new Actividad;
                        $actividad->objetivo_especifico_id=$objetivoespecifico2->id;
                        $actividad->descripcion=$proyecto->actividades_2[$i];
                        $actividad->estado=1;
                        $actividad->save();
                    }
                }
            }
            
            if($proyecto->objetivo_especifico_3!=='')
            {
                $objetivoespecifico3=ObjetivoEspecifico::find()->where('id=:id',[':id'=>$proyecto->objetivo_especifico_3_id])->one();
                if(isset($proyecto->objetivo_especifico_3_id) && $objetivoespecifico3)
                {
                    
                    $objetivoespecifico3->descripcion=$proyecto->objetivo_especifico_3;
                    $objetivoespecifico3->update();
                }
                else
                {
                    $objetivoespecifico3=new ObjetivoEspecifico;
                    $objetivoespecifico3->proyecto_id=$proyecto->id;
                    $objetivoespecifico3->descripcion=$proyecto->objetivo_especifico_3;
                    $objetivoespecifico3->save();
                }
                
                for($i=0;$i<$countActividades3;$i++)
                {
                    if(isset($proyecto->actividades_ids_3[$i]))
                    {
                        $actividad=Actividad::find()->where('id=:id',[':id'=>$proyecto->actividades_ids_3[$i]])->one();
                        $actividad->descripcion=$proyecto->actividades_3[$i];
                        $actividad->update();
                    }
                    else
                    {
                        
                        $actividad=new Actividad;
                        $actividad->objetivo_especifico_id=$objetivoespecifico3->id;
                        $actividad->descripcion=$proyecto->actividades_3[$i];
                        $actividad->estado=1;
                        $actividad->save();
                    }
                    
                }
            }
            
            /*Plan presupuestal*/
            for($i=0;$i<$countPlanesPresupuestalesCantidades;$i++)
            {
                //var_dump($countPlanesPresupuestalesPreciosUnitarios);die;
                if(isset($proyecto->planes_presupuestal_ids[$i]))
                {
                    $planpresupuestal=PlanPresupuestal::find()->where('id=:id',[':id'=>$proyecto->planes_presupuestal_ids[$i]])->one();
                    $planpresupuestal->actividad_id=$proyecto->planes_presupuestales_actividades;
                    $planpresupuestal->recurso_descripcion=$proyecto->planes_presupuestales_recursos_descripciones[$i];
                    $planpresupuestal->unidad=$proyecto->planes_presupuestales_unidades[$i];
                    $planpresupuestal->dirigido=$proyecto->planes_presupuestales_dirigidos[$i];
                    $planpresupuestal->como_conseguirlo=$proyecto->planes_presupuestales_comos_conseguirlos[$i];
                    /*if(isset($proyecto->planes_presupuestales_precios_unitarios[$i]))
                    {
                        $planpresupuestal->precio_unitario=$proyecto->planes_presupuestales_precios_unitarios[$i];
                    }
                    else
                    {
                        $planpresupuestal->precio_unitario="";
                    }*/
                    $planpresupuestal->precio_unitario=$proyecto->planes_presupuestales_precios_unitarios[$i];
                    $planpresupuestal->cantidad=$proyecto->planes_presupuestales_cantidades[$i];
                    $planpresupuestal->subtotal=$proyecto->planes_presupuestales_subtotales[$i];
                    $planpresupuestal->update();
                }
                else
                {
                    /*$precio=1;
                    if($proyecto->planes_presupuestales_precios_unitarios[$i]!="")
                    {
                        $precio=$proyecto->planes_presupuestales_precios_unitarios[$i];
                    }
                    */
                    $planpresupuestal=new PlanPresupuestal;
                    $planpresupuestal->actividad_id=$proyecto->planes_presupuestales_actividades;
                    $planpresupuestal->recurso_descripcion=$proyecto->planes_presupuestales_recursos_descripciones[$i];
                    $planpresupuestal->unidad=$proyecto->planes_presupuestales_unidades[$i];
                    $planpresupuestal->dirigido=$proyecto->planes_presupuestales_dirigidos[$i];
                    $planpresupuestal->como_conseguirlo=$proyecto->planes_presupuestales_comos_conseguirlos[$i];
                    $planpresupuestal->precio_unitario=$proyecto->planes_presupuestales_precios_unitarios[$i];
                    $planpresupuestal->cantidad=$proyecto->planes_presupuestales_cantidades[$i];
                    $planpresupuestal->subtotal=$proyecto->planes_presupuestales_subtotales[$i];
                    $planpresupuestal->estado=1;
                    $planpresupuestal->save();
                }
            }
            
            /*Cronograma*/
            for($i=0;$i<$countCronogramasFechasInicios;$i++)
            {
                if(isset($proyecto->cronogramas_ids[$i]))
                {
                    $cronograma=Cronograma::find()->where('id=:id',[':id'=>$proyecto->cronogramas_ids[$i]])->one();
                    $cronograma->actividad_id=$proyecto->cronogramas_actividades[$i];
                    $cronograma->responsable_id=$proyecto->cronogramas_responsables[$i];
                    $cronograma->fecha_inicio=$proyecto->cronogramas_fechas_inicios[$i];
                    $cronograma->fecha_fin=$proyecto->cronogramas_fechas_fines[$i];
                    $cronograma->save();
                }
                else
                {
                    $cronograma=new Cronograma;
                    $cronograma->actividad_id=$proyecto->cronogramas_actividades[$i];
                    $cronograma->responsable_id=$proyecto->cronogramas_responsables[$i];
                    $cronograma->fecha_inicio=$proyecto->cronogramas_fechas_inicios[$i];
                    $cronograma->fecha_fin=$proyecto->cronogramas_fechas_fines[$i];
                    $cronograma->estado=1;
                    $cronograma->save();
                }
            }
            
            /*Resultado*/
            for($i=0;$i<$countResultadosEsperados;$i++)
            {
                
                if(isset($proyecto->resultados_ids[$i]))
                {
                    $actividad=Actividad::find()->where('id=:id',[':id'=>$proyecto->resultados_ids[$i]])->one();
                    $actividad->resultado_esperado=$proyecto->resultados_esperados[$i];
                    $actividad->update();
                }
            }
            
            $video->archivo = UploadedFile::getInstance($video, 'archivo');
            
            if($video->archivo) {
                
                $video->proyecto_id=$proyecto->id;
                $video->etapa=0;
                $video->save();
                $videoup=Video::findOne($video->id);
                $videoup->ruta=$video->id. '.' . $video->archivo->extension;
                $videoup->update();
                if (file_exists(\Yii::$app->basePath."/web/video_carga/".$videoup->ruta)) {
                    //$this->rename_win(\Yii::$app->basePath."/web/video_carga/".$videoup->ruta,\Yii::$app->basePath."/web/video_carga/$videoup->ruta.old");
                    //rename(\Yii::$app->basePath."/web/video_carga/$videoup->ruta", \Yii::$app->basePath."/web/video_carga/$videoup->ruta.old");
                }
                $video->archivo->saveAs('video_carga/' . $videoup->id . '.' . $video->archivo->extension);
                //unlink($videoup->archivo->tempName);
            }
            
            $foro=Foro::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->one();
            if($foro)
            {
                $newComentario->load(Yii::$app->request->post());
                $newComentario->foro_id = $foro->id;
                $newComentario->save();
            }
            
                
            return \Yii::$app->getResponse()->refresh();
        }
        
        if($this->entrega==1)
        {
            $disabled='disabled';
            $videoprimera=VideoCopia::find()->where('proyecto_id=:proyecto_id and etapa in (0,1)',[':proyecto_id'=>$proyecto->id])->one();
            $videosegunda=VideoCopia::find()->where('proyecto_id=:proyecto_id and etapa in (0,2)',[':proyecto_id'=>$proyecto->id])->one();
        }
        else
        {
            $videoprimera=NULL;
            $videosegunda=NULL;
        }
        
        if($equipo->etapa==2)
        {
            $disabled='disabled';
        }
        
        $etapa=Etapa::find()->where('estado=1')->one();
        
        return $this->render('actualizar',
                             ['proyecto'=>$proyecto,
                              'objetivos_especificos'=>$objetivos_especificos,
                              'actividades'=>$actividades,
                              'actividades1'=>$actividades1,
                              'actividades2'=>$actividades2,
                              'actividades3'=>$actividades3,
                              'disabled'=>$disabled,
                              'equipo'=>$equipo,
                              'integrante'=>$integrante,
                              'video'=>$video,
                              'videoprimera'=>$videoprimera,
                              'videosegunda'=>$videosegunda,
                              'entrega'=>$this->entrega,
                              'etapa'=>$etapa]);
    }
    
    public function rename_win($oldfile,$newfile) {
    if (!rename($oldfile,$newfile)) {
        if (copy ($oldfile,$newfile)) {
            unlink($oldfile);
            return TRUE;
        }
        return FALSE;
    }
    return TRUE;
}
}