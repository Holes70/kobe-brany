<?php

use \Component\TableLarge;
use \Component\Row;

$zakaznici = new TableLarge("customers");

$pridat = new Row("customers");

$zakazniciQuery = $db->dbSelect(
  "customers",
);

$pocetZakaznikov = count($zakazniciQuery);

$pocetZakaznikovDlznych = 0;
$pocetZakaznikovOverenych = 0;

foreach ($zakazniciQuery as $zakaznik) {
  if ($zakaznik['state'] == 3) {
    $pocetZakaznikovDlznych++;
  }

  if ($zakaznik['state'] == 2) {
    $pocetZakaznikovOverenych++;
  }
}

$dia->template("
  {$pridat->show()}
  <div class='row'>
    <div class='col-9'>
      ".$dia->card($zakaznici->show())."
    </div>
    <div class='col-3'>
      <div class='card'>
        <div class='card-body bg-orange text-center'>
          <h5 class='color-white'>Prehľad zákazníkov</h5>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-user'></i> Počet zákazníkov: <span class='badge badge-primary bg-secondary badge-pill'>{$pocetZakaznikov}</span>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-user'></i> Počet dlžných: <span class='badge badge-primary bg-danger badge-pill'>{$pocetZakaznikovDlznych}</span>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-user'></i> Počet overených: <span class='badge badge-primary bg-success badge-pill'>{$pocetZakaznikovOverenych}</span>
        </div>
      </div>
    </div>
  </div>
")->render();
