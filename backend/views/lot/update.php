<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Lot */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Lot',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Lots'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="lot-update">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
