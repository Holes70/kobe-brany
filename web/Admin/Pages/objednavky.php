<?php

use Component\TableLarge;
use Component\Row;
use Component\Button;

$idForm = \Core\Controllers\WebController::getParam('id_form');

$objednavky = new TableLarge("orders");

if ($idForm > 0) {
  $objednavky->conditions([
    "where" => [
      "id" => $idForm
    ]
  ]);
}
$objednavky->emptyDataMessage("Žiadne objednávky");

$pridat = new Row("orders");

$novyKosik = new Button("carts");
$novyKosik->title("Nový košik");
$novyKosik->button("success");
$novyKosik->modalComponentToRender("dia-form");
$novyKosik->modalComponentToRenderParams([
  "tableName" => 'carts',
  "data" => [],
  "conditions" => []
]);

$dia->template("
  {$pridat->show()}
  <div class='row'>
    <div class='col-9'>
    ".$dia->card($objednavky->show())."
    </div>
    <div class='col-3'>
      <div class='card'>
        <div class='card-body bg-orange text-center'>
          <h5 class='color-warning'>Objednávky</h5>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <h5>Vytvorenie novej objednávky</h5>
          <p>Vytvoriť nový nákupný košík:{$novyKosik->show()}</p>
        </div>
      </div>
    </div>
  </div>
")->render();
