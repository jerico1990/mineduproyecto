<?php

namespace app\models;

use Yii;
use yii\web\IdentityInterface;
/**
 * This is the model class for table "usuario".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property integer $status
 * @property integer $auth
 * @property string $verification_code
 * @property integer $estudiante_id
 *
 * @property AuthAssignment[] $authAssignments
 * @property AuthItem[] $itemNames
 * @property Estudiante $estudiante
 */
class Usuario extends \yii\db\ActiveRecord implements IdentityInterface
{
    /**
     * @inheritdoc
     */
    public $auth_key;
    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['password', 'status'], 'required'],
            [['status', 'auth', 'estudiante_id'], 'integer'],
            [['username', 'password'], 'string', 'max' => 100],
            [['verification_code'], 'string', 'max' => 250],
            [['username'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'password' => 'Password',
            'status' => 'Status',
            'auth' => 'Auth',
            'verification_code' => 'Verification Code',
            'estudiante_id' => 'Estudiante ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuthAssignments()
    {
        return $this->hasMany(AuthAssignment::className(), ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemNames()
    {
        return $this->hasMany(AuthItem::className(), ['name' => 'item_name'])->viaTable('auth_assignment', ['user_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEstudiante()
    {
        return $this->hasOne(Estudiante::className(), ['id' => 'estudiante_id']);
    }
    
    /*asda*/
    public static function findIdentity($id)
    {      
        return static::findOne($id);
    }
    
    public function getId()
    {
        return $this->getPrimaryKey();
    }
        
    public static function findByUsername($username)
    {
       return static::find()->where('username=:username and status=1',[':username' => $username])->one();
    }
    
    public function validatePassword($password,$username)
    {
        return static::find()->where('password=:password and username=:username and status=1',[':password' => $password,':username' => $username])->one();
    }
    public function getUsername()
    {
        
        return $this->username;
    }
    
    
    
    public static function findIdentityByAccessToken($token, $type = null)
    {
        
        if ($user['accessToken'] === $token) {
           return new static($user);
        }       
        return null;
    }
    
    public function getAuthKey()
    {
        return $this->auth_key;
    }
    
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }
}
