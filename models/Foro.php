<?php

namespace app\models;
use yii\db\Query;
use Yii;

/**
 * This is the model class for table "foro".
 *
 * @property integer $id
 * @property string $titulo
 * @property string $descripcion
 * @property integer $creado_at
 * @property integer $actualizado_at
 * @property integer $user_id
 * @property integer $post_count
 */
class Foro extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'foro';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['creado_at', 'actualizado_at', 'user_id', 'post_count'], 'integer'],
            [['titulo'], 'string', 'max' => 250],
            [['descripcion'], 'string', 'max' => 1500]
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
            'descripcion' => 'Descripcion',
            'creado_at' => 'Creado At',
            'actualizado_at' => 'Actualizado At',
            'user_id' => 'User ID',
            'post_count' => 'Post Count',
        ];
    }
    
    
    
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id' => 'user_id']);
    }
    
    
    public function getPosts()
    {
        $query = new Query;
        $query->select('p.id,  p.contenido, p.creado_at, p.user_id, u.username, u.avatar')
            ->from('{{%foro_comentario}} as p')
            ->join('LEFT JOIN','{{%usuario}} as u', 'u.id=p.user_id')
            ->where('p.foro_id=:id', [':id' => $this->id]);
        $result = Yii::$app->tools->Pagination($query);
        return ['posts' => $result['result'], 'pages' => $result['pages']];
    }
}
