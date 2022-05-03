<?php

global $db;

$idObjednavka = reset($db->dbSelect(
  "orders",
  [
    "whereArray" => [
      ["id", "=", $_GET['id_form']]
    ]
  ]
));

$redirect = "objednavky-";
switch ($idObjednavka['type']) {
  case 1:
    $redirect += 'nove';
  break;
  case 2:
    $redirect += 'schvalene';
  break;
  case 3:
    $redirect += 'zaplatene';
  break;
  case 4:
    $redirect += 'odovzdane';
  break;
}

header("Location: {$redirect}?id_form={$idObjednavka['id']}");
