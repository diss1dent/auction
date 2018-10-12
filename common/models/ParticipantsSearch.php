<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Participants;

/**
 * ParticipantsSearch represents the model behind the search form about `common\models\Participants`.
 */
class ParticipantsSearch extends Participants
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'bank_account', 'bank_mfo', 'edrpoy'], 'integer'],
            [['nane', 'address', 'representative', 'representative_authority'], 'safe'],
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
        $query = Participants::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'bank_account' => $this->bank_account,
            'bank_mfo' => $this->bank_mfo,
            'edrpoy' => $this->edrpoy,
        ]);

        $query->andFilterWhere(['like', 'nane', $this->nane])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'representative', $this->representative])
            ->andFilterWhere(['like', 'representative_authority', $this->representative_authority]);

        return $dataProvider;
    }
}
