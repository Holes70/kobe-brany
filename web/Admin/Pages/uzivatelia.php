<?php

use Components\TableLarge;
use Components\Row;

$produkty = new TableLarge("users");

$pridat = new Row("users");
$pridat->title("Uživatelia administrácie");

$dia->template("
  {$pridat->show()}
  ".$dia->card(
    $produkty->show()
  )."
")->render();
