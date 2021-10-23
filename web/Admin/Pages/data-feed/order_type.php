<?php

$names = [
  'Nové',
  'Schválené',
  'Zaplatené',
  'Hotové',
  'Odovzdané'
];

foreach ($names as $name) {
  $db->insert_array([
    'table' => 'order_type',
    'table_data' => [
      'id' => null, 
      'name' => $name
    ]
  ]);
}