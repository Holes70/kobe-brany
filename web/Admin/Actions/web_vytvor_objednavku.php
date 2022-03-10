<?php

use Core\Controllers\UserController;

  global $db;

  $data = json_decode(json_encode($db->request_data()), true);
  $customer = $data['customer'];

  $_SESSION['customer'] = $customer;

  $db->update(
    "customers",
    $customer["id"],
    [
      "first_name" => $customer["first_name"],
      "last_name" => $customer["last_name"],
      "phone_number" => $customer["phone_number"],
    ]
  );

  $idOrder = $db->insert_array([
    'table' => "orders",
    'table_data' => [
      "serial_number" => 9999,
      "first_name" => $customer["first_name"],
      "last_name" => $customer["last_name"],
      "email" => $customer["email"],
      "phone" => $customer["phone_number"],
      "type" => 1,
      "id_customer" => \Core\Controllers\UserController::getLoggedCustomerId(),
      "id_cart" => \Core\Controllers\UserController::getCustomerIdCart()
    ]
  ]);

  $idCart = \Core\Controllers\UserController::getCustomerIdCart();

  $db->update(
    tableName: "carts",
    rowId: (int)$idCart,
    data: ["is_order" => 1]
  );


  echo $idOrder;

?>