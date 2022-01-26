<?php

use Components\Row;
use Components\Table;

$tabulkaNavigacia = new Table("menu");
$tabulkaNavigacia->buttons(['edit', 'delete']);

$pridat = new Row("menu");

$dia->template(
  $pridat->show().
  $dia->cardBook(
    $tabulkaNavigacia->show()
  )
)->render();