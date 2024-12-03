<?php

  $alert = new Component\Alert("Totto je test alert");
  $alert
    ->title("Test title")
    ->footer("Footer text")
    ->id(1777)
    ->type(2)
    ->render()
  ;

  $loader = new Component\AlertLoader();

  foreach ($loader->getAlerts() as $item) {
    $alert = new Component\Alert($item['body']);

    $alert
      ->title($item['title'])
      ->footer($item['footer'])
      ->id($item['id'])
      ->type(3)
      ->render()
    ;
  }

 
  $form_products = new Component\Form("dia_alerts");
  $form_products->render();

?>