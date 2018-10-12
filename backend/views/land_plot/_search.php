<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\LandPlotSearch */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="land-plot-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php echo $form->field($model, 'id') ?>

    <?php echo $form->field($model, 'cad_num') ?>

    <?php echo $form->field($model, 'area') ?>

    <?php echo $form->field($model, 'area_unit') ?>

    <?php echo $form->field($model, 'purpose') ?>

    <?php // echo $form->field($model, 'valuation') ?>

    <?php // echo $form->field($model, 'obkect_of_sale') ?>

    <?php // echo $form->field($model, 'address') ?>

    <?php // echo $form->field($model, 'term_of_lease') ?>

    <div class="form-group">
        <?php echo Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?php echo Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
