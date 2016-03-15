<?php

namespace app\models;

use Yii;
use yii\db\Query;
use yii\helpers\Url;
/**
 * This is the model class for table "pre_forum_thread".
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $user_id
 * @property integer $board_id
 * @property integer $post_count
 */
class PreForumThread extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pre_forum_thread';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title',], 'required'],
            [['content'], 'string'],
            [['created_at', 'updated_at', 'user_id', 'board_id', 'post_count'], 'integer'],
            [['title'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'content' => 'Content',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'user_id' => 'User ID',
            'board_id' => 'Board ID',
            'post_count' => 'Post Count',
        ];
    }
    
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->user_id = Yii::$app->user->id;
                $this->created_at = time();
                $this->updated_at = time();
            }
            return true;
        } else {
            return false;
        }
    }
    
    public function getSeoInfo()
    {
        $data = strip_tags($this->content);
        $title = (empty($this->title)) ? mb_substr($data, 0, 80) : $this->title;
        $description = mb_substr($data, 0, 200, 'utf-8');
        $keywords = $title;
        return [
            'title' => $title,
            'keywords' => $keywords,
            'description' => $description
        ];
    }
    
    public function getForum()
    {
        return Yii::$app->db
            ->createCommand("SELECT * FROM {{%pre_forum}} as f JOIN {{%pre_forum_board}} as b ON f.id=b.forum_id WHERE b.id={$this->board_id}")
            ->queryOne();
    }
    
    public function getUser()
    {
        return Yii::$app->db
            ->createCommand("SELECT id, username, avatar FROM {{%usuario}} WHERE id={$this->user_id}")
            ->queryOne();
    }
    
    public function getPosts()
    {
        $query = new Query;
        $query->select('p.id,  p.content, p.created_at, p.user_id, u.username, u.avatar')
            ->from('{{%pre_forum_post}} as p')
            ->join('LEFT JOIN','{{%usuario}} as u', 'u.id=p.user_id')
            ->where('p.thread_id=:id', [':id' => $this->id]);
        $result = Yii::$app->tools->Pagination($query);
        return ['posts' => $result['result'], 'pages' => $result['pages']];
    }
    public function getBoard()
    {
        return Yii::$app->db
            ->createCommand("SELECT id, name, user_id,forum_id FROM {{%pre_forum_board}} WHERE id={$this->board_id}")
            ->queryOne();
    }
    
    public function isOneBoard()
    {
        $forum_id = $this->forum['forum_id'];
        $count = Yii::$app->db
            ->createCommand("SELECT count(*) FROM {{%pre_forum_board}} WHERE forum_id={$forum_id}")
            ->queryScalar();
        return ($count == 1) ? true : false;
    }
    
    public function getUrl()
    {
    	 return Url::toRoute(['/pre-forum-thread/view', 'id' => $this->id]);
    }
}
