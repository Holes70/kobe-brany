<?php

use Component\TableLarge;
use Component\Row;

$reklamacie = new TableLarge("complaints");

$pridat = new Row("complaints");
$pridat->title("Reklamácie");

$dia->template("
  {$pridat->show()}
  ".$dia->card(
    $reklamacie ->show()
  )."
")->render();
