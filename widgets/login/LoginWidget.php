<?php
namespace app\widgets\login;


use Yii;
use yii\base\Widget;
use yii\helpers\Html;
use app\models\Usuario;
use app\models\LoginForm;

class LoginWidget extends Widget
{
    public $tipo;
    public function init()
    {
        parent::init();
    }

    public function run()
    {
        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            //var_dump($model);die;
            return \Yii::$app->getResponse()->refresh();
        }
        
        
        return $this->render('login',['tipo'=>$this->tipo,'model'=>$model]);
    }
}