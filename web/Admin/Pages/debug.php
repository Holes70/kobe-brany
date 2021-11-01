<?php

$table_orders = new Components\Table("orders");
$table_orders->columns([
  "id" => "",
  'serial_number' => "Seriové číslo", 
  "type" => "Typ",	
  "count" => "Počet"
]
);
$table_orders->buttons(['edit', 'delete']);
$table_orders->render();