<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\LandPlot */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="land-plot-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cad_num')->textInput() ?>

    <?= $form->field($model, 'area')->textInput() ?>

    <?= $form->field($model, 'area_unit')->textInput() ?>

    <?= $form->field($model, 'purpose')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'valuation')->textInput() ?>

    <?= $form->field($model, 'obkect_of_sale')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'term_of_lease')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('frontend', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
