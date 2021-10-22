<?php

// Vyber mena produktu a pocet
$orders = $db->dbSelect(
  tableName: "orders",
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