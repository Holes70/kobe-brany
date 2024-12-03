<?php

$objednavkyQuery = $db->dbSelect(
  "carts_products",
  [
    "select" => "products.type as type, products.name as name, SUM(products.price) as suma",
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
    "order_by" => "suma"
  ]
);

$objednaneProdukty = [];
$objednaneProduktyCenaSpolu = [];
$objednanePrislusenstvo = [];
$objednanePrislusenstvoCenaSpolu = [];
foreach ($objednavkyQuery as $objednavka) {
  if ($objednavka["type"] == 1) {
    array_push($objednaneProdukty, $objednavka["name"]);
    array_push($objednaneProduktyCenaSpolu, $objednavka["suma"]);
  } else {
    array_push($objednanePrislusenstvo, $objednavka["name"]);
    array_push($objednanePrislusenstvoCenaSpolu, $objednavka["suma"]);
  }
}

$produktyGraf = new Component\Chart("pie");
$produktyGraf->labels($objednaneProdukty);
$produktyGraf->data($objednaneProduktyCenaSpolu);

$prislusenstvoGraf = new Component\Chart("pie");
$prislusenstvoGraf->labels($objednanePrislusenstvo);
$prislusenstvoGraf->data($objednanePrislusenstvoCenaSpolu);

$table_products = new Component\Table("products");
$table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|€' => 'Cena']);

$timer = new Component\Timer();

$test_tiket = new Component\Tiket();

$dia->template("
  <div class='row'>
    <div class='col-6'>
      <div class='card'>
        <h4 class='card-header text-center'>Tržba z produktov</h4>
        <div class='card-body'>
          {$produktyGraf->show()}
        </div>
      </div>
    </div>
    <div class='col-6'>
      <div class='card'>
        <h4 class='card-header text-center'>Tržba z príslušenstva</h4>
        <div class='card-body'>
          {$prislusenstvoGraf->show()}
        </div>
      </div>
    </div>
  </div>

  <div class='line'></div>

  <div class='row mb-5 ml-1 mr-1'>
    <div class='card' style='width:100%'>
      <div class='card-body'>
        <h4 id='specific-markup-required-for-dismiss-on-next-click'>Rýchly prehľad všetkých produktov</h4>
        <p>
          Rýchly prehľad všetkých produktov, prehľad Vám umožní produkty len <code class='highlighter-rouge'>prezerať</code> ale nie mazať. 
          Presunte sa do <code class='highlighter-rouge'><a href=produkty'>produktov</a></code> alebo do <code class='highlighter-rouge'><a href='male-produkty'>príslušenstva</a></code> cez priamy odkaz.
        </p>
      </div>
    </div>
  </div>

  <div class='row'>
    <div class='col-12'>
      <div class='card'>
        <div clas='card-body'>
          {$table_products->show()}
        </div>
      </div>
    </div>
    <div class='col-3'>
      {$test_tiket->show()}
    </div>
  </div>
")->render();