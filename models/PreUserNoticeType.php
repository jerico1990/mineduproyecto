<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pre_user_notice_type".
 *
 * @property integer $id
 * @property string $type
 * @property string $type_title
 * @property string $type_content
 */
class PreUserNoticeType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pre_user_notice_type';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'type_title', 'type_content'], 'required'],
            [['type'], 'string', 'max' => 50],
            [['type_title', 'type_content'], 'string', 'max' => 255]
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
            'type_title' => 'Type Title',
            'type_content' => 'Type Content',
        ];
    }
    
    public static function getTypeInfo($key, $cacheKey = 'noticeType')
    {
        $cache = Yii::$app->cache;
        $typesDate = $cache->get($cacheKey);
        if ($typesDate === false) {
            $typesDate = static::getTypes();
            $cache->set($typesDate, $cacheKey);
        }
        return $typesDate[$key];
    }

    private static function getTypes()
    {
        $typeList = Yii::$app->db->createCommand('SELECT * FROM {{%pre_user_notice_type}}')->queryAll();

        $result = [];
        foreach ($typeList as $element) {
            $key = $element['type_title'];
            $value = $element['type_content'];
            $result[$element['type']] = [
                'type_title' => $key,
                'type_content' =>$value
            ];
        }
        return $result;
    }
}
