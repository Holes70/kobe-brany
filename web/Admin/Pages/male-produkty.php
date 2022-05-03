<?php

use Component\TableLarge;
use Component\Row;

$produkty = new TableLarge("products");

// Vyber iba produktu s typom 1 cize custom produkt
$produkty->conditions([
  'where' => [
    'type' => 2
  ]
]);

$produktyQuery = $db->dbSelect(
  "products",
  [
    "where" => [
      "type" => 2
    ]
  ]
);

$pocetProduktov = count($produktyQuery);

$pocetProduktovNedostupnych = 0;

foreach ($produktyQuery as $produkt) {
  if (!$produkt['available']) {
    $pocetProduktovNedostupnych++;
  }
}

$produktyLabels = [];
$produktyCount = [];

foreach ($produktyQuery as $value) {
  array_push($produktyLabels, $value['name']);
  array_push($produktyCount, $value['count']);
}

$pridat = new Row("products");
$pridat->title("Príslušenstvo");

$dia->template("
  {$pridat->show()}
  <div class='row'>
    <div class='col-9'>
      ".$dia->card($produkty->show())."
    </div>
    <div class='col-3'>
      <div class='card'>
        <div class='card-body bg-primary text-center'>
          <h5 class='color-white'>Prehľad príslušenstva</h5>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-th-large'></i> Spolu príslušenstva: <span class='badge badge-primary bg-secondary badge-pill'>{$pocetProduktov}</span>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-th-large'></i> Počet nedostupných: <span class='badge badge-primary bg-danger badge-pill'>{$pocetProduktovNedostupnych}</span>
        </div>
      </div>
      <div class='mt-5'>
        <dia-export-csv :params='{
          tableName: \"products\",
          data: {},
          conditions: {\"where\":{\"type\":1}},
          button: \"success\",
          title: \"Exportovať do CSV\",
          icon: \"fas fa-file-csv\",
        }'></dia-export-csv>
      </div>
      <div class='mt-2'>
        <dia-button :params='{
          button: \"limet\",
          title: \"Počet skladom\",
          icon: \"fas fa-chart-bar\",
          modalComponentToRender: \"chart\",
          modalComponentToRenderParams: {
            type: \"bar\",
            labels: ".json_encode($produktyLabels).",
            data: ".json_encode($produktyCount).",
            id: \"produkty-graf\",
            label: \"Počet príslušenstva skladom\"
          }
        }'></dia-button>
      </div>
      <div class='mt-2'>
        <dia-button :params='{
          button: \"purple\",
          title: \"Predaj\",
          icon: \"fas fa-money-bill-wave\",
          modalComponentToRender: \"chart\",
          modalComponentToRenderParams: {
            type: \"line\",
            labels: ".json_encode($produktyLabels).",
            data: ".json_encode($produktyCount).",
            id: \"produkty-predaj\",
            label: \"Počet príslušenstva skladom\"
          }
        }'></dia-button>
      </div>
    </div>
  </div>
")->render();
