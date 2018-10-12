<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\LandPlot */

$this->title = Yii::t('frontend', 'Create Land Plot');
$this->params['breadcrumbs'][] = ['label' => Yii::t('frontend', 'Land Plots'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="land-plot-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
