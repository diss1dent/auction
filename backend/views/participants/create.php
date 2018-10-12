<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Participants */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Participants',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Participants'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="participants-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
