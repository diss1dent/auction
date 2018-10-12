<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Participants */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="participants-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php echo $form->errorSummary($model); ?>

    <?php echo $form->field($model, 'nane')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'representative')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'representative_authority')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'bank_account')->textInput() ?>

    <?php echo $form->field($model, 'bank_mfo')->textInput() ?>

    <?php echo $form->field($model, 'edrpoy')->textInput() ?>

    <div class="form-group">
        <?php echo Html::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
