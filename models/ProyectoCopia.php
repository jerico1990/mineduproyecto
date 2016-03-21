<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "proyecto_copia".
 *
 * @property integer $id
 * @property string $titulo
 * @property string $resumen
 * @property string $objetivo_general
 * @property string $beneficiario
 * @property integer $user_id
 * @property integer $asunto_id
 * @property integer $equipo_id
 *
 * @property ObjetivoEspecificoCopia[] $objetivoEspecificoCopias
 * @property Usuario $user
 */
class ProyectoCopia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'proyecto_copia';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'asunto_id', 'equipo_id'], 'integer'],
            [['titulo'], 'string', 'max' => 20],
            [['resumen', 'beneficiario'], 'string', 'max' => 2500],
            [['objetivo_general'], 'string', 'max' => 300]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'titulo' => 'Titulo',
            'resumen' => 'Resumen',
            'objetivo_general' => 'Objetivo General',
            'beneficiario' => 'Beneficiario',
            'user_id' => 'User ID',
            'asunto_id' => 'Asunto ID',
            'equipo_id' => 'Equipo ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getObjetivoEspecificoCopias()
    {
        return $this->hasMany(ObjetivoEspecificoCopia::className(), ['proyecto_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(Usuario::className(), ['id' => 'user_id']);
    }
}
