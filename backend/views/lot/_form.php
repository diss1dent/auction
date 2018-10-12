<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Lot */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="lot-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php echo $form->errorSummary($model); ?>

    <?php echo $form->field($model, 'lot_number')->textInput() ?>

    <?php echo $form->field($model, 'date')->textInput() ?>

    <?php echo $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'organizer')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'organizer_representative')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'performer')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'performer_edrpoy')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'performer_address')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'performer_litiator')->textInput(['maxlength' => true]) ?>

    <?php echo $form->field($model, 'starting_rent')->textInput() ?>

    <?php echo $form->field($model, 'bidding_step')->textInput() ?>

    <?= $form->field($model, 'students')->checkboxList(ArrayHelper::map($allStudents, 'id', 'name')) ?>

    <div class="form-group">
        <?php echo Html::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
