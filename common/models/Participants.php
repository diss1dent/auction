<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "participants".
 *
 * @property int $id
 * @property string $nane
 * @property string $address
 * @property string $representative
 * @property string $representative_authority
 * @property int $bank_account
 * @property int $bank_mfo
 * @property int $edrpoy
 */
class Participants extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'participants';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nane'], 'required'],
            [['bank_account', 'bank_mfo', 'edrpoy'], 'integer'],
            [['nane', 'address', 'representative', 'representative_authority'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'nane' => Yii::t('app', 'Nane'),
            'address' => Yii::t('app', 'Address'),
            'representative' => Yii::t('app', 'Representative'),
            'representative_authority' => Yii::t('app', 'Representative Authority'),
            'bank_account' => Yii::t('app', 'Bank Account'),
            'bank_mfo' => Yii::t('app', 'Bank Mfo'),
            'edrpoy' => Yii::t('app', 'Edrpoy'),
        ];
    }
}
