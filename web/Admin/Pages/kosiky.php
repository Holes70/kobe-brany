<?php

$kosiky = new \Component\TableLarge("carts");
$pridaj = new \Component\Row("carts");

$dia->template("
  {$pridaj->show()}
  {$kosiky->show()}
")->render();