<?php

$navigacia = new \Component\Table("web_navbar");

$dia->template(
  $dia->cardBook(
    $dia->card(
      $navigacia->show()
    )
  )
)->render();