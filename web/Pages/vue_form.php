<?php

  $form_users = new Components\Form("users");

  // SHOW just selected inputs
  $form_users->inputs(['first_name', 'last_name']);
  $form_users->render();

  // SHOW selected inputs with custom label names
  $form_users2 = new Components\Form("users");
  $form_users2->inputs([
    'first_name' => 'Krstne meno', 
    'last_name' => 'Priezvisko',
    'id_address' => 'Adresa'
  ]);

  $form_users2->render();

  $form_products = new Components\Form("products");
  $form_products->render();