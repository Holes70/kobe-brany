<?php

  $alert = new Alert\Component("Totto je test alert");

  $creater = new Alert\Creater();

  $alerts = new Form\Component("dia_alerts");

  foreach ($creater->getAlerts() as $x) {
    $alert = new Alert\Component($x['text']);
  
    $alert
      ->title($x['title'])
      ->footer($x['footer_text'])
      ->id($x['id'])
    ;
  }

?>