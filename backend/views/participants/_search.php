<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ParticipantsSearch */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="participants-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php echo $form->field($model, 'id') ?>

    <?php echo $form->field($model, 'nane') ?>

    <?php echo $form->field($model, 'address') ?>

    <?php echo $form->field($model, 'representative') ?>

    <?php echo $form->field($model, 'representative_authority') ?>

    <?php // echo $form->field($model, 'bank_account') ?>

    <?php // echo $form->field($model, 'bank_mfo') ?>

    <?php // echo $form->field($model, 'edrpoy') ?>

    <div class="form-group">
        <?php echo Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?php echo Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
