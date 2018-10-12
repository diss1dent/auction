<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\LotSearch */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="lot-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php echo $form->field($model, 'id') ?>

    <?php echo $form->field($model, 'lot_number') ?>

    <?php echo $form->field($model, 'date') ?>

    <?php echo $form->field($model, 'address') ?>

    <?php echo $form->field($model, 'organizer') ?>

    <?php // echo $form->field($model, 'organizer_representative') ?>

    <?php // echo $form->field($model, 'performer') ?>

    <?php // echo $form->field($model, 'performer_edrpoy') ?>

    <?php // echo $form->field($model, 'performer_address') ?>

    <?php // echo $form->field($model, 'performer_litiator') ?>

    <?php // echo $form->field($model, 'starting_rent') ?>

    <?php // echo $form->field($model, 'bidding_step') ?>

    <div class="form-group">
        <?php echo Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?php echo Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
