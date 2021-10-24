<?php

// Vyber mena produktu a pocet
$orders = $db->dbSelect(
  tableName: 'orders',
  conditions: [
    "select" => "products.name, COUNT(products.id) as pocet",
    "join" => [
      "products" => [
        "id_product",
        "id"
      ]
    ],
    "group_by" => "products.name"
  ]
);

$orders_names = [];
$orders_count = [];

foreach ($orders as $value) {
  array_push($orders_names, $value['name']);
  array_push($orders_count, $value['pocet']);
}

$chart = new Components\Chart("bar");
$chart->labels($orders_names);
$chart->data($orders_count);

$table_orders = new Components\Table("orders");
$table_orders->columns([
  'serial_number' => "Seriové číslo", 
  "type" => "Typ",	
  "count" => "Počet"]
);
$table_orders->buttons(['edit', 'delete']);

$objednavkyHeader = $dia->vue('objednavkyHeader');

// Vyber typ a pocet 
$orders_types = $db->dbSelect(
  tableName: "orders",
  conditions: [
    "select" => "
      order_type.id as id,
      order_type.name,
      CASE
        WHEN orders.id_type = 1 THEN 'objednavky-nove'
        WHEN orders.id_type = 2 THEN 'objednavky-schvalene'
        WHEN orders.id_type = 3 THEN 'objednavky-zaplatene'
        WHEN orders.id_type = 4 THEN 'objednavky-hotove'
        WHEN orders.id_type = 5 THEN 'objednavky-odovzdane'
      END as typ_url,
      COUNT(orders.id_product) as pocet
    ",
    "join" => [
      "order_type" => [
        "id_type",
        "id"
      ]
    ],
    "group_by" => "order_type.name, typ_url"
  ]
);

$typ_objednavky_listgroup = new Components\ListGroup($orders_types);
$typ_objednavky_listgroup->title("name");
$typ_objednavky_listgroup->bubble("pocet");
$typ_objednavky_listgroup->url("typ_url");

$typy_objednavok_collapse = new Components\Collapse($orders_types);
$typy_objednavok_collapse->title("name");

$dia->template("
  <div class='row'>
    <div class='col-6'>
      <div class='card'>
        <h4 class='card-header text-center'>
          Objednané produkty
        </h4>
        <div class='card-body'>
          {$chart->show()}
        </div>
      </div>
    </div>
    <div class='col-6'>
      <div class='d-flex flex-column'>
        <div class='p-2'>
          {$typ_objednavky_listgroup->show()}
        </div>
        <div class='p-2'>
          {$typy_objednavok_collapse->show()}
        </div>
      </div>
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