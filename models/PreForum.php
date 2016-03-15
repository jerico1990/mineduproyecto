<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;
/**
 * This is the model class for table "pre_forum".
 *
 * @property integer $id
 * @property string $forum_name
 * @property string $forum_desc
 * @property string $forum_url
 * @property integer $user_id
 * @property integer $created_at
 * @property integer $status
 * @property string $forum_icon
 */
class PreForum extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    const STATUS_PENDING = 0;
    const STATUS_APPROVED = 1;
    public static function tableName()
    {
        return 'pre_forum';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['forum_name', 'forum_desc', 'forum_url'], 'required'],
            [['forum_desc'], 'string'],
            [['user_id', 'created_at', 'status'], 'integer'],
            [['forum_name', 'forum_url'], 'string', 'max' => 32],
            [['forum_icon'], 'string', 'max' => 26]
        ];
    }
    
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                
                $this->user_id = \Yii::$app->user->id;
                $this->created_at = time();
                $this->forum_icon = 'default/' . rand(1, 11) . '.png';
                //$this->status = PreForum::STATUS_PENDING;
                $this->status = 1;
            }
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'forum_name' => 'Forum Name',
            'forum_desc' => 'Forum Desc',
            'forum_url' => 'Forum Url',
            'user_id' => 'User ID',
            'created_at' => 'Created At',
            'status' => 'Status',
            'forum_icon' => 'Forum Icon',
        ];
    }
    public function getToArray()
    {
        return ArrayHelper::toArray($this);
    }
    public function getBoardCount()
    {
        return Yii::$app->db
            ->createCommand("SELECT count(*) FROM {{%pre_forum_board}} WHERE forum_id={$this->id}")
            ->queryScalar();
    }
    
    public function getBoards()
    {
        
        return PreForumBoard::find()->where(
            'forum_id = :forum_id && (parent_id = :BOARD || parent_id = :CATEGORY)', 
            [':forum_id' => $this->id, ':BOARD' => PreForumBoard::AS_BOARD, ':CATEGORY' => PreForumBoard::AS_CATEGORY]
        )->all();
    }
}
