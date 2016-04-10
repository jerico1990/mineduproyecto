<?php

namespace app\models;

use Yii;
use yii\web\UploadedFile;
/**
 * This is the model class for table "equipo".
 *
 * @property integer $id
 * @property integer $asunto_id
 * @property string $descripcion_equipo
 * @property string $descripcion
 * @property integer $estado
 * @property string $fecha_registro
 *
 * @property Asunto $asunto
 * @property Integrante[] $integrantes
 */
class Equipo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $participante;
    public $id_participante;
    public $invitaciones;
    public $tipo;
    public $foto_img;
    public static function tableName()
    {
        return 'equipo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['asunto_id','descripcion_equipo','descripcion'], 'required'],
            [['asunto_id', 'estado','id','tipo'], 'integer'],
            [['fecha_registro','invitaciones'], 'safe'],
            [['descripcion_equipo'], 'string', 'max' => 250],
            [['descripcion'], 'string', 'max' => 500],
            [['foto_img'], 'file'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'asunto_id' => 'Asunto ID',
            'descripcion_equipo' => 'Descripcion Equipo',
            'descripcion' => 'Descripcion',
            'estado' => 'Estado',
            'fecha_registro' => 'Fecha Registro',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAsunto()
    {
        return $this->hasOne(Asunto::className(), ['id' => 'asunto_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIntegrantes()
    {
        return $this->hasMany(Integrante::className(), ['equipo_id' => 'id']);
    }
    
    public function validarmiebros($invitados)
    {
        foreach($invitados as $invitado => $key)
        {
            
            $integrante=Integrante::find()
                        ->select('estudiante.nombres_apellidos')
                        ->innerJoin('estudiante','estudiante.id=integrante.estudiante_id')
                        ->where('estudiante_id=:estudiante_id',[':estudiante_id'=>(integer) $key])->one();
                        
            if($integrante)
            {
                
            }
        }
        
    }
}
