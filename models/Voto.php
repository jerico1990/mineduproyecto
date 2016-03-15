<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "voto".
 *
 * @property integer $asunto_id
 * @property string $region_id
 * @property string $participante_id
 * @property string $fecha_registro
 * @property integer $estado
 *
 * @property Asunto $asunto
 */
class Voto extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $dni;
    public $contador;
    public $asuntod;
    public static function tableName()
    {
        return 'voto';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['asunto_id', 'region_id', 'participante_id'], 'required'],
            [['asunto_id', 'estado'], 'integer'],
            [['fecha_registro'], 'safe'],
            [['region_id'], 'string', 'max' => 2],
            [['participante_id','dni'], 'string', 'max' => 8]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'asunto_id' => 'Asunto ID',
            'region_id' => 'Region ID',
            'participante_id' => 'Participante ID',
            'fecha_registro' => 'Fecha Registro',
            'estado' => 'Estado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAsunto()
    {
        return $this->hasOne(Asunto::className(), ['id' => 'asunto_id']);
    }
}
