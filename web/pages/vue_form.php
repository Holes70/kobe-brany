<?php

  $form_users = new Form\Component("users");

  // SHOW just selected inputs
  $form_users->inputs(['first_name', 'last_name']);

  // SHOW selected inputs with custom label names
  $form_users2 = new Form\Component("users");
  $form_users2->inputs([
    'first_name' => 'Krstne meno', 
    'last_name' => 'Priezvisko'
  ]);

  $form_products = new Form\Component("products");