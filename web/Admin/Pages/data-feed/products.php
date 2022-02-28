<?php

for ($i=1;$i<=100;$i++) {
  $type = rand(1,2);
  $name = $type == 1 ? "Produkt" : "Príslušenstvo";

  $db->insert_array([
    'table' => 'products',
    'table_data' => [
      'id' => $i,
      'image' => "product_" . rand(1, 3) . ".png",
      'name' => $name . '-' . $i,	
      'description' => 'Popis', 	
      'price' => rand(0,1000),
      'available' => rand(0,1),
      'count' => rand(0,15),
      'type' => $type
    ]
  ]);
}