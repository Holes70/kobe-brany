<?php

  $alert = new Alert\Component("Totto je test alert");
  $alert
    ->title("Test title")
    ->footer("Footer text")
    ->id(1777)
    ->type(2)
  ;

  $creater = new Alert\Creater();

  foreach ($creater->getAlerts() as $item) {
    $alert = new Alert\Component($item['text']);
  
    $alert
      ->title($item['title'])
      ->footer($item['footer_text'])
      ->id($item['id'])
      ->type(3)
    ;
  }

?>