<?php

  $dia->vue("testParams")->render(); // web/components/testParams.vue

  $dia->html("
    <div 
      class='row'
    >
    <div
      class='col-6'
    >
  ")->render();

  $table_products = new Component\Table("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);
  $table_products->render();

  $dia->html("
    </div>
    <div 
      class='col-6'
      style='background:#9591c2'
    >
  ")->render();

  $table_products = new Component\Table("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);
  $table_products->render();

  $dia->html("</div></div>")->render();

  $table_products->render();

  $dia->html("
    <div style='background:red'>
      Ahoj
    </div>
  ")->render();

  $dia->html("
  <form class='navbar-form navbar-left' role='search'>
  <div class='form-group'>
    <input type='text' class='form-control' placeholder='Search'>
  </div>
  <button type='submit' class='btn btn-default'>Submit</button>
</form>
  ")->render();

  $dia->vue("testParams")->render(); // web/components/testParams.vue

?>