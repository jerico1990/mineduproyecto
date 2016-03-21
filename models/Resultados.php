<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "resultados".
 *
 * @property integer $id
 * @property integer $asunto_id
 * @property integer $region_id
 * @property integer $cantidad
 */
class Resultados extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'resultados';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['asunto_id', 'region_id', 'cantidad'], 'integer']
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
            'region_id' => 'Region ID',
            'cantidad' => 'Cantidad',
        ];
    }
    
    public function getAsunto()
    {
        return $this->hasOne(Asunto::className(), ['id' => 'asunto_id']);
    }
}
