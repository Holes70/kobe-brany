<?php

$db->insert_array([
  'table' => 'orders',
  'table_data' => [
    'id' => null, 
    'serial_number' => 10001, 
    'type' => null, 
    'count' => 1, 
    'id_customer_uid' =>  1, 
    'id_product' =>  1, 
    'id_invoice' => null
  ]
]);

$db->insert_array([
  'table' => 'orders',
  'table_data' => [
    'id' => null, 
    'serial_number' => 10002, 
    'type' => 2, 
    'count' => 1, 
    'id_customer_uid' =>  3, 
    'id_product' =>  2, 
    'id_invoice' => null
  ]
]);

$db->insert_array([
  'table' => 'orders',
  'table_data' => [
    'id' => null, 
    'serial_number' => 10003, 
    'type' => 1, 
    'count' => 2, 
    'id_customer_uid' =>  4, 
    'id_product' =>  2, 
    'id_invoice' => 1
  ]
]);

$db->insert_array([
  'table' => 'orders',
  'table_data' => [
    'id' => null, 
    'serial_number' => 10004, 
    'type' => null, 
    'count' => 1, 
    'id_customer_uid' =>  2, 
    'id_product' =>  3, 
    'id_invoice' => 2
  ]
]);

$db->insert_array([
  'table' => 'orders',
  'table_data' => [
    'id' => null, 
    'serial_number' => 10005, 
    'type' => null, 
    'count' => 1, 
    'id_customer_uid' =>  2, 
    'id_product' =>  3, 
    'id_invoice' => null
  ]
]);

$db->insert_array([
  'table' => 'orders',
  'table_data' => [
    'id' => null, 
    'serial_number' => 10006, 
    'type' => null, 
    'count' => 1, 
    'id_customer_uid' =>  5, 
    'id_product' =>  2, 
    'id_invoice' => 2
  ]
]);