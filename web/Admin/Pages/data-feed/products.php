<?php

for ($i=1;$i<=100;$i++) {
  $type = rand(1,2);
  $name = $type == 1 ? "Produkt" : "Príslušenstvo";
  $price = rand(0,1000);

  $db->insert_array([
    'table' => 'products',
    'table_data' => [
      'id' => $i,
      'image' => ($type == 1 ? "product_" : "prislusenstvo_") . rand(1, 3) . ".jpg",
      'name' => $name . '-' . $i,	
      'description' => 'Popis', 	
      'price' => $price,
      'vat' => 20,
      'price_without_vat' => round(($price / 1.20), 2),
      'available' => rand(0,1),
      'count' => rand(0,15),
      'type' => $type,
      'state' => rand(1, 3),
      'discount' => (rand(1, 5) == 3) ? 20 : null
    ]
  ]);
}