<?php

  $alert = new Components\Alert("Totto je test alert");
  $alert
    ->title("Test title")
    ->footer("Footer text")
    ->id(1777)
    ->type(2)
    ->render()
  ;

  $loader = new Components\AlertLoader();

  foreach ($loader->getAlerts() as $item) {
    $alert = new Components\Alert($item['body']);

    $alert
      ->title($item['title'])
      ->footer($item['footer'])
      ->id($item['id'])
      ->type(3)
      ->render()
    ;
  }

 
  $form_products = new Components\Form("dia_alerts");
  $form_products->render();

?>