<?php

global $db;

$idFaktura = reset($db->dbSelect(
  "invoices",
  [
    "whereArray" => [
      ["id", "=", $_GET['id_form']]
    ]
  ]
));

if (!empty($idFaktura)) {
  if ($idFaktura['state'] == 1) {
    header("Location: faktury-vystavene?id_form={$idFaktura['id']}");
  } else {
    header("Location: faktury-zaplatene?id_form={$idFaktura['id']}");
  }
}

