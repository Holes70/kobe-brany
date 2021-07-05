<?php

  global $db;
  global $dia;


  if (move_uploaded_file($_FILES['image']['tmp_name'], $dia->dir_root() . '/web/public/images/products/' . basename($_FILES['image']['name']))) {
    $db->insert_post([
      'table' => 'products',
      'redirect' => 'admin',
    ]);
  }

?>