<?php

namespace app\models;

use Yii;
use yii\helpers\Url;
use yii\db\Query;
/**
 * This is the model class for table "pre_forum_board".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $description
 * @property integer $columns
 * @property integer $updated_at
 * @property integer $updated_by
 * @property integer $forum_id
 * @property integer $user_id
 */
class PreForumBoard extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    const AS_CATEGORY = 0;
    const AS_BOARD = 1;
    public static function tableName()
    {
        return 'pre_forum_board';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent_id', 'columns', 'updated_at', 'updated_by', 'forum_id', 'user_id'], 'integer'],
            [['name',], 'required'],
            [['name'], 'string', 'max' => 32],
            [['description'], 'string', 'max' => 128]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'name' => 'Name',
            'description' => 'Description',
            'columns' => 'Columns',
            'updated_at' => 'Updated At',
            'updated_by' => 'Updated By',
            'forum_id' => 'Forum ID',
            'user_id' => 'User ID',
        ];
    }
    
    public function getForum()
    {
        return Yii::$app->db
            ->createCommand("SELECT forum_url,forum_name,user_id FROM {{%pre_forum}} WHERE id={$this->forum_id}")
            ->queryOne();
    }
    public function isOneBoard()
    {
        $boardCount = Yii::$app->db
            ->createCommand("SELECT count(*) as num FROM {{%pre_forum_board}} `b` JOIN {{%pre_forum}} `f` ON f.id=b.forum_id WHERE f.id={$this->forum_id}")
            ->queryScalar();
        return ($boardCount == 1) ? true : false;
    }
    
    public function getThreads()
    {
        
        $query = new Query;
        $query->select('t.id, t.title, t.content, t.updated_at, t.user_id, t.post_count, u.username, u.avatar')
            ->from('{{%pre_forum_thread}} as t')
            ->join('LEFT JOIN','{{%usuario}} as u', 'u.id=t.user_id')
            ->where('t.board_id=:id', [':id' => $this->id])
            ->orderBy('t.updated_at DESC');
            
        $result = \Yii::$app->tools->Pagination($query);
        //var_dump($result['result']);die;
        return ['threads' => $result['result'], 'pages' => $result['pages']];
    }
    
    public static function getThreadCount($id = null)
    {
        if ($id != null) {
            return Yii::$app->db
                ->createCommand("SELECT count(*) FROM {{%pre_forum_thread}}  WHERE board_id={$id}")
                ->queryScalar();
        }
        return ;
    }
    
    public static function getLastThread($id)
    {
        $query = new Query;
        $thread = $query->select('u.username, t.updated_at')
            ->from('{{%pre_forum_board}} as t')
            ->join('LEFT JOIN','{{%usuario}} as u', 'u.id=t.updated_by')
            ->where('t.id=:id', [':id'=>$id])
            ->one();
        return [
            'username' => $thread['username'],
            'created_at'=>$thread['updated_at'],
        ];
    }
    
    
    
    public function getUrl()
    {        
        return Url::toRoute(['/pre-forum-board/view', 'id' => $this->id]);
    }
    
    public function getSubBoards()
    {
        return Yii::$app->db
            ->createCommand("SELECT * FROM {{%pre_forum_board}}  WHERE parent_id={$this->id}")
            ->queryAll();
    }
}
