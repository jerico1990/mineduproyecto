<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pre_user_notice".
 *
 * @property integer $id
 * @property string $type
 * @property string $title
 * @property string $content
 * @property integer $from_user_id
 * @property integer $to_user_id
 * @property string $source_url
 * @property integer $created_at
 * @property integer $is_read
 */
class PreUserNotice extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    const READ_STATUS_YES = 1;
    const READ_STATUS_NO = 0;
    public static function tableName()
    {
        return 'pre_user_notice';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'content', 'from_user_id', 'to_user_id', 'created_at', 'is_read'], 'required'],
            [['content'], 'string'],
            [['from_user_id', 'to_user_id', 'created_at', 'is_read'], 'integer'],
            [['type'], 'string', 'max' => 50],
            [['title', 'source_url'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'title' => 'Title',
            'content' => 'Content',
            'from_user_id' => 'From User ID',
            'to_user_id' => 'To User ID',
            'source_url' => 'Source Url',
            'created_at' => 'Created At',
            'is_read' => 'Is Read',
        ];
    }
    
    public static function sendNotice($type, $title, $content, $sourceUrl, $toUserId, $fromUserId = null)
    {
        if (($typeInfo = PreUserNoticeType::getTypeInfo($type)) === null) {
            return false;
        }
        $fromUserId = ($fromUserId === null) ? Yii::$app->user->id : $fromUserId ;
        return $query = Yii::$app->db->createCommand()->insert('{{%pre_user_notice}}', [
            'type' => $type,
            'title' => serialize($title),
            'content' => $content,
            'source_url' => serialize($sourceUrl),
            'to_user_id' => $toUserId,
            'from_user_id' => $fromUserId,
            'created_at' => time(),
            'is_read' => self::READ_STATUS_NO
        ])->execute();
    }
    
    public static function getAllNotice($id = null)
    {
        $id = ($id === null) ? Yii::$app->user->id : $id ;
        $query = (new Query)->select('u.username, u.avatar, t.type_title, n.title, n.content, n.source_url, n.created_at, n.is_read')
            ->from('{{%pre_user_notice}} as n')
            ->where('to_user_id=:id', [':id' => $id])
            ->join('LEFT JOIN','{{%usuario}} as u', 'u.id=n.from_user_id')
            ->join('LEFT JOIN','{{%pre_user_notice_type}} as t', 't.type=n.type')
            ->orderBy('n.id DESC');
        return Yii::$app->tools->Pagination($query);
    }
}
