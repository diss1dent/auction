<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\LandPlot */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Land Plot',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Land Plots'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="land-plot-update">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
