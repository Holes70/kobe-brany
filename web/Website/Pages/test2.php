<?php

/**
 * Create table products
 * and add collumns with buttons
 */
$table_products = new Components\Table("products");
$table_products->columns([
  'id' => 'ID', 
  'name' => 'Meno', 
  'price|$' => 'Cena'
  ])->buttons(['edit']
);

/**
 * Call $dia->template()
 * In template can user fold his 
 * components, HTML or custom JS
 */
$template = $dia->template("
  <div class='row'>
    <div class='col-8'>
      {$table_products->show()}
    </div>
    <div class='col-4 pt-5'>
      <div class='alert alert-primary' role='alert'>
        This is a primary alert—check it out!
      </div>
      <div class='alert alert-secondary' role='alert'>
        This is a secondary alert—check it out!
      </div>
      <div class='alert alert-success' role='alert'>
        This is a success alert—check it out!
      </div>
      <div class='alert alert-danger' role='alert'>
        This is a danger alert—check it out!
      </div>
      <div class='alert alert-warning' role='alert'>
        This is a warning alert—check it out!
      </div>
      <div class='alert alert-info' role='alert'>
        This is a info alert—check it out!
      </div>
      <div class='alert alert-light' role='alert'>
        This is a light alert—check it out!
      </div>
      <div class='alert alert-dark' role='alert'>
        This is a dark alert—check it out!
      </div>
    </div>
  </div>
");

$template->render();

$user_table = new Components\Table("users");
$user_table->columns(['id' => 'id', 'first_name' => 'first_name']);

$template2 = $dia->template("
  <div class='row'>
    <div class='col-6'>
      {$table_products->show()}
    </div>
    <div class='col-6'>
      {$user_table->show()}
    </div>
  </div>
");

$template2->render();