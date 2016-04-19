<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Usuario;

class SiteController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
                
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex()
    {
        $this->layout='index';
        if (!\Yii::$app->user->isGuest) {
            return $this->redirect(['panel/index']);
        }
        return $this->render('index');
    }

    public function actionLogin()
    {
        $this->layout='registrar';
        /*if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }*/
        
        
        if (!\Yii::$app->user->isGuest) {
            Yii::$app->user->logout();
            //return $this->redirect(['panel/index']);
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->redirect(['panel/ideas-accion']);
        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    public function actionAbout()
    {
        return $this->render('about');
    }
    
    public function actionPrueba()
    {
        return $this->render('prueba');
    }
    public function actionQueEs()
    {
        $this->layout='minedu';
        return $this->render('que-es');
    }
    public function actionBases()
    {
        $this->layout='minedu';
        return $this->render('bases');
    }
    public function actionEtapas()
    {
        $this->layout='minedu';
        return $this->render('etapas');
    }
    
    public function actionAsuntosPublicos()
    {
        $this->layout='minedu';
        return $this->render('asuntos-publicos');
    }
    public function actionResultados()
    {
        $this->layout='minedu';
        return $this->render('resultados');
    }
    
    public function actionRecuperar()
    {
        $this->layout='registrar';
        $usuario=new LoginForm;
        if($usuario->load(Yii::$app->request->post()))
        {
            $urlRecuperar= \Yii::$app->request->BaseUrl.Yii::$app->getUrlManager()->createUrl('site/resetear');
            $usuario=Usuario::find()->where('username=:username',[':username'=>$usuario->username])->one();
            $usuario->verification_code=$this->randKey("abcdefghijklmnopqrstuvwxyz0123456789", 24);
            $usuario->update();
            
            $subject="Sistema de recuperación de contraseña";
            $content="Estimado/a docente:<br><br>
                     ¡Bienvenido/a al sistema de evaluación por competencias socioemocionales CSE!
                     Para finalizar el proceso de inscripción, por favor ingrese al siguiente <a href='localhost/mineduproyecto/web/site/resetear?url=".$usuario->verification_code."'>enlace</a>.
                   
                     Saludos cordiales,<br><br>
                     <br>
                     ";
            Yii::$app->mail->compose('@app/mail/layouts/html',['content'=>$content])
           ->setFrom('cesar.gago.egocheaga@gmail.com')
           ->setTo($usuario->username)
           ->setSubject($subject)
           ->send();
           return $this->redirect(['site/login']);
        }
        return $this->render('recuperar',['usuario'=>$usuario]);
    }
    
    public function actionResetear($url)
    {
        $this->layout='registrar';
        $loginForm=new LoginForm;
        $usuario=Usuario::find()->where('verification_code=:verification_code',[':verification_code'=>$url])->one();
        if($usuario){
            if($loginForm->load(Yii::$app->request->post())){
                $usuario->verification_code="";
                $usuario->password=$loginForm->password;
                $usuario->update();
                return $this->refresh();
            }
            return $this->render('resetear',['loginForm'=>$loginForm]);
        }
        else{
            return $this->redirect(['site/login']);
        }
    }
    
    
    private function randKey($str='', $long=0)
    {
        $key = null;
        $str = str_split($str);
        $start = 0;
        $limit = count($str)-1;
        for($x=0; $x<$long; $x++)
        {
            $key .= $str[rand($start, $limit)];
        }
        return $key;
    }
}
