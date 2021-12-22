<?php

$productId = $webController->getParam('previous_page_id_form');

$galeria = new \Components\Gallery("products_gallery");
$galeria->conditions([
  "where" => [
    "id_product" => (int) $productId,
  ],
  "join" => [
    "gallery" => [
      "id_gallery",
      "id"
    ]
  ]
]);

$dia->template(
  $dia->cardBook(
    $dia->card(
      $galeria->show()
    )
  )
)->render();