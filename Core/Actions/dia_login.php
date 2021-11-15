<?php

  global $db, $userController;

  $data = $db->request_data();

  try {
    $selectUserIfExists = $db->dbSelect(
      $data->params->tableName,
      [
        "where" => [
          $data->params->data->loginInput => $data->params->data->login
        ]
      ]
    );

    $userController->setUser($selectUserIfExists);
    $userController->setLogged();
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>