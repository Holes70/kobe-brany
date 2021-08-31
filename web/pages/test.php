<?php

  $dia->vue("testParams"); // web/components/testParams.vue

  $dia->html("
    <div 
      class='row'
    >
    <div
      class='col-6'
    >
  ");

  $table_products = new Components\Table("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);
  
  $dia->html("
    </div>
    <div 
      class='col-6'
      style='background:#9591c2'
    >
  ");

  $table_products = new Components\Table("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);

  $dia->html("</div></div>");

  $table_products->view();

  $dia->html("
    <div style='background:red'>
      Ahoj
    </div>
  ");

  $dia->html("
  <form class='navbar-form navbar-left' role='search'>
  <div class='form-group'>
    <input type='text' class='form-control' placeholder='Search'>
  </div>
  <button type='submit' class='btn btn-default'>Submit</button>
</form>
  ");

  $dia->vue("testParams"); // web/components/testParams.vue

?>