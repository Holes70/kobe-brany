<?php

  global $db, $con, $dia;

  // Vytvara tabulku admin
  $query = "CREATE TABLE IF NOT EXISTS admin (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(55) NOT NULL,
    password varchar(55) NOT NULL
  )";

// TO DO
/*
  // Vytvara tabulku alerts
  $query = "CREATE TABLE IF NOT EXISTS admin (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(55) NOT NULL,
    password varchar(55) NOT NULL
  )";

  // Vytvara tabulku navbar
  $query = "CREATE TABLE IF NOT EXISTS admin (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(55) NOT NULL,
    password varchar(55) NOT NULL
  )";
*/

  if (!$con->query($query)) echo "Chyba"; 

  $db->insert([
    'table' => 'admin',
  ]);

  $dia->redirect('home', 
    [
      'type' => 'success',
      'text' => "Úspešne sa ti podarilo ma nainštalovať ✔️",
    ]
  );

?>