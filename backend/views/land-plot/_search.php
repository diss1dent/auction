<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\LandPlotSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="land-plot-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'cad_num') ?>

    <?= $form->field($model, 'area') ?>

    <?= $form->field($model, 'area_unit') ?>

    <?= $form->field($model, 'purpose') ?>

    <?php // echo $form->field($model, 'valuation') ?>

    <?php // echo $form->field($model, 'obkect_of_sale') ?>

    <?php // echo $form->field($model, 'address') ?>

    <?php // echo $form->field($model, 'term_of_lease') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('frontend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('frontend', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
