<?php

  $alert = new Components\Alert("Totto je test alert");
  $alert
    ->title("Test title")
    ->footer("Footer text")
    ->id(1777)
    ->type(2)
  ;

  $creater = new Components\Creater();

  foreach ($creater->getAlerts() as $item) {
    $alert = new Components\Alert($item['text']);
  
    $alert
      ->title($item['title'])
      ->footer($item['footer_text'])
      ->id($item['id'])
      ->type(3)
    ;
  }

?>