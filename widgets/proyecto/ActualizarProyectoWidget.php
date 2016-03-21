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
use app\models\ObjetivoEspecifico;
class ActualizarProyectoWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
        $disabled='';
        if($integrante->rol==2)
        {
            $disabled='disabled';
        }
        
        $proyecto=Proyecto::find()->where('equipo_id=:equipo_id',[':equipo_id'=>$integrante->equipo_id])->one();
        $objetivos_especificos=ObjetivoEspecifico::find()->where('proyecto_id=:proyecto_id',[':proyecto_id'=>$proyecto->id])->all();
        $actividades=Actividad::find()
                    ->select('objetivo_especifico.id objetivo_especifico_id,actividad.id actividad_id,actividad.descripcion')
                    ->innerJoin('objetivo_especifico','objetivo_especifico.id=actividad.objetivo_especifico_id')
                    ->where('proyecto_id=:proyecto_id and actividad.estado=1',[':proyecto_id'=>$proyecto->id])->all();
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
        
        $reflexion=Reflexion::find()->where('user_id=:user_id',[':user_id'=>$usuario->id])->one();
        $proyecto->reflexion=$reflexion->reflexion;
        
        
        if ($proyecto->load(\Yii::$app->request->post())) {
            $reflexion->reflexion=$proyecto->reflexion;
            $reflexion->update();
            $proyecto->update();
            $countActividades1=count($proyecto->actividades_1);
            $countActividades2=count($proyecto->actividades_2);
            $countActividades3=count($proyecto->actividades_3);
            
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
            return \Yii::$app->getResponse()->refresh();
        }
        
        return $this->render('actualizar',
                             ['proyecto'=>$proyecto,
                              'objetivos_especificos'=>$objetivos_especificos,
                              'actividades'=>$actividades,
                              'disabled'=>$disabled]);
    }
}