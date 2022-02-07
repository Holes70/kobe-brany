<?php

global $db, $webController;

$accessory = $db->dbSelect(
  "products_accessories",
  [
    "where" => [
      "id_product" => \Core\Controllers\WebController::getParam("id_product"),
      "id_product_accessory" => \Core\Controllers\WebController::getParam("id_accessory")
    ]
  ]
);

$id = reset($accessory)['id'];

require ("{$this->rootDir}/Core/Actions/dia_delete_get.php");

\Core\Controllers\WebController::redirect("prislusenstvo?id=" . \Core\Controllers\WebController::getParam("id_product"). "&previous_page=produkty&previous_page_id_form=" . \Core\Controllers\WebController::getParam("id_product"));

