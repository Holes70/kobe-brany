<?php

use Component\TableLarge;
use Component\Row;

$produkty = new TableLarge("users");

$pridat = new Row("users");
$pridat->title("Uživatelia administrácie");

$dia->template("
  {$pridat->show()}
  ".$dia->card(
    $produkty->show()
  )."
")->render();
