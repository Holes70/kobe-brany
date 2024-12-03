<?php

$i = 0;

for ($i=1;$i<=10;$i++) {
  $db->insert_array([
    'table' => 'customers',
    'table_data' => [
      'id' => null, 
      'first_name' => "Meno_" . $i,
      'last_name' => "Priezvisko_" . $i,
      'email' => "zakaznik_{$i}@email.com", 
      'phone_number' =>  rand(11111111, 99999999), 
      'state' => rand(1,3),
      'password' => password_hash(123455, PASSWORD_BCRYPT)
    ]
    ]);
}