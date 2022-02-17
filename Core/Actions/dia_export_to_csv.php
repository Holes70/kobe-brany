<?php

global $db;

$dataToCsv = $db->dbSelect(
  \Core\Controllers\WebController::getParam("tableName"),
  (array)\Core\Controllers\WebController::getParam("conditions")
);

\Core\Bice::download("data_export_" . date("Y-m-d") . ".csv");
\Core\Bice::csv($dataToCsv);