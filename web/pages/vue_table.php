<?php

  //Ukazka vstavanej komponenty TABLE v DIE
  //Volanie:
  //$nejaky_nazov = new Table\Component("sem_nazov_tabulky");
  /*
    $nejaky_nazov
    ->columns(['id' => 'ID', 'first_name' => 'Meno', 'email' => 'Email'])
    ->columnStyle(['id' => 'color:red;font-size:33px'])
    ->rowStyle(['id' => ['5', 'background:red']])
    ->buttons(['edit', 'delete'])
    ->formInputs(['id', 'first_name'])
  ;
  */
  $table_products = new TableVue\Component("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);

  $table_users = new TableVue\Component("users");
  $table_users
    ->columns(['id' => 'ID', 'first_name' => 'Meno', 'email' => 'Email'])
    ->columnStyle(['id' => 'color:red;font-size:33px'])
    ->rowStyle(['id' => ['5', 'background:red']])
    ->buttons(['edit', 'delete'])
    ->formInputs(['id', 'first_name'])
  ;

  $alert = new Alert\Component("Totto je test alert");

  $table_products = new TableVue\Component("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit']);


