<?php

$tabulkaNavigacia = new Components\Table("dia_navbar");
$tabulkaNavigacia->buttons(['edit', 'delete']);

$dia->template("
  <div class='row'>
    <div class='col-6'>
      {$tabulkaNavigacia->show()}
    </div>
    <div class='col-6'>
      <area-chart></area-chart>
    </div>
  </div>
")->render();

?>