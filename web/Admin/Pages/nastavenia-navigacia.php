<?php

use Component\Row;
use Component\Table;

$tabulkaNavigacia = new Table("dia_navbar");
$tabulkaNavigacia->buttons(['edit', 'delete']);

$pridat = new Row("dia_navbar");

$dia->template(
  $pridat->show().
  $dia->cardBook(
    $tabulkaNavigacia->show()
  )
)->render();