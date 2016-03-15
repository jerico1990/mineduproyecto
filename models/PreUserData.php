<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pre_user_data".
 *
 * @property integer $user_id
 * @property integer $post_count
 * @property integer $feed_count
 * @property integer $following_count
 * @property integer $follower_count
 * @property integer $unread_notice_count
 * @property integer $unread_message_count
 */
class PreUserData extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pre_user_data';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['post_count', 'following_count', 'follower_count', 'unread_notice_count', 'unread_message_count'], 'required'],
            [['post_count', 'feed_count', 'following_count', 'follower_count', 'unread_notice_count', 'unread_message_count'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => 'User ID',
            'post_count' => 'Post Count',
            'feed_count' => 'Feed Count',
            'following_count' => 'Following Count',
            'follower_count' => 'Follower Count',
            'unread_notice_count' => 'Unread Notice Count',
            'unread_message_count' => 'Unread Message Count',
        ];
    }
    
    public function getKey($all, $key = null, $userId = null)
    {
        $userId = ($userId === null) ? Yii::$app->user->id : $userId ;
        if ($all == true) {
            return Yii::$app->db->createCommand('SELECT * FROM {{%pre_user_data}} WHERE user_id='.$userId)->queryOne();
        }
        return Yii::$app->db->createCommand("SELECT $key FROM {{%pre_user_data}} WHERE user_id=$userId")->queryScalar();
    }
    
    
    public function updateKey($key, $userId, $nums = 1, $add = true)
    {
        switch ($key) {
            case 'post_count':
            case 'feed_count':
            case 'following_count':
            case 'follower_count':
            case 'unread_notice_count':
            case 'unread_message_count':
                break;
            default:
                return false;
                break;
        }
        if ($add) {
            return Yii::$app->db->createCommand("UPDATE {{%pre_user_data}} SET {$key}={$key}+{$nums} WHERE user_id=".$userId)->execute();
        } else {
            return Yii::$app->db->createCommand("UPDATE {{%pre_user_data}} SET {$key}={$nums} WHERE user_id=".$userId)->execute();
        }
    }
}
