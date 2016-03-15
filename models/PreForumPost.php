<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pre_forum_post".
 *
 * @property integer $id
 * @property string $content
 * @property integer $thread_id
 * @property integer $user_id
 * @property integer $created_at
 */
class PreForumPost extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pre_forum_post';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content'], 'required'],
            [['content'], 'string'],
            [['thread_id', 'user_id', 'created_at'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'content' => 'Content',
            'thread_id' => 'Thread ID',
            'user_id' => 'User ID',
            'created_at' => 'Created At',
        ];
    }
    
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
            	$this->user_id = Yii::$app->user->id;
            	$this->created_at = time();
            }
            return true;
        } else {
            return false;
        }
    }
    
    
    public function afterSave($insert, $changedAttributes)
    {
        $this->PostCuntPlus();
        
        $connection = Yii::$app->db;

    
        $thread = $connection->createCommand('SELECT id, user_id, title FROM {{%pre_forum_thread}} WHERE id=' . $this->thread_id)->queryOne();

      
        $connection->createCommand('UPDATE {{%pre_forum_thread}} SET updated_at=:time WHERE id=:id')->bindValues([':time' => time(), ':id' => $thread['id']])->execute();

        if(Yii::$app->user->id != $thread['user_id']) {
            PreUserNotice::sendNotice('NEW_COMMENT', ['title' => $thread['title']], $this->content, ['/pre-forum-thread/view', 'id' => $thread['id']], $thread['user_id'], $this->user_id);
          
            Yii::$app->userData->updateKey('unread_notice_count', $thread['user_id']);
        }

        if (strstr($this->content, '@')) {
            preg_match_all('/@(.*?)\s/', $this->content, $match);
            if(isset($match[1]) && count($match[1]) > 0) {
                $notice_user = array_unique($match[1]);
                foreach ($notice_user as $v) {
                    $toUserId = $connection->createCommand('SELECT id FROM {{%usuario}} WHERE username=:name')->bindValue(':name', $v)->queryScalar();
                    if ($toUserId == $thread['user_id'] || $toUserId == Yii::$app->user->id || empty($toUserId)) {
                        continue;
                    }
                    PreUserNotice::sendNotice('MENTION_ME', ['title' => $thread['title']], $this->content, ['/pre-forum-thread/view', 'id' => $thread['id']], $toUserId, $this->user_id);
                }
            }
        }

        return parent::afterSave($insert, $changedAttributes);
    }
    
    public function getUser()
    {
        return Yii::$app->db
            ->createCommand("SELECT * FROM {{%usuario}} WHERE id={$this->user_id}")
            ->queryOne();
    }

    /**
     */
    public function PostCuntPlus()
    {
        return Yii::$app->db->createCommand("UPDATE {{%pre_forum_thread}} SET post_count=post_count+1 WHERE id=".$this->thread_id)->execute();
    }
}
