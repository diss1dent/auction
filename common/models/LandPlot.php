<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "land_plot".
 *
 * @property int $id
 * @property string $cad_num кадастровый номер
 * @property double $area площадь
 * @property string $area_unit ед.измерения
 * @property string $purpose целевое назначение
 * @property double $valuation нормативная оценка
 * @property string $obkect_of_sale Об’єкт продажу
 * @property string $address Місце розташування 
 * @property string $term_of_lease Строк оренди 
 */
class LandPlot extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'land_plot';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cad_num'], 'string'],
            [['area', 'area_unit'], 'required'],
            [['area', 'valuation'], 'number'],
            [['area_unit'], 'string', 'max' => 11],
            [['purpose', 'obkect_of_sale', 'address', 'term_of_lease'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'cad_num' => Yii::t('app', 'Cad Num'),
            'area' => Yii::t('app', 'Area'),
            'area_unit' => Yii::t('app', 'Area Unit'),
            'purpose' => Yii::t('app', 'Purpose'),
            'valuation' => Yii::t('app', 'Valuation'),
            'obkect_of_sale' => Yii::t('app', 'Obkect Of Sale'),
            'address' => Yii::t('app', 'Address'),
            'term_of_lease' => Yii::t('app', 'Term Of Lease'),
        ];
    }
}
