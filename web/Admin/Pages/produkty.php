<?php

use Component\TableLarge;
use Component\Row;
use Component\Button;

$produkty = new TableLarge("products");

// Vyber iba produktu s typom 1 cize custom produkt
$produkty->conditions([
  'where' => [
    'type' => 1
  ]
]);

$produkty->buttons([
  ["name" => "Príslušenstvo", "link" => "prislusenstvo", "class" => "btn btn-primary"],
  ["name" => "Galéria", "link" => "galeria", "class" => "btn btn-secondary"]
]);

$pridat = new Row("products");
$pridat->title("Produkty");

$produktyQuery = $db->dbSelect(
  "products",
  [
    "where" => [
      "type" => 1
    ]
  ]
);

$pocetProduktov = count($produktyQuery);

$pocetProduktovNedostupnych = 0;
$pocetProduktovDostupnychAleNieSkladom = 0;
$pocetProduktovDostupnychAleNieSkladomData = [];

foreach ($produktyQuery as $produkt) {
  if (!$produkt['available']) {
    $pocetProduktovNedostupnych++;
  }

  if ($produkt['available'] && $produkt['count'] == 0) {
    $pocetProduktovDostupnychAleNieSkladom++;
    $pocetProduktovDostupnychAleNieSkladomData[] = $produkt;
  }
}

$produktyLabels = [];
$produktyCount = [];

foreach ($produktyQuery as $value) {
  array_push($produktyLabels, $value['name']);
  array_push($produktyCount, $value['count']);
}

$objednavkyQuery = $db->dbSelect(
  "carts_products",
  [
    "select" => "products.name as name, COUNT(products.id) as pocet",
    "join" => [
      "products" => [
        "id_product",
        "id"
      ],
      "carts" => [
        "id_cart",
        "id"
      ]
    ],
    "whereArray" => [
      ["products.type", "=", 1],
      ["carts.is_order", "=", 1]
    ],
    "group_by" => "products.id",
    "order_by" => "pocet"
  ]
);

$objednaneProdukty = [];
$objednaneProduktyPocet = [];
foreach ($objednavkyQuery as $objednavka) {
  array_push($objednaneProdukty, $objednavka["name"]);
  array_push($objednaneProduktyPocet, $objednavka["pocet"]);
}

$zobrazNedostupne = new Button("products");
$zobrazNedostupne->title("Zobraziť");
$zobrazNedostupne->button("danger");
$zobrazNedostupne->icon("fas fa-archive");
$zobrazNedostupne->modalComponentToRender("dia-table-large");
$zobrazNedostupne->modalComponentToRenderParams([
  "tableName" => 'products',
  "data" => $pocetProduktovDostupnychAleNieSkladomData,
  "conditions" => [],
  "tableButtons" => [],
  "showSaveButton" => "true"
]);

$dia->template("
{$pridat->show()}
  <div class='row'>
    <div class='col-9'>
      ".$dia->card($produkty->show())."
    </div>
    <div class='col-3'>
      <div class='card'>
        <div class='card-body bg-danger text-center'>
          <h5 class='color-white'>Prehľad produktov</h5>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-archive'></i> Spolu produktov: <span class='badge badge-primary bg-secondary badge-pill'>{$pocetProduktov}</span>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-archive'></i> Počet nedostupných: <span class='badge badge-primary bg-danger badge-pill'>{$pocetProduktovNedostupnych}</span>
        </div>
      </div>
      <div class='card mt-2'>
        <div class='card-body'>
          <i class='fas fa-archive'></i> Dostupné ale chýbajúce skladom: <span class='badge badge-primary bg-danger badge-pill'>{$pocetProduktovDostupnychAleNieSkladom}</span>
          <div class='mt-2'>
            {$zobrazNedostupne->show()}
          </div>
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
            label: \"Počet produktov skladom\"
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
            type: \"pie\",
            labels: ".json_encode($objednaneProdukty).",
            data: ".json_encode($objednaneProduktyPocet).",
            id: \"produkty-predaj\",
            label: \"Produkty predaj\"
          }
        }'></dia-button>
      </div>
    </div>
  </div>
")->render();
