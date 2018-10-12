<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\LandPlot;

/**
 * LandPlotSearch represents the model behind the search form about `common\models\LandPlot`.
 */
class LandPlotSearch extends LandPlot
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'area_unit'], 'integer'],
            [['cad_num', 'purpose', 'obkect_of_sale', 'address', 'term_of_lease'], 'safe'],
            [['area', 'valuation'], 'number'],
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
        $query = LandPlot::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'area' => $this->area,
            'area_unit' => $this->area_unit,
            'valuation' => $this->valuation,
        ]);

        $query->andFilterWhere(['like', 'cad_num', $this->cad_num])
            ->andFilterWhere(['like', 'purpose', $this->purpose])
            ->andFilterWhere(['like', 'obkect_of_sale', $this->obkect_of_sale])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'term_of_lease', $this->term_of_lease]);

        return $dataProvider;
    }
}
