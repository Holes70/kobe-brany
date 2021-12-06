<?php

$prislusenstvo = new Components\TableLarge("accessories");

$dia->template("
  {$prislusenstvo->show()}
")->render();
