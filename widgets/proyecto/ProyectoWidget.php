<?php
namespace app\widgets\proyecto;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Usuario;
use app\models\Integrante;
use app\models\Proyecto;
use app\models\Reflexion;
use app\models\Actividad;
use app\models\Equipo;
use app\models\ObjetivoEspecifico;
class ProyectoWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $proyecto = new Proyecto;
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$usuario->estudiante_id])->one();
        $equipo=Equipo::findOne($integrante->equipo_id);
        if ($proyecto->load(\Yii::$app->request->post()) && $proyecto->save()) {
            
            $reflexion = 'insert into reflexion (reflexion,proyecto_id,user_id)
                    select "" , '.$proyecto->id.' , usuario.id from integrante
                    inner join usuario on usuario.estudiante_id=integrante.estudiante_id
                    where  integrante.equipo_id='.$integrante->equipo_id.' and integrante.estudiante_id!='.$integrante->estudiante_id.' ';
            
            \Yii::$app->db->createCommand($reflexion)->execute();
            
            $reflexion= new Reflexion;
            $reflexion->reflexion=$proyecto->reflexion;
            $reflexion->proyecto_id=$proyecto->id;
            $reflexion->user_id=$proyecto->user_id;
            $reflexion->save();
             
                    
            $countActividades1=count(array_filter($proyecto->actividades_1));
            $countActividades2=count(array_filter($proyecto->actividades_2));
            $countActividades3=count(array_filter($proyecto->actividades_3));
            
            if($proyecto->objetivo_especifico_1!=='')
            {
                $objetivoespecifico1=new ObjetivoEspecifico;
                $objetivoespecifico1->proyecto_id=$proyecto->id;
                $objetivoespecifico1->descripcion=$proyecto->objetivo_especifico_1;
                $objetivoespecifico1->save();
                
                for($i=0;$i<$countActividades1;$i++)
                {
                    $actividad=new Actividad;
                    $actividad->objetivo_especifico_id=$objetivoespecifico1->id;
                    $actividad->descripcion=$proyecto->actividades_1[$i];
                    $actividad->estado=1;
                    $actividad->save();
                }
            }
            
            if($proyecto->objetivo_especifico_2!=='')
            {
                $objetivoespecifico2=new ObjetivoEspecifico;
                $objetivoespecifico2->proyecto_id=$proyecto->id;
                $objetivoespecifico2->descripcion=$proyecto->objetivo_especifico_2;
                $objetivoespecifico2->save();
                
                for($i=0;$i<$countActividades2;$i++)
                {
                    $actividad=new Actividad;
                    $actividad->objetivo_especifico_id=$objetivoespecifico2->id;
                    $actividad->descripcion=$proyecto->actividades_2[$i];
                    $actividad->estado=1;
                    $actividad->save();
                }
            }
            
            if($proyecto->objetivo_especifico_3!=='')
            {
                $objetivoespecifico3=new ObjetivoEspecifico;
                $objetivoespecifico3->proyecto_id=$proyecto->id;
                $objetivoespecifico3->descripcion=$proyecto->objetivo_especifico_3;
                $objetivoespecifico3->save();
                
                for($i=0;$i<$countActividades3;$i++)
                {
                    $actividad=new Actividad;
                    $actividad->objetivo_especifico_id=$objetivoespecifico3->id;
                    $actividad->descripcion=$proyecto->actividades_3[$i];
                    $actividad->estado=1;
                    $actividad->save();
                }
            }
            
            
            
            return \Yii::$app->getResponse()->refresh();
        }
        
        return $this->render('proyecto',['proyecto'=>$proyecto,'equipo'=>$equipo]);
    }
}