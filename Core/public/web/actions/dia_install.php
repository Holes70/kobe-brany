<?php

  global $db, $con, $dia;

  // Vytvara tabulku admin
  $query = "CREATE TABLE IF NOT EXISTS admin (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(55) NOT NULL,
    password varchar(55) NOT NULL
  )";

  if (!$con->query($query)) echo "Chyba";

  $query = "CREATE TABLE dia_tables(
    id int AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(55) NOT NULL,
    structure VARCHAR(255) NOT NULL
  )";

  if (!$con->query($query)) echo "Chyba";

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