<?php

$produkty = new Components\TableLarge("products");

// Vyber iba produktu s typom 1 cize custom produkt
$produkty->conditions([
  'where' => [
    'type' => 1
  ]
]);

$produkty->buttons([
  ["name" => "Príslušenstvo", "link" => "prislusenstvo"]
]);

$galeria = new \Components\Gallery("products_gallery");

$dia->template(
  $dia->cardBook("
    <div class='card'>
      {$produkty->show()}
    </div>
    <div class='card mt-5'>
      <div class='card-header'>
        <h4>Galéria</h4>
      </div>
      {$galeria->show()}
    </div>
  ")
)->render();
