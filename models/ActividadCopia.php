<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "actividad_copia".
 *
 * @property integer $id
 * @property integer $objetivo_especifico_id
 * @property string $descripcion
 * @property string $resultado_esperado
 * @property integer $estado
 *
 * @property ObjetivoEspecificoCopia $objetivoEspecifico
 * @property CronogramaCopia[] $cronogramaCopias
 * @property PlanPresupuestalCopia[] $planPresupuestalCopias
 */
class ActividadCopia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'actividad_copia';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['objetivo_especifico_id', 'estado'], 'integer'],
            [['descripcion'], 'string', 'max' => 150],
            [['resultado_esperado'], 'string', 'max' => 15]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'objetivo_especifico_id' => 'Objetivo Especifico ID',
            'descripcion' => 'Descripcion',
            'resultado_esperado' => 'Resultado Esperado',
            'estado' => 'Estado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getObjetivoEspecifico()
    {
        return $this->hasOne(ObjetivoEspecificoCopia::className(), ['id' => 'objetivo_especifico_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCronogramaCopias()
    {
        return $this->hasMany(CronogramaCopia::className(), ['actividad_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanPresupuestalCopias()
    {
        return $this->hasMany(PlanPresupuestalCopia::className(), ['actividad_id' => 'id']);
    }
}
