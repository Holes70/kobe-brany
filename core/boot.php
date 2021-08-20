<?php

  require_once('config.php');

  // NASTAVENIA DATABAZY
  $con = new Mysqli(
    $config['db']['host'],
    $config['db']['user'],
    $config['db']['password'],
    $config['db']['db'],
  );

  if ($con->connect_error) {
    die("Connection failed " . $con->connect_error);
  }

  // PRILEPENIE DIE
  require_once('core/Dia.php');

  $dia = new Core\Dia();

?>