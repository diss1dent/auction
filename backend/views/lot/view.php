<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Lot */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Lots'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lot-view">

    <p>
        <?php echo Html::a(Yii::t('backend', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?php echo Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('backend', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?php echo DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'lot_number',
            'date',
            'address',
            'organizer',
            'organizer_representative',
            'performer',
            'performer_edrpoy',
            'performer_address',
            'performer_litiator',
            'starting_rent',
            'bidding_step',
        ],
    ]) ?>

</div>
