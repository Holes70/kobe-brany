<?php

$idCart = \Core\Controllers\WebController::getParam('id');

$kosiky = new \Component\TableLarge("carts_products");
$kosiky->conditions([
  "where" => [
    "id_cart" => $idCart
  ]
]);

$kosiky ->tableButtons([
  [
    "name" => "Pridať produkt do košíka", 
    "link" => "produkt_pridat_do_kosika",
    "linkId" => "id",
    "itemData" => ["id" => $idCart]
  ]
]);
//$pridaj = new \Component\Row("carts_products");

$dia->template("
  ".$dia->cardBook(
      $dia->card(
        $kosiky->show()
      )
    )
  ."
")->render();