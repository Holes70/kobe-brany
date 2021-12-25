<?php

global $db, $webController;

$accessory = $db->dbSelect(
  "products_accessories",
  [
    "where" => [
      "id_product" => $webController->getParam("id_product"),
      "id_product_accessory" => $webController->getParam("id_accessory")
    ]
  ]
);

$id = reset($accessory)['id'];

require ("{$this->rootDir}/Core/Actions/dia_delete_get.php");

$webController->redirect("prislusenstvo?id=" . $webController->getParam("id_product"). "&previous_page=produkty&previous_page_id_form=" . $webController->getParam("id_product"));

