<?php

$objednavky = new Components\TableLarge("orders");

$dia->template("
  {$objednavky->show()}
")->render();
