<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "lot_objects".
 *
 * @property int $id
 * @property int $lot_id
 * @property int $object_id
 * @property int $object_variant land plot (1)
 *
 * @property Lot $lot
 */
class LotObjects extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lot_objects';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lot_id', 'object_id'], 'required'],
            [['lot_id', 'object_id', 'object_variant'], 'integer'],
            [['lot_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lot::className(), 'targetAttribute' => ['lot_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'lot_id' => Yii::t('app', 'Lot ID'),
            'object_id' => Yii::t('app', 'Object ID'),
            'object_variant' => Yii::t('app', 'Object Variant'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLot()
    {
        return $this->hasOne(Lot::className(), ['id' => 'lot_id']);
    }
}
