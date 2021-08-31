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

  CREATE TABLE dia_alerts_users(
    id int AUTO_INCREMENT PRIMARY KEY,
    id_user int,
    id_alert int,
    INDEX `id_user` (`id_user`),
    INDEX `id_alert` (`id_alert`)
)
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