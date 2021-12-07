<?php

$i = 0;

for ($i=1;$i<=30;$i++) {
  $db->insert_array([
    'table' => 'customers',
    'table_data' => [
      'id' => null, 
      'id_customer_uid' => $i, 
      'first_name' => "Meno_" . $i,
      'last_name' => "Priezvisko_" . $i,
      'email' => "zakaznik_{$i}@gmail.com", 
      'phone_number' =>  rand(11111111, 99999999), 
      'password' => 123455
    ]
  ]);
}