<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Lot */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Lot',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Lots'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lot-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
