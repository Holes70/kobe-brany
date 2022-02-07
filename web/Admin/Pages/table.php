<?php

  $table_products = new Component\Table("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);
  //$table_products->data([1,2,3]);
  $table_products->count(2);
  $table_products->render();