<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\LandPlotSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Land Plots');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="land-plot-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php echo Html::a(Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Land Plot',
]), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php echo GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'cad_num:ntext',
            'area',
            'area_unit',
            'purpose',
            // 'valuation',
            // 'obkect_of_sale',
            // 'address',
            // 'term_of_lease',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
