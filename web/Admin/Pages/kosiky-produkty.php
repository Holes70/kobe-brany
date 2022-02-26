<?php

$kosiky = new \Component\TableLarge("carts_products");
$pridaj = new \Component\Row("carts_products");

$dia->template("
  {$pridaj->show()}
  ".$dia->cardBook(
      $dia->card(
        $kosiky->show()
      )
    )
  ."
")->render();