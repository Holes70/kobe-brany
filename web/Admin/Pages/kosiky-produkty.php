<?php

$kosiky = new \Component\TableLarge("carts_products");
$pridaj = new \Component\Row("carts_products");

$dia->template("
  {$pridaj->show()}
  {$kosiky->show()}
")->render();