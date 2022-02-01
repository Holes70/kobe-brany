<?php

  global $db, $userController, $webController;

  $data = $webController->getPostParams();
  print_r($data); exit();
  try {
    $selectUserIfExists = $db->dbSelect(
      $data['tableName'],
      [
        "where" => [
          'email' => $data['email']
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