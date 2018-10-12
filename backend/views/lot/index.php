<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\LotSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Lots');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lot-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php echo Html::a(Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Lot',
]), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php echo GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'lot_number',
            'date',
            'address',
            'organizer',
            // 'organizer_representative',
            // 'performer',
            // 'performer_edrpoy',
            // 'performer_address',
            // 'performer_litiator',
            // 'starting_rent',
            // 'bidding_step',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
