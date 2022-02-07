<?php

use \Component\TableLarge;
use \Component\Row;

$zakaznici = new TableLarge("customers");

$pridat = new Row("customers");

$dia->template("
  {$pridat->show()}
  ".$dia->card($zakaznici->show())."
")->render();
