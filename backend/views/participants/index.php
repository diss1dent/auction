<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ParticipantsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Participants');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="participants-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php echo Html::a(Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Participants',
]), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php echo GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nane',
            'address',
            'representative',
            'representative_authority',
            // 'bank_account',
            // 'bank_mfo',
            // 'edrpoy',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
