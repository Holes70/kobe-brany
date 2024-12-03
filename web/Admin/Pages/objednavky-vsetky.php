<?php

$objednavkyQuery = $db->dbSelect(
  "carts_products",
  [
    "select" => "products.type as type, products.name as name, COUNT(products.id) as pocet",
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
      ["carts.is_order", "=", 1]
    ],
    "group_by" => "type, name",
    "order_by" => "products.id"
  ]
);

$objednaneProdukty = [];
$objednaneProduktyCenaSpolu = [];
$objednanePrislusenstvo = [];
$objednanePrislusenstvoCenaSpolu = [];
foreach ($objednavkyQuery as $objednavka) {
  if ($objednavka["type"] == 1) {
    array_push($objednaneProdukty, $objednavka["name"]);
    array_push($objednaneProduktyCenaSpolu, $objednavka["pocet"]);
  } else {
    array_push($objednanePrislusenstvo, $objednavka["name"]);
    array_push($objednanePrislusenstvoCenaSpolu, $objednavka["pocet"]);
  }
}

// Vyber mena produktu a pocet
$orders = $db->dbSelect(
  'orders',
  [
    "select" => "products.name, COUNT(products.id) as pocet",
    "join" => [
      "products" => [
        "id_cart",
        "id"
      ]
    ],
    "group_by" => "products.name",
    "order_by" => "products.id DESC"
  ]
);

$orders_names = [];
$orders_count = [];

foreach ($orders as $value) {
  array_push($orders_names, $value['name']);
  array_push($orders_count, $value['pocet']);
}

$chart = new Component\Chart("bar");
$chart->labels($objednaneProdukty);
$chart->data($objednaneProduktyCenaSpolu);

$table_orders = new Component\Table("orders");
$table_orders->columns([
  "id" => "id",
  'serial_number' => "Seriové číslo", 
  "type" => "Typ",	
  "count" => "Počet"
]);
$table_orders->buttons(['edit', 'delete']);

$objednavkyHeader = $dia->vue('objednavkyHeader');

// Vyber typ a pocet 
$orders_types = $db->dbSelect(
  "orders",
  [
    "select" => "
      order_type.id as id,
      order_type.name,
      CASE
        WHEN orders.type = 1 THEN 'objednavky-nove'
        WHEN orders.type = 2 THEN 'objednavky-schvalene'
        WHEN orders.type = 3 THEN 'objednavky-zaplatene'
        WHEN orders.type = 4 THEN 'objednavky-hotove'
        WHEN orders.type = 5 THEN 'objednavky-odovzdane'
      END as typ_url,
      COUNT(orders.id_cart) as pocet
    ",
    "join" => [
      "order_type" => [
        "type",
        "id"
      ]
    ],
    "group_by" => "order_type.name, typ_url"
  ]
);

$typ_objednavky_listgroup = new Component\ListGroup($orders_types);
$typ_objednavky_listgroup->title("name");
$typ_objednavky_listgroup->bubble("pocet");
$typ_objednavky_listgroup->url("typ_url");

$includeListgroup = $dia->createVue(include("Objednavky/Vsetky/listgroup.php"));

$grafTrzby = new Component\Chart("pie");
$grafTrzby->labels($objednanePrislusenstvo);
$grafTrzby->data($objednanePrislusenstvoCenaSpolu);

$dia->template("
  <div class='row'>
    <div class='col-lg-6 col-md-12 col-sm-12'>
      <div class='d-flex flex-column'>
        <div class='p-1'>
          <div class='card'>
            <h4 class='card-header text-center'>
              Objednané produkty
            </h4>
            <div class='card-body'>
              {$chart->show()}
            </div>
          </div>
        </div>
        <div class='p-1'>
          <div class='card mt-5 mb-5'>
            <div class='card-body'>
              <h5 class='card-title'>Objednávky čakajúce na schválenie</h5>
              <p class='card-text'>
                <code class='highlighter-rouge'>
                  Objednávky pred začatím práce treba scháliť a vystaviť záverečnú predfaktúru.
                </code>
              </p>
              <a href='objednavky-nove' class='btn btn-primary'>Otvoriť nové objednávky</a>
            </div>
          </div>
        </div>
        <div class='p-1'>
          <div class='card'>
            <h4 class='card-header text-center'>
              Objednané príslušenstvo
            </h4>
            <div class='card-body'>
              {$grafTrzby->show()}
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class='col-lg-6 col-md-12 col-sm-12'>
      <div class='d-flex flex-column'>
        <div class='p-2'>
          {$typ_objednavky_listgroup->show()}
        </div>
        <div class='card mt-5 mb-4'>
          <div class='card-body'>
            <h5 class='card-title'>Všetky objednávky</h5>
            <p class='card-text'>
              <code class='highlighter-rouge'>
                Zobraziť všetky objednávky na samostatnej stránke
              </code>
            </p>
            <a href='objednavky' class='btn btn-warning'>Zobraziť všetky objednávky</a>
          </div>
        </div>
        <div class='p-2'>
          <div class='card mt-5'>
            <h4 class='card-header text-center'>
              Všetky objednávky
            </h4>
            <div class='card-body'>
              {$table_orders->show()}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
")->render();