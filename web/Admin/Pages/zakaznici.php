<?php

$zakaznici = new Components\TableLarge("customers");

$dia->template("
  {$zakaznici->show()}
")->render();
