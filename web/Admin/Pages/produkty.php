<?php

$produkty = new Components\TableLarge("products");

$dia->template("
  {$produkty->show()}
")->render();
