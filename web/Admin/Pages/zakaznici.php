<?php

use \Component\TableLarge;
use \Component\Row;

$zakaznici = new TableLarge("customers");

$pridat = new Row("customers");

$dia->template("
  {$pridat->show()}
  <div class='row'>
    <div class='col-9'>
      ".$dia->card($zakaznici->show())."
    </div>
    <div class='col-3'>
      ".$dia->card()."
      ".$dia->card()."
    </div>
  </div>
")->render();
