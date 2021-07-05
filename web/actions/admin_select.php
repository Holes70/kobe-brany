<?php

  global $db;

  echo json_encode($db->select('products', [
      'join' => 'stock on products.id = stock.id_product',
    ],
    [
      'products.id', 
      'name', 
      'price', 
      'image',
      'stock.sale as sale',
      'IFNULL(stock.count, 0) as count',
    ],
  ));

?>