<?php

$jsonEditor = new Components\JsonEditor("dia_tables");
$dia->template(
  $dia->cardBook(
    $jsonEditor->show()
  )
)->render(); 