<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\LandPlot */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Land Plot',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Land Plots'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="land-plot-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
