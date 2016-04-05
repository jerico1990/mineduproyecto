<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Proyecto;

/**
 * ProyectoSearch represents the model behind the search form about `app\models\Proyecto`.
 */
class ProyectoSearch extends Proyecto
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id','region_id'], 'integer'],
            [['titulo', 'resumen', 'objetivo_general','forum_url'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $usuario=Usuario::findOne(\Yii::$app->user->id);
        $estudiante=Estudiante::findOne($usuario->estudiante_id);
        $integrante=Integrante::find()->where('estudiante_id=:estudiante_id',[':estudiante_id'=>$estudiante->id])->one();
        
        
        $query = Proyecto::find()
                    ->select('proyecto.id,proyecto.titulo,pre_forum.forum_url,proyecto.region_id')
                    ->innerJoin('equipo','equipo.id=proyecto.equipo_id')
                    ->innerJoin('asunto','asunto.id=equipo.asunto_id')
                    ->innerJoin('pre_forum','pre_forum.proyecto_id=proyecto.id')
                    ->where('proyecto.equipo_id not in ('.$integrante->equipo_id.') and equipo.etapa in (1,2)')
                    ->groupBy('proyecto.titulo,pre_forum.forum_url');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            //'proyecto.user_id' => \Yii::$app->user->id,
            //'equipo.etapa'=>1,
            'proyecto.region_id'=>$this->region_id
        ]);

        $query->andFilterWhere(['like', 'proyecto.titulo', $this->titulo])
            ->andFilterWhere(['like', 'resumen', $this->resumen])
            ->andFilterWhere(['like', 'forum_url', $this->forum_url]);
            
            

        return $dataProvider;
    }
    
    public function votacion($params)
    {
        
        $query = Proyecto::find()
                    ->select('proyecto.id,proyecto.titulo,pre_forum.forum_url,proyecto.region_id')
                    //->innerJoin('ubigeo','ubigeo.department_id=proyecto.region_id')
                    ->innerJoin('equipo','equipo.id=proyecto.equipo_id')
                    //->innerJoin('integrante','integrante.')
                    ->innerJoin('asunto','asunto.id=equipo.asunto_id')
                    ->innerJoin('pre_forum','pre_forum.proyecto_id=proyecto.id')
                    ->where('equipo.etapa in (1,2)')
                    ->groupBy('proyecto.titulo,pre_forum.forum_url');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            //'proyecto.user_id' => \Yii::$app->user->id,
            //'equipo.etapa'=>1,
            'proyecto.region_id'=>$this->region_id
        ]);

        $query->andFilterWhere(['like', 'proyecto.titulo', $this->titulo])
            ->andFilterWhere(['like', 'resumen', $this->resumen])
            ->andFilterWhere(['like', 'forum_url', $this->forum_url]);
            
            

        return $dataProvider;
    }
    
    
}
