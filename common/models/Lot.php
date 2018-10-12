<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "lot".
 *
 * @property int $id
 * @property int $lot_number Номер Лоту
 * @property string $date Дата проведення
 * @property string $address Місце проведення
 * @property string $organizer Організатор
 * @property string $organizer_representative Представник (уповноважена особа) Організатора
 * @property string $performer Виконавець
 * @property string $performer_edrpoy ЄДРПОУ
 * @property string $performer_address Адреса
 * @property string $performer_litiator Ліцетатор
 * @property double $starting_rent Стартова річна орендна плата
 * @property double $bidding_step Крок торгів (грн.)
 *
 * @property LotObjects[] $lotObjects
 */
class Lot extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lot';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lot_number'], 'required'],
            [['lot_number'], 'integer'],
            [['date'], 'safe'],
            [['starting_rent', 'bidding_step'], 'number'],
            [['address', 'organizer'], 'string', 'max' => 512],
            [['organizer_representative', 'performer', 'performer_edrpoy', 'performer_address', 'performer_litiator'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'lot_number' => Yii::t('app', 'Lot Number'),
            'date' => Yii::t('app', 'Date'),
            'address' => Yii::t('app', 'Address'),
            'organizer' => Yii::t('app', 'Organizer'),
            'organizer_representative' => Yii::t('app', 'Organizer Representative'),
            'performer' => Yii::t('app', 'Performer'),
            'performer_edrpoy' => Yii::t('app', 'Performer Edrpoy'),
            'performer_address' => Yii::t('app', 'Performer Address'),
            'performer_litiator' => Yii::t('app', 'Performer Litiator'),
            'starting_rent' => Yii::t('app', 'Starting Rent'),
            'bidding_step' => Yii::t('app', 'Bidding Step'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLotObjects()
    {
        return $this->hasMany(LotObjects::className(), ['lot_id' => 'id']);
    }
}
