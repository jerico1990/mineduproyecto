<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "reflexion".
 *
 * @property integer $id
 * @property integer $proyecto_id
 * @property integer $user_id
 * @property string $reflexion
 */
class Reflexion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'reflexion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['proyecto_id', 'user_id'], 'integer'],
            [['reflexion'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'proyecto_id' => 'Proyecto ID',
            'user_id' => 'User ID',
            'reflexion' => 'Reflexion',
        ];
    }
    
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id' => 'user_id']);
    }
}
