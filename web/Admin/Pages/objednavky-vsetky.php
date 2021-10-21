<?php

$dia->setScript("

");

$chart = new Components\Chart("bar");
$chart->labels(['Brana XL', 'Brana S', 'Zabradlie', 'Pristresok']);
$chart->data([3,4,8,5]);

$table_orders = new Components\Table("orders");
$table_orders->buttons(['edit', 'delete']);

$objednavkyHeader = $dia->vue('objednavkyHeader');

$dia->template("
  <div class='row'>
    <div class='col-6'>
      <div class='card'>
        {$objednavkyHeader->show()}
        <div class='card-body'>
          {$chart->show()}
        </div>
      </div>
    </div>
    <div class='col-6'>
    </div>
  </div>
  <div class='row mt-5'>
    <div class='col-10'>
      <div class='card'>
        {$table_orders->show()}
      </div>
    </div>
  </div>
")->render();