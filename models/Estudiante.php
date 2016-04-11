<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "estudiante".
 *
 * @property integer $id
 * @property integer $institucion_id
 * @property string $nombres_apellidos
 * @property string $sexo
 * @property string $dni
 * @property string $fecha_nacimiento
 * @property string $email
 * @property string $celular
 * @property integer $grado
 *
 * @property Encuesta[] $encuestas
 * @property Institucion $institucion
 * @property Integrante[] $integrantes
 * @property Invitacion[] $invitacions
 * @property Invitacion[] $invitacions0
 * @property Usuario[] $usuarios
 */
class Estudiante extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'estudiante';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['id'], 'required'],
            [['id', 'institucion_id', 'grado'], 'integer'],
            [['fecha_nac'], 'safe'],
            [['nombres','apellido_paterno','apellido_materno'], 'string', 'max' => 250],
            [['sexo'], 'string', 'max' => 10],
            [['dni'], 'string', 'max' => 8],
            [['email'], 'string', 'max' => 150],
            [['celular'], 'string', 'max' => 9]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'institucion_id' => 'Institucion ID',
            'nombres_apellidos' => 'Nombres Apellidos',
            'sexo' => 'Sexo',
            'dni' => 'Dni',
            'fecha_nac' => 'Fecha Nacimiento',
            'email' => 'Email',
            'celular' => 'Celular',
            'grado' => 'Grado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEncuestas()
    {
        return $this->hasMany(Encuesta::className(), ['alumno_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInstitucion()
    {
        return $this->hasOne(Institucion::className(), ['id' => 'institucion_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIntegrantes()
    {
        return $this->hasMany(Integrante::className(), ['estudiante_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInvitacions()
    {
        return $this->hasMany(Invitacion::className(), ['estudiante_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInvitacions0()
    {
        return $this->hasMany(Invitacion::className(), ['estudiante_invitado_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarios()
    {
        return $this->hasMany(Usuario::className(), ['alumno_id' => 'id']);
    }
}
