<?php

$produkty = new Components\TableLarge("products");

// Vyber iba produktu s typom 1 cize custom produkt
$produkty->conditions([
  'where' => [
    'type' => 1
  ]
]);

$produkty->buttons([
  ["name" => "Príslušenstvo", "link" => "prislusenstvo"],
  ["name" => "Galéria", "link" => "galeria"]
]);

$dia->template("
  {$produkty->show()}
  <div class='card mt-5'>
    <div class='card-header'>
      <h4>Galéria</h4>
    </div>
  </div>
")->render();
