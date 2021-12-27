<?php

  global $db, $userController;

  $data = $db->request_data();

  try {
    $selectUserIfExists = $db->dbSelect(
      $data->tableName,
      [
        "where" => [
          $data->data->loginInput => $data->data->loginVal
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