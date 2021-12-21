<?php

$tabulkaNavigacia = new Components\Table("dia_navbar");
$tabulkaNavigacia->buttons(['edit', 'delete']);

$dia->template(
  $dia->cardBook(
    $tabulkaNavigacia->show()
  )
)->render();