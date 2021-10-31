<?php

  $table_products = new Components\Table("products");
  $table_products->columns(['id' => 'ID', 'name' => 'Meno', 'price|$' => 'Cena'])->buttons(['edit', 'delete']);
  //$table_products->data([1,2,3]);
  $table_products->render();