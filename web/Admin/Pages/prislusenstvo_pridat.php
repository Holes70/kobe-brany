<?php
$prislusenstvo = new Components\TableLarge("products");
$prislusenstvo->emptyDataMessage("Žiadne príšlušenstvo pre produkt");
$prislusenstvo->conditions([
  "whereArray" => [
    ["type", "=", 2]
  ]
]);
$prislusenstvo->fileDir("products");

$dia->template(
  $dia->cardBook(
    $prislusenstvo->show()
  )
)->render();
