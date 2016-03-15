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
            [['id', 'user_id'], 'integer'],
            [['titulo', 'resumen', 'justificacion', 'objetivo_general', 'beneficiario_directo_1', 'beneficiario_directo_2', 'beneficiario_directo_3', 'beneficiario_indirecto_1', 'beneficiario_indirecto_2', 'beneficiario_indirecto_3'], 'safe'],
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
        $query = Proyecto::find();

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
            'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'titulo', $this->titulo])
            ->andFilterWhere(['like', 'resumen', $this->resumen])
            ->andFilterWhere(['like', 'justificacion', $this->justificacion])
            ->andFilterWhere(['like', 'objetivo_general', $this->objetivo_general])
            ->andFilterWhere(['like', 'beneficiario_directo_1', $this->beneficiario_directo_1])
            ->andFilterWhere(['like', 'beneficiario_directo_2', $this->beneficiario_directo_2])
            ->andFilterWhere(['like', 'beneficiario_directo_3', $this->beneficiario_directo_3])
            ->andFilterWhere(['like', 'beneficiario_indirecto_1', $this->beneficiario_indirecto_1])
            ->andFilterWhere(['like', 'beneficiario_indirecto_2', $this->beneficiario_indirecto_2])
            ->andFilterWhere(['like', 'beneficiario_indirecto_3', $this->beneficiario_indirecto_3]);

        return $dataProvider;
    }
}
