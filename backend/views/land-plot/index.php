<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\LandPlotSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('frontend', 'Land Plots');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="land-plot-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('frontend', 'Create Land Plot'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'cad_num',
            'area',
            'area_unit',
            'purpose',
            //'valuation',
            //'obkect_of_sale',
            //'address',
            //'term_of_lease',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
