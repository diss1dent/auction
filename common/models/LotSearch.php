<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Lot;

/**
 * LotSearch represents the model behind the search form about `common\models\Lot`.
 */
class LotSearch extends Lot
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'lot_number'], 'integer'],
            [['date', 'address', 'organizer', 'organizer_representative', 'performer', 'performer_edrpoy', 'performer_address', 'performer_litiator'], 'safe'],
            [['starting_rent', 'bidding_step'], 'number'],
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
        $query = Lot::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'lot_number' => $this->lot_number,
            'date' => $this->date,
            'starting_rent' => $this->starting_rent,
            'bidding_step' => $this->bidding_step,
        ]);

        $query->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'organizer', $this->organizer])
            ->andFilterWhere(['like', 'organizer_representative', $this->organizer_representative])
            ->andFilterWhere(['like', 'performer', $this->performer])
            ->andFilterWhere(['like', 'performer_edrpoy', $this->performer_edrpoy])
            ->andFilterWhere(['like', 'performer_address', $this->performer_address])
            ->andFilterWhere(['like', 'performer_litiator', $this->performer_litiator]);

        return $dataProvider;
    }
}
