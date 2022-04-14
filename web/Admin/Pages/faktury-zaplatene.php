<?php

use Component\TableLarge;
use Component\Row;

$fakturyVystavene = new TableLarge("invoices");
$fakturyVystavene->conditions([
  "select" => "invoices.*, orders.id as id_order, orders.serial_number as serial_number",
  "where" => [
    "state" => 2
  ],
  "join" => [
    "orders" => [
      "id",
      "id_invoice"
    ]
  ],
  "order_by" => "invoices.id"
]);
$fakturyVystavene->emptyDataMessage("Žiadne zaplatené faktúry");

$dia->template("
  <div class='dia-row mb-3'>
    <div class='row m-1'>
      <div class='col-10 text-left'>
        <h3 class='dia-row-title text-danger'>Vystavovanie faktúr je možné iba cez objednávky</h3>
      </div>
      <div class='col-2 text-right float-right'>
        <a href='objednavky' class='btn mb-2 mb-md-0 btn-danger btn-block'><span>Objednávky</span> 
          <div class='icon d-flex align-items-center justify-content-center'>
            <i class='fas fa-donate' aria-hidden='true'></i>
          </div>
        </a>
      </div>
    </div>
  </div>
  {$fakturyVystavene->show()}
")->render();
